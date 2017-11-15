---
author: Brian Jaress
date: 0000-00-00
title: DRAFT
tags: code, haskell
---

In regular function composition, `f . g` produces a function which
passes its argument to `g` and the result of that to `f`.  With this
module, you can do things like `posse f g`, producing a function which
passes its two arguments to `g` and the result of that to `f`.

\begin{code}
{-|
Module      : Control.Function.ExtendedCompose
Description : Variations on function composition
Copyright   : (c) Brian Jaress, 2017
License     : ???
Maintainer  : bjaress@gmail.com

== Examples

>>> import qualified Control.Function.ExtendedCompose as Com

Use subtraction to create a numerator

>>> (Com.posse (/) (-)) 110 10 2
50.0

Use subtraction to create a denominator

>>> (Com.poosse (/) (-)) 100 9 4
20.0

Increment a denominator.

>>> (Com.poose (/) succ) 100 19
5.0

Define your own variant

>>> import Control.Function.ExtendedCompose (o, os s)
>>> let poooosse = o $ o $ o $ os . s
-}
\end{code}

The compose variants are named according to a convention: The number of
"s"s is the number of arguments to the right-hand function, and the
number of "o"s is position of the argument to the left-hand function.
This module exports variants up to three "o"s and three "s"s.  It also
exports helpers that make it easier to define longer variants if you
need them.

[^boilerplate]:
\begin{code}
module Control.Function.ExtendedCompose
    ( pose
    , posse
    , possse

    , poose
    , poosse
    , poossse

    , pooose
    , pooosse
    , pooossse

    , o
    , s
    , os

    ) where
\end{code}

\begin{code}
pose :: (a -> b) -> (q -> a) -> (q -> b)
pose = os

posse :: (a -> b) -> (q -> r -> a) -> (q -> r -> b)
posse = os . s

possse :: (a -> b) -> (q -> r -> s -> a) -> (q -> r -> s -> b)
possse = os . s . s
\end{code}

\begin{code}
s :: (a -> b) -> (q -> a) -> (q -> b)
s = (.)

os :: (a -> b) -> (q -> a) -> (q -> b)
os = (.)
\end{code}




\begin{code}
poose :: (a -> b -> c) -> (q -> b) -> (a -> q -> c)
poose = o $ os

poosse :: (a -> b -> c) -> (q -> r -> b) -> (a -> q -> r -> c)
poosse = o $ os . s

poossse :: (a -> b -> c) -> (q -> r -> s -> b) -> (a -> q -> r -> s -> c)
poossse = o $ os . s . s
\end{code}

\begin{code}
o :: (a -> b -> c) -> (q -> a) -> (b -> q -> c)
o = (flip .) . (.)
\end{code}




\begin{code}
pooose :: (a -> b -> c -> d) -> (q -> c) -> (a -> b -> q -> d)
pooose = o $ o $ os

pooosse :: (a -> b -> c -> d) -> (q -> r -> c) -> (a -> b -> q -> r -> d)
pooosse = o $ o $ os . s

pooossse :: (a -> b -> c -> d) -> (q -> r -> s -> c) ->
    (a -> b -> q -> r -> s -> d)
pooossse = o $ o $ os . s . s
\end{code}
