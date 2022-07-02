-- Create Module
local Module = defineModule("webgpu","bgfx/3rdparty","bgfx", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .."3rdparty/webgpu/include/webgpu/*.h",
        module.dir .."3rdparty/webgpu/webgpu_cpp.cpp"
    };

    module.public.includeDirs =  
    {
        module.dir .."3rdparty/webgpu/include"
    }
end

-- Need to be called at last
compileModule(Module);

return Module;