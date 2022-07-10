
-- Include projects
include("premake/bx.lua");
include("premake/bimg.lua");
include("premake/bgfx.lua");

if GLOBAL_OPTIONS.BGFX_BUILD_TOOLS == 1 or  GLOBAL_OPTIONS.BGFX_BUILD_EXAMPLES == 1 then
    include("premake/3rdparty/meshoptimizer.lua");
    include("premake/3rdparty/dear-imgui.lua");
    include("premake/shared.lua");
end 

if GLOBAL_OPTIONS.BGFX_BUILD_EXAMPLES == 1 then
    include("premake/examples.lua");
end

if GLOBAL_OPTIONS.BGFX_BUILD_TOOLS == 1 then
    include("premake/tools.lua");
end
