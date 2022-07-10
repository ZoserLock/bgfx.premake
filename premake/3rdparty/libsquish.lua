local Module = defineModule("libsquish","bgfx/3rdparty","bimg", "StaticLib");

Module.MainFunc = function(module)
    
    module.files = 
    {
        module.dir .. "3rdparty/libsquish/*.cpp",
        module.dir .. "3rdparty/libsquish/*.h",
        module.dir .. "3rdparty/libsquish/*.inl",
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty/libsquish",
    }
end

-- Need to be called at last
compileModule(Module);

return Module;