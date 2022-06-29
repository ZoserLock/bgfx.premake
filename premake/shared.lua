-- bgfx-vertexlayout
local Module = defineModule("bgfx-vertexlayout","bgfx/shared","bgfx", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    module.files =
    {
        module.dir .."src/vertexlayout.cpp",
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty",
    };

    module.links =
    {
        {name = "bgfx" ,type = "public"}, 
    }

end

-- Need to be called at last
compileModule(Module);

-- bgfx-shader
local Module = defineModule("bgfx-shader","bgfx/shared","bgfx", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    module.files =
    {
        module.dir .."src/shader.cpp ",
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty",
    };

    module.links =
    {
        {name = "bgfx" ,type = "public"},
    };


end

-- Need to be called at last
compileModule(Module);
