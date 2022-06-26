function tableConcat(t1,t2)
    for _,v in ipairs(t2) do 
        table.insert(t1, v)
    end
end

SYSTEM   = _TARGET_OS;

-- Directories
BX_DIR   = _MAIN_SCRIPT_DIR .. "/bx/";
BIMG_DIR = _MAIN_SCRIPT_DIR .. "/bimg/";
BGFX_DIR = _MAIN_SCRIPT_DIR .. "/bgfx/";

BGFX_BIN_DIR = _MAIN_SCRIPT_DIR .. "/bin/%{cfg.name}/"; 
BGFX_OBJ_DIR = _MAIN_SCRIPT_DIR .. "/obj/%{cfg.name}/"; 

-- Options
OPTION_BX_AMALGAMATED       = 0;
OPTION_BGFX_AMALGAMATED     = 0;
OPTION_BGFX_BUILD_EXAMPLES  = 1;
OPTION_BGFX_BUILD_TOOLS     = 1;

-- Defines
BX_CONFIG_DEBUG           = 1;
BGFX_CONFIG_MULTITHREADED = 1;

BX_DEFINE_LIST = 
{
    "BX_CONFIG_DEBUG=".. BX_CONFIG_DEBUG,
}

BGFX_DEFINE_LIST = 
{
    "BGFX_CONFIG_MULTITHREADED=" .. BGFX_CONFIG_MULTITHREADED
}

-- Workspace
workspace("bgfxlib");
architecture("x64");
configurations(
{ 
    "Debug",
    "Release"
});

include("premake/bx.lua");
include("premake/bimg.lua");
include("premake/bgfx.lua");

if OPTION_BGFX_BUILD_TOOLS == 1 then
    include("premake/tools.lua");
end

if BGFX_BUILD_EXAMPLES == 1 then
    include("premake/examples.lua");
end