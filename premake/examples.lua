
--cpp-bgfx\bgfx\examples\00-helloworld

function buildExample(exampleName)
    local Module = defineModule("example-"..exampleName,"bgfx/examples","bgfx", VALUES.APP_TYPE_CONSOLE_APP);



    Module.MainFunc = function(module)

        module.files = 
        {
            module.dir .."examples/"..exampleName.."/**.cpp",
            module.dir .."examples/"..exampleName.."/**.h",
        };

        module.public.includeDirs =
        {
            module.dir .."examples/"..exampleName.."/"
        };

        module.links =
        {
            {name = "example-common" ,type = "public"},
        };

        module.public.defines =
        {
            "_CRT_SECURE_NO_WARNINGS", 
            "__STDC_FORMAT_MACROS",
            "ENTRY_CONFIG_IMPLEMENT_MAIN=1",
        };

        if _TARGET_OS == "windows" then
            module.private.buildOptions =
            {
                "/ENTRY:\"mainCRTStartup\""
            }
        end

    end
    -- Need to be called at last
    compileModule(Module);

end

-- Build example-common
-- Create Module
local Module = defineModule("example-common","bgfx/examples","bgfx", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .."examples/common/**.cpp",
        module.dir .."examples/common/**.c",
        module.dir  .."examples/common/**.h",
        module.dir  .."examples/common/**.sc",
    };

    module.public.includeDirs =
    {
        module.dir .."examples/common",
    };

    module.links =
    {
        {name = "bgfx", type = "public"},
        {name = "bx", type = "public"},
        {name = "bimg", type = "public"},
        {name = "dear-imgui", type = "public"},
        {name = "meshoptimizer", type = "public"},
    };

end

-- Need to be called at last
compileModule(Module);

-- Build other examples
buildExample("00-helloworld");
buildExample("01-cubes");