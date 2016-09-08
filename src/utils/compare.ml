(**************************************************************************)
(*                                                                        *)
(*    Copyright (c) 2014 - 2016.                                          *)
(*    Dynamic Ledger Solutions, Inc. <contact@tezos.com>                  *)
(*                                                                        *)
(*    All rights reserved. No warranty, explicit or implicit, provided.   *)
(*                                                                        *)
(**************************************************************************)

module type S = sig
  type t
  val (=) : t -> t -> bool
  val (<>) : t -> t -> bool
  val (<) : t -> t -> bool
  val (<=) : t -> t -> bool
  val (>=) : t -> t -> bool
  val (>) : t -> t -> bool
  val compare : t -> t -> int
  val max : t -> t -> t
  val min : t -> t -> t
end

module Char = struct
  type t = char
  let (=) = ((=) : t -> t -> bool)
  let (<>) = ((<>) : t -> t -> bool)
  let (<) = ((<) : t -> t -> bool)
  let (<=) = ((<=) : t -> t -> bool)
  let (>=) = ((>=) : t -> t -> bool)
  let (>) = ((>) : t -> t -> bool)
  let compare = compare
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end

module Bool = struct
  type t = bool
  let (=) = ((=) : t -> t -> bool)
  let (<>) = ((<>) : t -> t -> bool)
  let (<) = ((<) : t -> t -> bool)
  let (<=) = ((<=) : t -> t -> bool)
  let (>=) = ((>=) : t -> t -> bool)
  let (>) = ((>) : t -> t -> bool)
  let compare = compare
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end

module Int = struct
  type t = int
  let (=) = ((=) : t -> t -> bool)
  let (<>) = ((<>) : t -> t -> bool)
  let (<) = ((<) : t -> t -> bool)
  let (<=) = ((<=) : t -> t -> bool)
  let (>=) = ((>=) : t -> t -> bool)
  let (>) = ((>) : t -> t -> bool)
  let compare = compare
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end

module Int32 = struct
  type t = int32
  let (=) = ((=) : t -> t -> bool)
  let (<>) = ((<>) : t -> t -> bool)
  let (<) = ((<) : t -> t -> bool)
  let (<=) = ((<=) : t -> t -> bool)
  let (>=) = ((>=) : t -> t -> bool)
  let (>) = ((>) : t -> t -> bool)
  let compare = compare
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end

module Int64 = struct
  type t = int64
  let (=) = ((=) : t -> t -> bool)
  let (<>) = ((<>) : t -> t -> bool)
  let (<) = ((<) : t -> t -> bool)
  let (<=) = ((<=) : t -> t -> bool)
  let (>=) = ((>=) : t -> t -> bool)
  let (>) = ((>) : t -> t -> bool)
  let compare = compare
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end

module Float = struct
  type t = float
  let (=) = ((=) : t -> t -> bool)
  let (<>) = ((<>) : t -> t -> bool)
  let (<) = ((<) : t -> t -> bool)
  let (<=) = ((<=) : t -> t -> bool)
  let (>=) = ((>=) : t -> t -> bool)
  let (>) = ((>) : t -> t -> bool)
  let compare = compare
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end

module String = struct
  type t = string
  let (=) = ((=) : t -> t -> bool)
  let (<>) = ((<>) : t -> t -> bool)
  let (<) = ((<) : t -> t -> bool)
  let (<=) = ((<=) : t -> t -> bool)
  let (>=) = ((>=) : t -> t -> bool)
  let (>) = ((>) : t -> t -> bool)
  let compare = compare
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end

module List(P : S) = struct
  type t = P.t list
  let rec compare xs ys =
    match xs, ys with
    | [], [] -> 0
    | [], _ -> -1
    | _, [] -> 1
    | x :: xs, y :: ys ->
        let hd = P.compare x y in
        if hd <> 0 then hd else compare xs ys
  let (=) xs ys = compare xs ys = 0
  let (<>) xs ys = compare xs ys <> 0
  let (<) xs ys = compare xs ys < 0
  let (<=) xs ys = compare xs ys <= 0
  let (>=) xs ys = compare xs ys >= 0
  let (>) xs ys = compare xs ys > 0
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end

module Option(P : S) = struct
  type t = P.t option
  let rec compare xs ys =
    match xs, ys with
    | None, None -> 0
    | None, _ -> -1
    | _, None -> 1
    | Some x, Some y -> P.compare x y
  let (=) xs ys = compare xs ys = 0
  let (<>) xs ys = compare xs ys <> 0
  let (<) xs ys = compare xs ys < 0
  let (<=) xs ys = compare xs ys <= 0
  let (>=) xs ys = compare xs ys >= 0
  let (>) xs ys = compare xs ys > 0
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y
end
