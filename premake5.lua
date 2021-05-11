workspace "ImGuiTest"
	architecture "x64"

	configurations 
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["glfw"] = "ImGuiTest/vendor/glfw/include"
IncludeDir["imgui"] = "ImGuiTest/vendor/imgui"

include "ImGuiTest/vendor/glfw"
include "ImGuiTest/vendor/imgui"

project "ImGuiTest"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
		"%{prj.name}/*.cpp"
	}

	includedirs
	{
		"ImGuiTest/src"
	}

	links
	{
		"GLFW",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

	filter "configurations:Debug"
		defines "SP_DEBUG"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "SP_RELEASE"
		buildoptions "/MD"
		optimize "On"

	
	