module Control.Function.ExtendedCompose
    ( o
    , s

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
pose = (.)

posse :: (a -> b) -> (q -> r -> a) -> (q -> r -> b)
posse = pose . s

possse :: (a -> b) -> (q -> r -> s -> a) -> (q -> r -> s -> b)
possse = pose . s . s


poose :: (a -> b -> c) -> (q -> b) -> (a -> q -> c)
poose = o $ pose

poosse :: (a -> b -> c) -> (q -> r -> b) -> (a -> q -> r -> c)
poosse = o $ pose . s

poossse :: (a -> b -> c) -> (q -> r -> s -> b) -> (a -> q -> r -> s -> c)
poossse = o $ pose . s . s


pooose :: (a -> b -> c -> d) -> (q -> c) -> (a -> b -> q -> d)
pooose = o $ o $ pose

pooosse :: (a -> b -> c -> d) -> (q -> r -> c) -> (a -> b -> q -> r -> d)
pooosse = o $ o $ pose . s

pooossse :: (a -> b -> c -> d) -> (q -> r -> s -> c) ->
    (a -> b -> q -> r -> s -> d)
pooossse = o $ o $ pose . s . s


s :: (a -> b) -> (q -> a) -> (q -> b)
s = (.)

o :: (a -> b -> c) -> (q -> a) -> (b -> q -> c)
o = (flip .) . (.)
