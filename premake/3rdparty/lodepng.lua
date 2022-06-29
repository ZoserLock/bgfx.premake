local Module = defineModule("lodepng","bgfx/3rdparty","bimg", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)

    module.files = 
    {
        module.dir .. "3rdparty/lodepng/*.cpp",
        module.dir .. "3rdparty/lodepng/*.h",
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty/",
    }
end

-- Need to be called at last
compileModule(Module);

return Module;