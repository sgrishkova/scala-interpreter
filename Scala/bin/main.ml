open Scala.Ast

let () = 
  let factorial_ast : func = "factorial", 
    {
      arg = [ "n", TInt ]
    ; return_type = TInt
    ;  body = 
      [
        Ex_ifelse 
         (
          Ex_bin(Ex_ident "n", LE, Ex_const (C_int 1))
         , Ex_return (Ex_const (C_int 1)) 
         , Some 
          (
            
          )
         )
      ]
    }
