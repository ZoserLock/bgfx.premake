-- Define this var to allow to know if this file was included before hand
MODULES_FILE_INCLUDED = true;

-- Global Table of compiled modules
MODULES = {};

-- Global Options Variable Can be extended by user.
GLOBAL_OPTIONS = {};

-- Global group of modules. Empty by default
GLOBAL_GROUP_STACK = {};
GLOBAL_GROUP_NAME = "";

-- Global DIR stack. Empty by default
GLOBAL_DIR_STACK = {};
GLOBAL_DIR_NAME  = "";

MAIN_BIN_DIR = _MAIN_SCRIPT_DIR .."/bin/%{cfg.name}/";
MAIN_OBJ_DIR = _MAIN_SCRIPT_DIR .."/obj/%{cfg.name}/";

-- Utility Functions
-- Function to merge 2 array
function tableConcat(t1,t2)
    for _,v in ipairs(t2) do 
        table.insert(t1, v);
    end
end

function tableAdd(t1,t2)
    for key,v in pairs(t2) do 
        t1[key] = v;
    end
end

function updateGlobalGroupName()
    GLOBAL_GROUP_NAME = "";
    for _,v in ipairs(GLOBAL_GROUP_STACK) do 
        if GLOBAL_GROUP_NAME ~= "" then
            GLOBAL_GROUP_NAME= GLOBAL_GROUP_NAME.."/"..v;
        else
            GLOBAL_GROUP_NAME = v;
        end
    end
end

-- Push a group to the local group.
function pushGlobalGroup(group)
    table.insert(GLOBAL_GROUP_STACK, group);
    
    updateGlobalGroupName();

end

