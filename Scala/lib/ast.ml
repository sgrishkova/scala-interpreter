type indent = Indent of string [@@deriving show { with_path = false }]

type const = 
  |Any
  |Int of int
  |Boolean of bool 
  |Char of char 
  |String of string 
  |Unit
[@@deriving show { with_path = false }]

type bin_op =
  |Add (** + *)
  |Sub (** - *)
  |Mul (** * *)
  |Div (** / *)
  |And (**&&*)
  |Or (** || *)
  |Eq (** == *)
  |NotEq (** != *)
  |Gr (** > *)
  |L (** < *)
  |GrE (** >= *)
  |LE (** <= *)
[@@deriving show { with_path = false }]

type pat = 
  |Pat_any 
  |Pat_const of const
  |Pat_var of indent
  |Pat_turple of pat * pat * pat list
  |Pat_list of pat list
  |Pat_cons of pat * pat

[@@deriving show { with_path = false }]

type expression = 
  |Ex_ident of indent
  |Ex_const of const
  |Ex_bin of bin_op * expression * expression
  |Ex_tuple of expression * expression * expression list
  |Ex_list of expression list
  |Ex_ifelse of expression * expression * expression option
  |Ex_cons of expression * expression
  |Ex_fun of string option * func

and func = {
  arg : (indent * const) list;
  
}
[@@deriving show { with_path = false }]

type sc_class=
  |

