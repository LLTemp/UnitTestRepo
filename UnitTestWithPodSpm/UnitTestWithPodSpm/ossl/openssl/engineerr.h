/*
 * Generated by util/mkerr.pl DO NOT EDIT
 * Copyright 1995-2019 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the OpenSSL license (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */

#ifndef HEADER_ENGINEERR_H
# define HEADER_ENGINEERR_H

# ifndef HEADER_SYMHACKS_H
#  include "symhacks.h"
# endif

# include "opensslconf.h"

# ifndef OPENSSL_NO_ENGINE

#  ifdef  __cplusplus
extern "C"
#  endif
int ERR_load_ENGINE_strings(void);

/*
 * ENGINE function codes.
 */
#  define ENGINE_F_DIGEST_UPDATE                           198
#  define ENGINE_F_DYNAMIC_CTRL                            180
#  define ENGINE_F_DYNAMIC_GET_DATA_CTX                    181
#  define ENGINE_F_DYNAMIC_LOAD                            182
#  define ENGINE_F_DYNAMIC_SET_DATA_CTX                    183
#  define ENGINE_F_ENGINE_ADD                              105
#  define ENGINE_F_ENGINE_BY_ID                            106
#  define ENGINE_F_ENGINE_CMD_IS_EXECUTABLE                170
#  define ENGINE_F_ENGINE_CTRL                             142
#  define ENGINE_F_ENGINE_CTRL_CMD                         178
#  define ENGINE_F_ENGINE_CTRL_CMD_STRING                  171
#  define ENGINE_F_ENGINE_FINISH                           107
#  define ENGINE_F_ENGINE_GET_CIPHER                       185
#  define ENGINE_F_ENGINE_GET_DIGEST                       186
#  define ENGINE_F_ENGINE_GET_FIRST                        195
#  define ENGINE_F_ENGINE_GET_LAST                         196
#  define ENGINE_F_ENGINE_GET_NEXT                         115
#  define ENGINE_F_ENGINE_GET_PKEY_ASN1_METH               193
#  define ENGINE_F_ENGINE_GET_PKEY_METH                    192
#  define ENGINE_F_ENGINE_GET_PREV                         116
#  define ENGINE_F_ENGINE_INIT                             119
#  define ENGINE_F_ENGINE_LIST_ADD                         120
#  define ENGINE_F_ENGINE_LIST_REMOVE                      121
#  define ENGINE_F_ENGINE_LOAD_PRIVATE_KEY                 150
#  define ENGINE_F_ENGINE_LOAD_PUBLIC_KEY                  151
#  define ENGINE_F_ENGINE_LOAD_SSL_CLIENT_CERT             194
#  define ENGINE_F_ENGINE_NEW                              122
#  define ENGINE_F_ENGINE_PKEY_ASN1_FIND_STR               197
#  define ENGINE_F_ENGINE_REMOVE                           123
#  define ENGINE_F_ENGINE_SET_DEFAULT_STRING               189
#  define ENGINE_F_ENGINE_SET_ID                           129
#  define ENGINE_F_ENGINE_SET_NAME                         130
#  define ENGINE_F_ENGINE_TABLE_REGISTER                   184
#  define ENGINE_F_ENGINE_UNLOCKED_FINISH                  191
#  define ENGINE_F_ENGINE_UP_REF                           190
#  define ENGINE_F_INT_CLEANUP_ITEM                        199
#  define ENGINE_F_INT_CTRL_HELPER                         172
#  define ENGINE_F_INT_ENGINE_CONFIGURE                    188
#  define ENGINE_F_INT_ENGINE_MODULE_INIT                  187
#  define ENGINE_F_OSSL_HMAC_INIT                          200

/*
 * ENGINE reason codes.
 */
#  define ENGINE_R_ALREADY_LOADED                          100
#  define ENGINE_R_ARGUMENT_IS_NOT_A_NUMBER                133
#  define ENGINE_R_CMD_NOT_EXECUTABLE                      134
#  define ENGINE_R_COMMAND_TAKES_INPUT                     135
#  define ENGINE_R_COMMAND_TAKES_NO_INPUT                  136
#  define ENGINE_R_CONFLICTING_ENGINE_ID                   103
#  define ENGINE_R_CTRL_COMMAND_NOT_IMPLEMENTED            119
#  define ENGINE_R_DSO_FAILURE                             104
#  define ENGINE_R_DSO_NOT_FOUND                           132
#  define ENGINE_R_ENGINES_SECTION_ERROR                   148
#  define ENGINE_R_ENGINE_CONFIGURATION_ERROR              102
#  define ENGINE_R_ENGINE_IS_NOT_IN_LIST                   105
#  define ENGINE_R_ENGINE_SECTION_ERROR                    149
#  define ENGINE_R_FAILED_LOADING_PRIVATE_KEY              128
#  define ENGINE_R_FAILED_LOADING_PUBLIC_KEY               129
#  define ENGINE_R_FINISH_FAILED                           106
#  define ENGINE_R_ID_OR_NAME_MISSING                      108
#  define ENGINE_R_INIT_FAILED                             109
#  define ENGINE_R_INTERNAL_LIST_ERROR                     110
#  define ENGINE_R_INVALID_ARGUMENT                        143
#  define ENGINE_R_INVALID_CMD_NAME                        137
#  define ENGINE_R_INVALID_CMD_NUMBER                      138
#  define ENGINE_R_INVALID_INIT_VALUE                      151
#  define ENGINE_R_INVALID_STRING                          150
#  define ENGINE_R_NOT_INITIALISED                         117
#  define ENGINE_R_NOT_LOADED                              112
#  define ENGINE_R_NO_CONTROL_FUNCTION                     120
#  define ENGINE_R_NO_INDEX                                144
#  define ENGINE_R_NO_LOAD_FUNCTION                        125
#  define ENGINE_R_NO_REFERENCE                            130
#  define ENGINE_R_NO_SUCH_ENGINE                          116
#  define ENGINE_R_UNIMPLEMENTED_CIPHER                    146
#  define ENGINE_R_UNIMPLEMENTED_DIGEST                    147
#  define ENGINE_R_UNIMPLEMENTED_PUBLIC_KEY_METHOD         101
#  define ENGINE_R_VERSION_INCOMPATIBILITY                 145

# endif
#endif
