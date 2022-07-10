-- Options that are available for all modules.
BFXG_GLOBAL_OPTIONS = 
{
    BX_AMALGAMATED       = 0, -- if BX should b compiled amalgamated
    BGFX_AMALGAMATED     = 0, -- if BGFX should be compiled amalgamated
    BGFX_WITH_GLFW       = 1,
    BGFX_WITH_SDL        = 0,
    BGFX_BUILD_EXAMPLES  = 0,
    BGFX_BUILD_TOOLS     = 0,
    BGFX_CONFIG_MULTITHREADED = 1,
};

GLOBAL_OPTIONS = {};

tableAdd(GLOBAL_OPTIONS, BFXG_GLOBAL_OPTIONS);

-- DEBUG
-- print("OPTIONS");
-- for key, value in pairs(GLOBAL_OPTIONS) do
    -- print(key,value)
-- end
