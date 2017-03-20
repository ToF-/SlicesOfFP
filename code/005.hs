-- 005.hs
import Test.Hspec
main = hspec
(describe "a test"
 (it "should pass"
  (2+2  ‘shouldBe‘ 4)))
