-- Options that are available for all modules.
-- Default BGFX Options
BGFX_GLOBAL_OPTIONS = BGFX_GLOBAL_OPTIONS or
{
    BX_AMALGAMATED       = 0, -- if BX should b compiled amalgamated
    BGFX_AMALGAMATED     = 0, -- if BGFX should be compiled amalgamated
    BGFX_BUILD_EXAMPLES  = 0,
    BGFX_BUILD_TOOLS     = 0,
    BGFX_CONFIG_MULTITHREADED = 1,
};

GLOBAL_OPTIONS = GLOBAL_OPTIONS or {};

tableAdd(GLOBAL_OPTIONS, BGFX_GLOBAL_OPTIONS);