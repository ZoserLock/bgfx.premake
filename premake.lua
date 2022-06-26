
-- Directories
BX_DIR   = _MAIN_SCRIPT_DIR .. "/bx/";
BIMG_DIR = _MAIN_SCRIPT_DIR .. "/bimg/";

-- Defines
BX_CONFIG_DEBUG = 1;
BX_AMALGAMATED = 0;

BX_DEFINE_LIST = 
{
    "BX_CONFIG_DEBUG=".. BX_CONFIG_DEBUG,
    "BX_AMALGAMATED=".. BX_AMALGAMATED
}

-- Workspace
workspace("bgfxlib");
architecture("x64");
configurations(
{ 
    "Debug",
    "Release",
    "Dist",
});

include("premake/bx.lua");
include("premake/bimg.lua");
