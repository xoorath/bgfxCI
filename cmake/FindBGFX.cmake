include(FindPackageHandleStandardArgs)

if (NOT BGFX_FOUND)
    if(CMAKE_BUILD_TYPE STREQUAL "Release")
        set(BGFX_RELEASE "Release")
    else()
        set(BGFX_RELEASE "Debug")
    endif()

	find_library(
		BGFX_LIBRARY
		bgfx${BGFX_RELEASE}
		PATH_SUFFIXES
		lib/bgfx
	)

	find_path(
		BGFX_INCLUDE_DIR
		bgfx
		PATH_SUFFIXES
		include
	)

	add_library(BGFX::BGFX STATIC IMPORTED)

	set_target_properties(
		BGFX::BGFX
		PROPERTIES
		IMPORTED_LOCATION
		"${BGFX_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${BGFX_INCLUDE_DIR}"
	)

    #-----------------------------------------

    find_library(
		BX_LIBRARY
		bx${BGFX_RELEASE}
		PATH_SUFFIXES
		lib/bgfx
	)

	find_path(
		BX_INCLUDE_DIR
		bx
		PATH_SUFFIXES
		include
	)

	add_library(BGFX::BX STATIC IMPORTED)

	set_target_properties(
		BGFX::BX
		PROPERTIES
		IMPORTED_LOCATION
		"${BX_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${BX_INCLUDE_DIR}"
	)

    #-----------------------------------------

    find_library(
		BIMG_LIBRARY
		bimg${BGFX_RELEASE}
		PATH_SUFFIXES
		lib/bgfx
	)

	find_path(
		BIMG_INCLUDE_DIR
		bimg
		PATH_SUFFIXES
		include
	)

	add_library(BGFX::BIMG STATIC IMPORTED)

	set_target_properties(
		BGFX::BIMG
		PROPERTIES
		IMPORTED_LOCATION
		"${BIMG_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${BIMG_INCLUDE_DIR}"
	)

    #-----------------------------------------

	find_package_handle_standard_args(BGFX DEFAULT_MSG BGFX_LIBRARY BGFX_INCLUDE_DIR BX_LIBRARY BX_INCLUDE_DIR BIMG_LIBRARY BIMG_INCLUDE_DIR)
endif()
