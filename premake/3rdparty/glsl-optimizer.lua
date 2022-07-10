-- Create Module

local Module = defineModule("glcpp","bgfx/3rdparty","bgfx", "StaticLib");

Module.MainFunc = function(module)

    module.files =
    {
        module.dir .. "3rdparty/glsl-optimizer/src/glsl/glcpp/*.c",
        module.dir .. "3rdparty/glsl-optimizer/src/util/*.c",
    };

    module.public.includeDirs =  
    {
        module.dir .. "3rdparty/glsl-optimizer/include",
        module.dir .. "3rdparty/glsl-optimizer/src/mesa",
        module.dir .. "3rdparty/glsl-optimizer/src/mapi",
        module.dir .. "3rdparty/glsl-optimizer/src/glsl",
        module.dir .. "3rdparty/glsl-optimizer/src",
    }

    if _TARGET_OS == "windows" then
        module.public.buildOptions =
        {
            "/W0"
        };
    end
end 

-- Need to be called at last
compileModule(Module);

local Module = defineModule("mesa","bgfx/3rdparty","bgfx", "StaticLib");

Module.MainFunc = function(module)

    module.files =
    {
        module.dir .. "3rdparty/glsl-optimizer/src/mesa/program/*.c",
        module.dir .. "3rdparty/glsl-optimizer/src/mesa/main/*.c",
    };

    module.public.includeDirs =  
    {
        module.dir .. "3rdparty/glsl-optimizer/include",
        module.dir .. "3rdparty/glsl-optimizer/src/mesa",
        module.dir .. "3rdparty/glsl-optimizer/src/mapi",
        module.dir .. "3rdparty/glsl-optimizer/src/glsl",
        module.dir .. "3rdparty/glsl-optimizer/src",
    }

    if _TARGET_OS == "windows" then
        module.public.buildOptions =
        {
            "/W0"
        };
    end
end 

-- Need to be called at last
compileModule(Module);

local Module = defineModule("glsl-optimizer","bgfx/3rdparty","bgfx", "StaticLib");

Module.MainFunc = function(module)
  
    module.files =
    {
        module.dir .. "3rdparty/glsl-optimizer/src/glsl/*.cpp",
        module.dir .. "3rdparty/glsl-optimizer/src/glsl/*.c",
    };

    module.excludes =
    {
        module.dir .. "3rdparty/glsl-optimizer/src/glsl/builtin_stubs.cpp",
        module.dir .. "3rdparty/glsl-optimizer/src/glsl/main.cpp",
    }

    module.links =
    {
        {name = "glcpp" ,type = "public"},
        {name = "mesa"  ,type = "public"},
    }

    if _TARGET_OS == "windows" then
        module.public.buildOptions =
        {
            "/W0"
        };
        module.private.defines =
        {
            "__STDC__",
            "__STDC_VERSION__=199901L",
            "strdup=_strdup",
            "alloca=_alloca",
            "isascii=__isascii",
        };
    end

end

-- Need to be called at last
compileModule(Module);