local Module = defineModule("pvrtc","bgfx/3rdparty","bimg", VALUES.APP_TYPE_STATIC_LIB);

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