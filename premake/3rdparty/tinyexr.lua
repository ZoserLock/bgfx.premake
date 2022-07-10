local Module = defineModule("tinyexr","bgfx/3rdparty","bimg", "StaticLib");

Module.MainFunc = function(module)
    
    module.files = 
    {
        module.dir .. "3rdparty/tinyexr/**.c",
        module.dir .. "3rdparty/tinyexr/**.h",
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty/tinyexr",
        module.dir .. "3rdparty/tinyexr/deps/miniz",
    }
end

-- Need to be called at last
compileModule(Module);

return Module;