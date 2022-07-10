-- Add Module functions
include("scripts/modules.lua");

-- Add BFGX options
include("options.lua");

workspace("bgfxlib");
architecture("x64");
configurations(
{ 
    "Debug",
    "Release",
    "Dist"
});

-- BGFX Projects
include("lib.lua")