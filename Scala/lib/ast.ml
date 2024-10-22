(** Copyright 2024-2025, "Sofya Grishkova <sofagriskova1@gmail.com>" "Yuliana Ementyan <ementyan.yuliana@gmail.com>" *)

(** SPDX-License-Identifier: LGPL-3.0-or-later *)

type indent = string [@@deriving show { with_path = false }]

type types =
  | TNone
  | TAny
  | TAnyVal
  | TBoolean
  | TInt
  | TString
  | TUnit
[@@deriving show { with_path = false }]

type const =
  | C_int of int
  | C_bool of bool
  | C_string of string
[@@deriving show { with_path = false }]

type bin_op =
  | Add (*+ *)
  | Sub (*- *)
  | Mul (* * *)
  | Div (* / *)
  | And (*&&*)
  | Or (* || *)
  | Eq (* == *)
  | NotEq (* != *)
  | Gr (* > *)
  | L (* < *)
  | GrE (* >= *)
  | LE (* <= *)
[@@deriving show { with_path = false }]

type un_op =
  | Un_not (* not *)
  | Un_minus (*- *)
[@@deriving show { with_path = false }]

type pat =
  | Pat_any (* _ *)
  | Pat_const of const (* 1, "st" *)
  | Pat_var of indent (* x *)
  | Pat_turple of pat * pat * pat list (* (p1...pn) *)
  | Pat_cons of pat * pat (* t :: tl *)
[@@deriving show { with_path = false }]

type expression =
  | Ex_ident of indent (* x *)
  | Ex_const of const (* 1 | "st" *)
  | Ex_bin of expression * bin_op * expression (* 1 + 1 *)
  | Ex_un of un_op * expression (* -1 *)
  | Ex_tuple of expression * expression * expression list (* (e1...en) *)
  | Ex_list of expression list (*(e1, e2, e3)*)
  | Ex_ifelse of expression * expression * expression option (*if () {} else {}*)
  | Ex_cons of expression * expression (* t :: tl *)
  | Ex_return of expression
  | Ex_call of expression * expression list (*my_fun(x, x1)*)
[@@deriving show { with_path = false }]

(*(x: => Int) = {}*)
and a_func =
  { arg : (indent * types) list
  ; return_type : types
  ; body : expression list
  }
[@@deriving show { with_path = false }]

(*def callByName(x: => Int) = {}*)
type func = indent * a_func [@@deriving show { with_path = false }]

type obj = indent * obj_item list [@@deriving show { with_path = false }]

(*object IdFactory {}*)
and obj_item =
  | Expression of expression
  | Fun of func
  | A_fun of a_func
[@@deriving show { with_path = false }]
