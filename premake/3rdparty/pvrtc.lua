local Module = defineModule("pvrtc","bgfx/3rdparty","bimg", "StaticLib");

Module.MainFunc = function(module)
    
    module.files = 
    {
        module.dir .. "3rdparty/pvrtc/*.cpp",
        module.dir .. "3rdparty/pvrtc/*.h",
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty/pvrtc",
    }
end

-- Need to be called at last
compileModule(Module);

return Module;