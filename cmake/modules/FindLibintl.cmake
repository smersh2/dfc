# Try to find Libintl functionality
# Once done this will define
#
# LIBINTL_FOUND - system has Libintl
# LIBINTL_INCLUDE_DIR - Libintl include directory
# LIBINTL_LIBRARIES - Libraries needed to use Libintl
#
# Copyright (c) 2006, Chusslove Illich, <caslav.ilic@gmx.net>
# Copyright (c) 2007, Alexander Neundorf, <neundorf@kde.org>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

if(LIBINTL_INCLUDE_DIR AND LIBINTL_LIB_FOUND)
set(Libintl_FIND_QUIETLY TRUE)
endif(LIBINTL_INCLUDE_DIR AND LIBINTL_LIB_FOUND)

find_path(LIBINTL_INCLUDE_DIR libintl.h)

set(LIBINTL_LIB_FOUND FALSE)

if(LIBINTL_INCLUDE_DIR)
include(CheckFunctionExists)
check_function_exists(gettext LIBINTL_LIBC_HAS_GETTEXT)

if (LIBINTL_LIBC_HAS_GETTEXT)
set(LIBINTL_LIBRARIES)
set(LIBINTL_LIB_FOUND TRUE)
else (LIBINTL_LIBC_HAS_GETTEXT)
find_library(LIBINTL_LIBRARIES NAMES intl libintl )
if(LIBINTL_LIBRARIES)
set(LIBINTL_LIB_FOUND TRUE)
endif(LIBINTL_LIBRARIES)
endif (LIBINTL_LIBC_HAS_GETTEXT)

endif(LIBINTL_INCLUDE_DIR)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Libintl DEFAULT_MSG LIBINTL_INCLUDE_DIR LIBINTL_LIB_FOUND)

mark_as_advanced(LIBINTL_INCLUDE_DIR LIBINTL_LIBRARIES LIBINTL_LIBC_HAS_GETTEXT LIBINTL_LIB_FOUND)


