-- This script need to have included the modules.lua functions to work. 
-- In this files is not included as is intended to use the modules.lua of the owner project.
if MODULES_FILE_INCLUDED == nil then
    premake.error("Modules files is not included and needs to be included in order to use this file.");
end

-- Add BFGX options
include("options.lua");

-- Add BFGX Modules
include("lib.lua")
