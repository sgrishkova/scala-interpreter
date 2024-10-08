type indent = string [@@deriving show { with_path = false }]

type types = 
  |TNone 
  |TAny
  |TAnyVal
  |TBoolean
  |TInt
  |TString
  |TUnit
[@@deriving show { with_path = false }]

type const = 
  |C_int of int
  |C_bool of bool
  |C_string of string

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
  |Pat_const of types
  |Pat_var of indent
  |Pat_turple of pat * pat * pat list
  |Pat_cons of pat * pat

[@@deriving show { with_path = false }]

type expression = 
  |Ex_ident of indent
  |Ex_const of const
  |Ex_bin of expression * bin_op * expression
  |Ex_tuple of expression * expression * expression list
  |Ex_list of expression list
  |Ex_ifelse of expression * expression * expression option
  |Ex_cons of expression * expression
  |Ex_apply of expression * expression
  |Ex_return of expression

and a_func = 
  {
  arg : (indent * types) list
  ; return_type : types
  ; body : expression list
  }
[@@deriving show { with_path = false }]

type func = indent * a_func [@@deriving show { with_path = false }]

