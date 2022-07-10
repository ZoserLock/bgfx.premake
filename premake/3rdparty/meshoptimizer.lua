local Module = defineModule("meshoptimizer","bgfx/3rdparty","bgfx", "StaticLib");

Module.MainFunc = function(module)

    module.files = 
    {
        module.dir .."3rdparty/meshoptimizer/src/*.cpp",
        module.dir .."3rdparty/meshoptimizer/src/*.h",
    };
end

-- Need to be called at last
compileModule(Module);

return Module;