-- Create Module
local Module = defineModule("glslang","bgfx/3rdparty","bgfx", "StaticLib");

Module.MainFunc = function(module)
    module.files = 
    {
         module.dir .. "3rdparty/glslang/glslang/GenericCodeGen/*.cpp",
         module.dir .. "3rdparty/glslang/glslang/MachineIndependent/*.cpp",
         module.dir .. "3rdparty/glslang/glslang/MachineIndependent/preprocessor/*.cpp",
         module.dir .. "3rdparty/glslang/glslang/HLSL/*.cpp",
         module.dir .. "3rdparty/glslang/hlsl/*.cpp",
         module.dir .. "3rdparty/glslang/SPIRV/*.cpp",
         module.dir .. "3rdparty/glslang/OGLCompilersDLL/*.cpp",
    };

    module.public.includeDirs =  
    {
        module.dir .. "3rdparty/spirv-tools/include",
        module.dir .. "3rdparty/spirv-tools/source",
        module.dir .. "3rdparty/glslang",
        module.dir .. "3rdparty/glslang/glslang/Include",
        module.dir .. "3rdparty/glslang/glslang/Public",
    }

    module.private.includeDirs =
    {
        module.dir .. "3rdparty"
    }

    module.private.defines =
    {
        "ENABLE_OPT=1",
        "ENABLE_HLSL=1",
    }
    
    if _TARGET_OS == "windows" then

        local win32Files =
        {
            module.dir .. "3rdparty/glslang/glslang/OSDependent/Windows/ossource.cpp"
        }

        tableConcat(module.files, win32Files);

        module.private.buildOptions =
        {
            "/wd4005",
            "/wd4065",
            "/wd4100",
            "/wd4127",
            "/wd4189",
            "/wd4244",
            "/wd4310",
            "/wd4389",
            "/wd4456",
            "/wd4457",
            "/wd4458",
            "/wd4702",
            "/wd4715",
            "/wd4838",
        }
    end
end

-- Need to be called at last
compileModule(Module);

return Module;