(** Copyright 2024-2025, "Sofya Grishkova <sofagriskova1@gmail.com>" "Yuliana Ementyan <ementyan.yuliana@gmail.com>" *)

(** SPDX-License-Identifier: LGPL-3.0-or-later *)

  $ ../bin/main.exe
  ("factorial",
   [(Fun
       ("fac",
        { arg = [("n", TInt)]; return_type = TInt;
          body =
          [(Ex_ifelse ((Ex_bin ((Ex_ident "n"), LE, (Ex_const (C_int 1)))),
              (Ex_return (Ex_const (C_int 1))),
              (Some (Ex_return
                       (Ex_call ((Ex_ident "fac"),
                          [(Ex_bin ((Ex_ident "n"), Mul,
                              (Ex_bin ((Ex_ident "n"), Sub,
                                 (Ex_const (C_int 1))))
                              ))
                            ]
                          ))))
              ))
            ]
          }))
     ])
