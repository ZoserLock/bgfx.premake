local Module = defineModule("nvtt","bgfx/3rdparty","bimg", "StaticLib");

Module.MainFunc = function(module)

    module.files = 
    {
        module.dir .."3rdparty/nvtt/bc6h/*.cpp",
        module.dir .."3rdparty/nvtt/bc6h/*.h",
        module.dir .."3rdparty/nvtt/bc7/*.cpp",
        module.dir .."3rdparty/nvtt/bc7/*.h",
        module.dir .."3rdparty/nvtt/nvcore/*.h",
        module.dir .."3rdparty/nvtt/nvcore/*.inl",
        module.dir .."3rdparty/nvtt/nvmath/*.cpp",
        module.dir .."3rdparty/nvtt/nvmath/*.h",
        module.dir .."3rdparty/nvtt/*.cpp",
        module.dir .."3rdparty/nvtt/*.h", 
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty/nvtt",
    }

    module.links =
    {
        {name = "bx" ,type = "public"},
    }
end

-- Need to be called at last
compileModule(Module);

return Module;
    
