# -*- shell-script -*-
#
# Copyright (c) 2004-2005 The Trustees of Indiana University and Indiana
#                         University Research and Technology
#                         Corporation.  All rights reserved.
# Copyright (c) 2004-2005 The University of Tennessee and The University
#                         of Tennessee Research Foundation.  All rights
#                         reserved.
# Copyright (c) 2004-2005 High Performance Computing Center Stuttgart,
#                         University of Stuttgart.  All rights reserved.
# Copyright (c) 2004-2005 The Regents of the University of California.
#                         All rights reserved.
# Copyright (c) 2009-2010 Cisco Systems, Inc.  All rights reserved.
# Copyright (c) 2011-2013 Los Alamos National Security, LLC.
#                         All rights reserved.
# $COPYRIGHT$
#
# Additional copyrights may follow
#
# $HEADER$
#

# MCA_ras_lsf_CONFIG([action-if-found], [action-if-not-found])
# -----------------------------------------------------------
AC_DEFUN([MCA_orte_ras_lsf_CONFIG],[
    AC_CONFIG_FILES([orte/mca/ras/lsf/Makefile])

    ORTE_CHECK_LSF([ras_lsf], [ras_lsf_good=1], [ras_lsf_good=0])

    # if check worked, set wrapper flags if so.
    # Evaluate succeed / fail
    AS_IF([test "$ras_lsf_good" = "1"],
          [$1],
          [$2])

    # set build flags to use in makefile
    AC_SUBST([ras_lsf_CPPFLAGS])
    AC_SUBST([ras_lsf_LDFLAGS])
    AC_SUBST([ras_lsf_LIBS])
])dnl
