

-- Create Module with default options
local Module = defineModule("bx","bgfx","bx", VALUES.APP_TYPE_STATIC_LIB,
{
    BX_AMALGAMATED = 0
});

-- Setup module
Module.MainFunc = function(module)
    -- If Amalgated is used just include the amalgamated file. Remove the amalgamated file otherwise.
    if module.options.BX_AMALGAMATED == 0 then
        module.files = 
        {  
            module.dir .. "src/**.cpp", 
        };
        module.excludes =
        {
            module.dir .. "src/amalgamated.cpp"
        };
    else
        module.files =
        {
            module.dir .. "src/amalgamated.cpp"
        };
    end

    module.public.includeDirs = 
    {
        module.dir .. "include",
        module.dir .. "3rdparty",
    };

    module.public.defines = 
    {
        "BX_CONFIG_DEBUG=0" -- TODO: Add to options (?)
    }

    module.private.defines =
    {
        "__STDC_LIMIT_MACROS",
        "__STDC_FORMAT_MACROS",
        "__STDC_CONSTANT_MACROS",
    }

    if _TARGET_OS == "windows" then
        local win32Dirs = 
        {
            module.dir .. "include/compat/msvc", 
        }
        tableConcat(module.public.includeDirs, win32Dirs);

        local win32BuildOptions = 
        {
            "/Zc:__cplusplus" -- makes __cplusplus report the correct value
        }
        tableConcat(module.public.buildOptions, win32BuildOptions);
    end

    filter("system:Windows");
        links(
        { 
            "psapi"
        });
end

-- Need to be called at last
compileModule(Module);

return Module;