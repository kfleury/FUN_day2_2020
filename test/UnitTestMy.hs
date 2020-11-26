--
-- EPITECH PROJECT, 2020
-- FUN_day1_2020
-- File description:
-- UnitTestMy.hs
--
module UnitTest where

import Test.HUnit
import DoOp

myElemTest :: Test
myElemTest = TestCase (assertEqual name expected out)
  where
    name = "myElem Test for 3 [1,2,3,4,5]"
    expected = elem 3 [1,2,3,4,5]
    out = myElem 3 [1,2,3,4,5]

myElemTest2 :: Test
myElemTest2 = TestCase (assertEqual name expected out)
  where
    name = "myElem Test for 3 []"
    expected = elem 3 []
    out = myElem 3 []

safeDivTest :: Test
safeDivTest = TestCase (assertEqual name expected out)
  where
    name = "safeDiv Test for 10 0"
    expected = Nothing
    out = safeDiv 10 0

safeDivTest2 :: Test
safeDivTest2 = TestCase (assertEqual name expected out)
  where
    name = "safeDiv Test for 10 5"
    expected = Just 2
    out = safeDiv 10 5

safeNthTest :: Test
safeNthTest = TestCase (assertEqual name expected out)
  where
    name = "safeNth Test for [3..5] 2"
    expected = Just $ [3..5] !! 2
    out = safeNth [3..5] 2

safeNthTest2 :: Test
safeNthTest2 = TestCase (assertEqual name expected out)
  where
    name = "safeNth Test for [3..5] -1"
    expected = Nothing
    out = safeNth [3..5] $ -1

safeNthTest3 :: Test
safeNthTest3 = TestCase (assertEqual name expected out)
  where
    name = "safeNth Test for [3..5] 22"
    expected = Nothing
    out = safeNth [3..5] 22

safeSuccTest :: Test
safeSuccTest = TestCase (assertEqual name expected out)
  where
    name = "safeSucc Test for (safeDiv 10 0)"
    expected = Nothing
    out = safeSucc (safeDiv 10 0)

safeSuccTest2 :: Test
safeSuccTest2 = TestCase (assertEqual name expected out)
  where
    name = "safeSucc Test for (safeDiv 10 2)"
    expected = Just 6
    out = safeSucc (safeDiv 10 2)

myLookupTest :: Test
myLookupTest = TestCase (assertEqual name expected out)
  where
    name = "myLookup Test for 2 [(1,“foo”),(2,“bar”),(3,“baz”)]"
    expected = Just "bar"
    out = myLookup 2 [(1, "foo"), (2, "bar"), (3, "baz")]

myLookupTest2 :: Test
myLookupTest2 = TestCase (assertEqual name expected out)
  where
    name = "myLookup Test for 5 [(1,“foo”),(2,“bar”),(3,“baz”)]"
    expected = Nothing
    out = myLookup 5 [(1, "foo"), (2, "bar"), (3, "baz")]

maybeDoTest :: Test
maybeDoTest = TestCase (assertEqual name expected out)
  where
    name = "maybeDo Test for (\\ x y -> x + y) (Just 1) (Just 2)"
    expected = Just 3
    out = maybeDo (\ x y -> x + y) (Just 1) (Just 2)

maybeDoTest2 :: Test
maybeDoTest2 = TestCase (assertEqual name expected out)
  where
    name = "maybeDo Test for (*) (safeDiv 10 0) (Just 5)"
    expected = Nothing
    out = maybeDo (*) (safeDiv 10 0) (Just 5)

maybeDoTest3 :: Test
maybeDoTest3 = TestCase (assertEqual name expected out)
  where
    name = "maybeDo Test for (+) (safeDiv 10 5) (safeSucc $ Just 39)"
    expected = Just 42
    out = maybeDo (+) (safeDiv 10 5) (safeSucc $ Just 39)

readIntTest :: Test
readIntTest = TestCase (assertEqual name expected out)
  where
    name = "readInt Test for “42“"
    expected = Just 42
    out = readInt "42"

readIntTest2 :: Test
readIntTest2 = TestCase (assertEqual name expected out)
  where
    name = "readInt Test for “foobar“"
    expected = Nothing
    out = readInt "foobar"

doopTest :: Test
doopTest = TestCase (assertEqual name expected out)
  where
    name = "doop Test for [“2“, “+“, “2“]"
    expected = Just 4
    out = doop ["2", "+", "2"]

doopTest2 :: Test
doopTest2 = TestCase (assertEqual name expected out)
  where
    name = "doop Test for [“2“, “-“, “2“]"
    expected = Just 0
    out = doop ["2", "-", "2"]

doopTest3 :: Test
doopTest3 = TestCase (assertEqual name expected out)
  where
    name = "doop Test for [“2“, “*“, “2“]"
    expected = Just 4
    out = doop ["2", "*", "2"]

doopTest4 :: Test
doopTest4 = TestCase (assertEqual name expected out)
  where
    name = "doop Test for [“2“, “/“, “2“]"
    expected = Just 1
    out = doop ["2", "/", "2"]

doopTest5 :: Test
doopTest5 = TestCase (assertEqual name expected out)
  where
    name = "doop Test for [“2“, “/“, “0“]"
    expected = Nothing
    out = doop ["2", "/", "0"]

doopTest6 :: Test
doopTest6 = TestCase (assertEqual name expected out)
  where
    name = "doop Test for [“2“, “%“, “0“]"
    expected = Nothing
    out = doop ["2", "%", "0"]

doopTest7 :: Test
doopTest7 = TestCase (assertEqual name expected out)
  where
    name = "doop Test for [“2“, “%“, “2“]"
    expected = Just 0
    out = doop ["2", "%", "2"]

doopTest8 :: Test
doopTest8 = TestCase (assertEqual name expected out)
  where
    name = "doop Test for [“2“, “2“]"
    expected = Nothing
    out = doop ["2", "2"]

testsStep1 = TestList [myElemTest, myElemTest2, safeDivTest, safeDivTest2,
                      safeNthTest, safeNthTest2, safeNthTest3, safeSuccTest,
                      safeSuccTest2, myLookupTest, myLookupTest2, maybeDoTest,
                      maybeDoTest2, maybeDoTest3, readIntTest, readIntTest2]

testsDoop = TestList [doopTest, doopTest2, doopTest3, doopTest4, doopTest5, doopTest6,
                      doopTest7, doopTest8]
