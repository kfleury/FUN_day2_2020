import Test.HUnit
import UnitTest

main :: IO Counts
main = (putStrLn $ "\n\x1b[92;1m" ++ "Step 1" ++ "\x1b[0m") >>
       runTestTT testsStep1 >>
       (putStrLn $ "\x1b[92;1m" ++ "Doop" ++ "\x1b[0m") >>
       runTestTT testsDoop
