module Control.Function.ExtendedCompose
    ( o
    , s
    , os

    , pose
    , posse
    , possse

    , poose
    , poosse
    , poossse

    , pooose
    , pooosse
    , pooossse

    ) where

pose :: (a -> b) -> (q -> a) -> (q -> b)
pose = os

posse :: (a -> b) -> (q -> r -> a) -> (q -> r -> b)
posse = os . s

possse :: (a -> b) -> (q -> r -> s -> a) -> (q -> r -> s -> b)
possse = os . s . s


poose :: (a -> b -> c) -> (q -> b) -> (a -> q -> c)
poose = o $ os

poosse :: (a -> b -> c) -> (q -> r -> b) -> (a -> q -> r -> c)
poosse = o $ os . s

poossse :: (a -> b -> c) -> (q -> r -> s -> b) -> (a -> q -> r -> s -> c)
poossse = o $ os . s . s


pooose :: (a -> b -> c -> d) -> (q -> c) -> (a -> b -> q -> d)
pooose = o $ o $ os

pooosse :: (a -> b -> c -> d) -> (q -> r -> c) -> (a -> b -> q -> r -> d)
pooosse = o $ o $ os . s

pooossse :: (a -> b -> c -> d) -> (q -> r -> s -> c) ->
    (a -> b -> q -> r -> s -> d)
pooossse = o $ o $ os . s . s


s :: (a -> b) -> (q -> a) -> (q -> b)
s = (.)

o :: (a -> b -> c) -> (q -> a) -> (b -> q -> c)
o = (flip .) . (.)

os :: (a -> b) -> (q -> a) -> (q -> b)
os = (.)