function popGlobalGroup()
    if #GLOBAL_GROUP_STACK > 0 then
        table.remove(GLOBAL_GROUP_STACK, #GLOBAL_GROUP_STACK);
        updateGlobalGroupName();
    end
end

function updateGlobalDirName()
    GLOBAL_DIR_NAME = "";
    for _,v in ipairs(GLOBAL_DIR_STACK) do 
        if GLOBAL_DIR_NAME ~= "" then
            GLOBAL_DIR_NAME= GLOBAL_DIR_NAME.."/"..v;
        else
            GLOBAL_DIR_NAME = v;
        end
    end
end 

function pushGlobalDir(group)
    table.insert(GLOBAL_DIR_STACK, group);

    updateGlobalDirName();

end


function popGlobalDir()
    if #GLOBAL_DIR_STACK > 0 then
        table.remove(GLOBAL_DIR_STACK, #GLOBAL_DIR_STACK);
        updateGlobalDirName();
    end
end

-- Default Module Functions
-- Function to set configurations for all modules
function defaultConfigurationsFunction(module)
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

        defines(module.public.configDefines.debug);
        defines(module.private.configDefines.debug);

    filter("configurations:Release");
        runtime("Release");
        optimize("On");

        defines(module.public.configDefines.release);
        defines(module.private.configDefines.release);

    filter("configurations:Dist");
        runtime("Release");
        optimize("On");

        defines(module.public.configDefines.dist);
        defines(module.private.configDefines.dist);
end 

-- Function to set project defines for all modules
function defaultHeaderFunction(module)
    group(module.group);
    project(module.name);

    if module.appType == "StaticLib" then
        kind("StaticLib");
    end
    if module.appType == "SharedLib" then
        kind("SharedLib");
    end
    if module.appType == "ConsoleApp" then
        kind("ConsoleApp");
    end

    language(module.language);
    cppdialect("c++17");
    staticruntime("On"); 
    
    local binDir = MAIN_BIN_DIR .. module.group; 
    local objDir = MAIN_OBJ_DIR .. module.group; 

    if module.appType == "ConsoleApp" then
        binDir = MAIN_BIN_DIR .. module.appTarget; 
        objDir = MAIN_OBJ_DIR .. module.appTarget; 
    else
        binDir = MAIN_BIN_DIR .. "temp-libs/" ..module.group; 
        objDir = MAIN_OBJ_DIR .. "temp-libs/" ..module.group; 
    end
    

    targetdir(binDir);
    debugdir(binDir);
    objdir(objDir);
    location(module.dir);
  
    if module.pch.header and module.pch.header~="" then pchheader(module.pch.header) end;
    if module.pch.source and module.pch.source~=""then pchsource(module.pch.source) end;

end

-- User defined function. Print error if not implemented
function defaultMainFunction(module)
    premake.error("Main function of module " .. module.name .. " is not implemented");
end

-- User defined function that runs when compile
function defaultCompileFunction(module)
    -- Do nothing
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

    libdirs(
    {
        module.public.libDirs,
        module.private.libDirs,
    });

    postbuildcommands( 
    {
        module.public.postBuildCommands,
        module.private.postBuildCommands,
    });

end

-- Module functions
-- Function to create start defining a module.
function defineModule(name, localGroup, dir, appType, defaultOptions)
    -- Select global options if they are not defined select default options or empty table if none are defined
    local options =  GLOBAL_OPTIONS or defaultOptions or {};

    -- Final Dir
    local baseDir = _MAIN_SCRIPT_DIR.."/";

    if GLOBAL_DIR_NAME and GLOBAL_DIR_NAME ~= "" then
        baseDir = baseDir .. GLOBAL_DIR_NAME .."/";
    end

    if dir and dir ~= "" then
        baseDir = baseDir .. dir .."/";
    end

    -- Final Group
    local group   = "";

    if GLOBAL_GROUP_NAME and GLOBAL_GROUP_NAME ~= "" then
        group  = GLOBAL_GROUP_NAME;
    end

    if localGroup and localGroup ~= "" then
        group  = group .. "/" ..localGroup;
    end

    print ("Defining module ["..name.."] at ".. baseDir .. " with group [".. group .."]");
    
    return {
        name = name,
        group = group,
        dir = baseDir,
        language ="C++",
        appType = appType,
        appTarget = "bundle",
        options = options,
        links = {},
        files = {},
        excludes ={},

        private = {
            defines       = {},
            configDefines = { debug={}, release={}, dist={} },
            includeDirs   = {},
            libDirs       = {},
            buildOptions  = {},
            postBuildCommands = {},
        },
        
        public = {
            defines       = {},
            configDefines = { debug = {}, release = {}, dist = {} },
            includeDirs   = {},
            libDirs       = {},
            buildOptions  = {},
            postBuildCommands = {},
        },

        pch =
        {
            header = "",
            source = "",
        },
        -- Functions
        MainFunc    = defaultMainFunction,
        PremakeFunc = defaultPremakeFunction,
        SetupHeader = defaultHeaderFunction,
        SetupConfigurations = defaultConfigurationsFunction,
        CompileFunc = defaultCompileFunction,
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

    -- Run user define code at the end of compile
    module.CompileFunc(module);

    -- Remove any filter
    filter({});

    -- Link modules to current module
    for _, value in pairs(module.links) do
        local linkModule = MODULES[value.name]
        if linkModule ~= nil then
            linkToModule(module, linkModule, value.type);
        else
            if (type(value) == "table") then
                premake.error(" Unable to link to ".. value.name .." module from ".. module.name);
            else
                links({value});
            end
        end
    end
    -- Add Module to global modules.
    MODULES[module.name] = module;
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

            tableConcat(module.private.configDefines      , targetModule.public.configDefines);
            tableConcat(module.private.postBuildCommands  , targetModule.public.postBuildCommands);
        end

        if access == "public" then
            tableConcat(module.public.includeDirs        , targetModule.public.includeDirs);
            tableConcat(module.public.defines            , targetModule.public.defines);
            tableConcat(module.public.buildOptions       , targetModule.public.buildOptions);
            tableConcat(module.public.configDefines      , targetModule.public.configDefines);
            tableConcat(module.public.postBuildCommands  , targetModule.public.postBuildCommands);
        end
    end

    if access == "interface" then
        tableConcat(module.public.includeDirs, targetModule.public.includeDirs);
    end
end

