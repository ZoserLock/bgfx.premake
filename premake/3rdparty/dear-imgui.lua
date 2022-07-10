local Module = defineModule("dear-imgui","bgfx/3rdparty","bgfx", "StaticLib");

Module.MainFunc = function(module)

    module.files = 
    {
         module.dir .. "3rdparty/dear-imgui/*.cpp",
         module.dir .."3rdparty/dear-imgui/*.h", 
         module.dir .. "3rdparty/dear-imgui/*.inl",
    };

    module.public.includeDirs = 
    {
        module.dir .."3rdparty",
    };
    
    module.private.defines =
    {
        "_CRT_SECURE_NO_WARNINGS",
        "__STDC_FORMAT_MACROS",
    };

    module.links =
    {
        {name = "bx" ,type = "public"},
    };

end

-- Need to be called at last
compileModule(Module);

return Module;