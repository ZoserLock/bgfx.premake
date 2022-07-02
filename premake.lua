-- Global Table of compiled modules
MODULES = {};

-- Global group of modules. Empty by default
GLOBAL_GROUP = "";

-- Options that are available for all modules. TODO: change name (?) add to namespace (?)
GLOBAL_OPTIONS = 
{
    BX_AMALGAMATED       = 0, -- if BX should b compiled amalgamated
    BGFX_AMALGAMATED     = 0, -- if BGFX should be compiled amalgamated
    BGFX_BUILD_EXAMPLES  = 0,
    BGFX_BUILD_TOOLS     = 1,
    BGFX_CONFIG_MULTITHREADED = 1,
};

-- Global Table of constant values (not really constants)
VALUES = 
{
    APP_TYPE_STATIC_LIB  = "APP_TYPE_STATIC_LIB",
    APP_TYPE_SHARED_LIB  = "APP_TYPE_SHARED_LIB",
    APP_TYPE_CONSOLE_APP = "APP_TYPE_CONSOLE_APP",
};

-- Function to merge 2 tables -- TODO: add to utils.
function tableConcat(t1,t2)
    for _,v in ipairs(t2) do 
        table.insert(t1, v);
    end
end

-- Module functions
-- Function to set configurations for all modules
function defaultConfigurationsFunction(module)
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");
    filter("configurations:Release");
        runtime("Release");
        optimize("On");
    filter("configurations:Dist");
        runtime("Release");
        optimize("On");
end 

-- Function to set project defines for all modules
function defaultHeaderFunction(module)
    group(module.group);
    project(module.name);

    if module.appType == VALUES.APP_TYPE_STATIC_LIB then
        kind("StaticLib");
    end
    if module.appType == VALUES.APP_TYPE_SHARED_LIB then
        kind("SharedLib");
    end
    if module.appType == VALUES.APP_TYPE_CONSOLE_APP then
        kind("ConsoleApp");
    end

    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    local binDir = _MAIN_SCRIPT_DIR .."/bin/%{cfg.name}/".. module.group; 
    local objDir = _MAIN_SCRIPT_DIR .."/obj/%{cfg.name}/".. module.group; 

    targetdir(binDir);
    objdir(objDir);

end

-- User defined function. Print error if not implemented
function defaultMainFunction(module)
    premake.error("Main function of module " .. module.name .. " is not implemented");
end

-- Function te setup a global group for all modules.
function globalGroup(group)
    GLOBAL_GROUP = group
end

-- Function to create start defining a module.
function defineModule(name, localGroup, dir, appType, defaultOptions)
    -- Select global options if they are not defined select default options or empty table if none are defined
    local options =  GLOBAL_OPTIONS or defaultOptions or {};
    local baseDir = _MAIN_SCRIPT_DIR .. "/" .. dir .. "/";
    local group   = localGroup;

    if GLOBAL_GROUP and GLOBAL_GROUP ~= "" then
        group   = (GLOBAL_GROUP .."/"..localGroup);
    end

    return {
        name = name,
        group = group,
        dir = baseDir,
        appType = appType,
        options = options,
        links = {},
        files = {},
        excludes ={},

        private = {
            defines      = {},
            includeDirs  = {},
            buildOptions = {},
        },
        
        public = {
            defines      = {},
            includeDirs  = {},
            buildOptions = {},
        },
        -- Functions
        MainFunc = defaultMainFunction,
        PremakeFunc = defaultPremakeFunction,
        SetupHeader = defaultHeaderFunction,
        SetupConfigurations = defaultConfigurationsFunction
    };
end

function compileModule(module)
    -- Run Header Function 
    module.SetupHeader(module);

    -- Run user defined Main function
    module.MainFunc(module);

    -- Remove any filter
    filter({});

    -- Fill premake data
    module.PremakeFunc(module);

    -- Remove any filter
    filter({});

    -- Apply target configurations
    module.SetupConfigurations(module);

    -- Remove any filter
    filter({});

    -- Link modules to current module
    for _, value in pairs(module.links) do
        local linkModule = MODULES[value.name]
        if linkModule ~= nil then
            linkToModule(module, linkModule, value.type);
        else
            print("Loaded Modules at this point");
            for key, value in pairs(MODULES) do
                print("["..value.group.."] -> " .. key)
            end
            premake.error("Unable to link to ".. value.name .." module from ".. module.name);
        end
    end
    -- Add Module to global modules.
    MODULES[module.name] = module;
end

function defaultPremakeFunction(module)
    files({
        module.files
    });
    excludes(
    {
        module.excludes
    });
    includedirs(
    {
        module.public.includeDirs,
        module.private.includeDirs,
    });
    defines(
    {
        module.public.defines,
        module.private.defines,
    });
    buildoptions(
    {
        module.public.buildOptions,
        module.private.buildOptions,
    });
end

-- Add the premake links to module and also add the headers files and defined if is declared as public 
function linkToModule(module, targetModule, access)

    if access ~= "interface" then

        links({
            targetModule.name
        });

        includedirs(
        {
            targetModule.public.includeDirs
        });

        defines(
        {
            targetModule.public.defines,
        });

        buildoptions(
        {
            targetModule.public.buildOptions 
        });
        if access == "private" then
            tableConcat(module.private.includeDirs   , targetModule.public.includeDirs);
            tableConcat(module.private.defines       , targetModule.public.defines);
            tableConcat(module.private.buildOptions  , targetModule.public.buildOptions);
        end

        if access == "public" then
            tableConcat(module.public.includeDirs   , targetModule.public.includeDirs);
            tableConcat(module.public.defines       , targetModule.public.defines);
            tableConcat(module.public.buildOptions  , targetModule.public.buildOptions);
        end
    end

    if access == "interface" then
        tableConcat(module.public.includeDirs, targetModule.public.includeDirs);
    end
end

-- Workspace
workspace("bgfxlib");
architecture("x64");
configurations(
{ 
    "Debug",
    "Release",
    "Dist"
});

-- Include projects
include("premake/bx.lua");
include("premake/bimg.lua");
include("premake/bgfx.lua");


if GLOBAL_OPTIONS.BGFX_BUILD_TOOLS == 1 or  GLOBAL_OPTIONS.BGFX_BUILD_EXAMPLES == 1 then
    include("premake/3rdparty/meshoptimizer.lua");
    include("premake/3rdparty/dear-imgui.lua");
    include("premake/shared.lua");
end 

if GLOBAL_OPTIONS.BGFX_BUILD_TOOLS == 1 then
    include("premake/tools.lua");
end

if GLOBAL_OPTIONS.BGFX_BUILD_EXAMPLES == 1 then
    include("premake/examples.lua");
end

-- DEBUG
print("Loaded Modules");
for key, value in pairs(MODULES) do
    print("["..value.group.."] -> " .. key)
end
