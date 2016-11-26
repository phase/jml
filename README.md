# jml

> Jadon's ML

Syntax will soon look something like this:

```OCaml
with IO

let a = 7
let b = 8

let add a b = a + b

let c = add (add a b) 8

let main _ =
  IO.print add 7 c
  0
```

