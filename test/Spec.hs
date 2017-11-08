import Test.Hspec        (Spec, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import qualified Control.Function.ExtendedCompose as Com

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = do
    it "basic compose" $
          (Com.pose succ succ) 3 `shouldBe` 5
