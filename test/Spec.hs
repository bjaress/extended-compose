import Test.Hspec        (Spec, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import qualified Control.Function.ExtendedCompose as Com

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = do
    it "basic compose" $
        (Com.pose succ succ) 3 `shouldBe` 5
    it "one arg with two arg" $
        (Com.posse succ (-)) 100 20 `shouldBe` 81
    it "one arg with three arg" $
        (Com.possse succ multiplySubtract) 10 10 20 `shouldBe` 81

    it "two arg with one arg" $
        (Com.poose (-) succ) 100 10 `shouldBe` 89
    it "two arg with two arg" $
        (Com.poosse (-) (/)) 100 15 3 `shouldBe` 95
    it "two arg with three arg" $
        -- 100 - (3 * 5 - 4)
        (Com.poossse (-) multiplySubtract) 100 3 5 4 `shouldBe` 89

    it "three arg with one arg" $
        -- 10 * 10 - (succ 5)
        (Com.pooose multiplySubtract succ) 10 10 5 `shouldBe` 94
    it "three arg with two arg" $
        -- 10 * 20 - (16 / 2)
        (Com.pooosse multiplySubtract (/)) 10 20 16 2 `shouldBe` 192
    it "three arg with three arg" $
        -- 10 * 20 - (5 * 3 - 2)
        (Com.pooossse multiplySubtract multiplySubtract) 10 20 5 3 2
            `shouldBe` 187


multiplySubtract a b c = a * b - c
