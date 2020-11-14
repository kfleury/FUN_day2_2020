import Test.HUnit
import UnitTest

main :: IO Counts
main = (putStrLn $ "\n\x1b[92;1m" ++ "Step 1" ++ "\x1b[0m") >>
       runTestTT testsStep1{- >>
       (putStrLn $ "\x1b[92;1m" ++ "Step 2" ++ "\x1b[0m") >>
       runTestTT testsStep2 >>
       (putStrLn $ "\x1b[95;1m" ++ "Step 3" ++ "\x1b[0m") >>
       runTestTT testsStep3 >>
       (putStrLn $ "\x1b[95;1m" ++ "Step 4" ++ "\x1b[0m") >>
       runTestTT testsStep4-}
