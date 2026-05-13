project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}");
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}");

    multiprocessorcompile "On"

    files
    {
        "include/glfw3.h",
        "include/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/platform.c",
        "src/window.c",
        "src/monitor.c",
        "src/input.c",
        "src/vulkan.c",
        "src/null_init.c",
        "src/null_window.c",
        "src/null_monitor.c",
        "src/null_joystick.c"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "off"

        files
        {
            "src/win32_init.c",
            "src/win32_window.c",
            "src/win32_time.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_thread.c",
            "src/win32_module.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines
        {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    
    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        staticruntime "on"
        optimize "on"

    filter {}
