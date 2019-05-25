project "glfw"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}");
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}");

    files
    {
        
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"

        files
        {
            "include",
            "src/*.h",
            "src/*.c"
        }

        defines
        {
            "_CRT_SECURE_NO_WARNINGS"
        }

    
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"