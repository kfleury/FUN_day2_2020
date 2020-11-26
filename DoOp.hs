--
-- EPITECH PROJECT, 2020
-- FUN_day2_2020
-- File description:
-- DoOp.hs
--

-- For Unit Test
module DoOp where

-- For Doop Program
{-module Main where-}

import Text.Read
import System.Environment
import System.Exit(exitWith, ExitCode(ExitFailure))

{-    STEP 0    -}

--
-- A function which takes an argument which implements equality and a list of the same type, and returns
-- True if the argument is present in the list, False otherwise.
--
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs)
  | a == x = True
  | otherwise = myElem a xs

{-    STEP 1    -}

--
-- A function which takes two Ints as arguments, and returns Nothing if it’s a division by zero, or Just N
-- (with N the result of the division) if it’s not.
--
safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just $ a `div` b

--
-- A function similar to the function myNth, but which returns Nothing in case of an error, or Just N
-- (with N the result) in case of success.
--
safeNth :: [a] -> Int -> Maybe a
safeNth a i
  | i < 0 = Nothing
  | length a < i = Nothing
safeNth (x:_) 0 = Just x
safeNth (_:xs) i = safeNth xs (i - 1)

--
-- A function which takes a Maybe Int and returns its successor wrapped in a maybe.
--
{-  V1
safeSucc :: Maybe Int -> Maybe Int
safeSucc Nothing = Nothing
safeSucc a = fmap succ $ a
-}

{-  V2
safeSucc :: Maybe Int -> Maybe Int
safeSucc a = a >>= (\a -> Just $ succ a)
-}

safeSucc :: Maybe Int -> Maybe Int
safeSucc Nothing = Nothing
safeSucc (Just a) = Just $ succ a

--
-- A function which takes an argument which implements equality and a list of tuples. Looks successively if
-- the first element of each tuple is equal to the first argument. If a match is found, the second element of the
-- tuple is returned wrapped in a Maybe. Otherwise, Nothing is returned.
--
myLookup :: Eq a => a -> [(a, b)] -> Maybe b
myLookup _ [] = Nothing
myLookup a (x:_)
  | a == fst x = Just $ snd x
myLookup a (_:xs) = myLookup a xs

--
-- A functions which takes a function as argument and two more arguments wrapped in Maybes, and returns
-- Nothing if any of the arguments are Nothing, or Just n (with n the result of the function applied to the
-- arguments) otherwise.
--

{-  V1
maybeDo :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
maybeDo f a b = a >>= (\a' -> b >>= (\b' -> Just $ f a' b'))
-}

{-  V2
maybeDo :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
maybeDo f a b = do
              a' <- a
              b' <- b
              Just (f a' b')
-}

{-  V3
maybeDo :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
maybeDo f a b = f <$> a <*> b
-}

maybeDo :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
maybeDo _ Nothing _ = Nothing
maybeDo _ _ Nothing = Nothing
maybeDo f (Just a) (Just b) = Just $ f a b

--
-- A function which takes a string as argument and returns Nothing if its not a parsable number, or an Int
-- wrapped in a maybe otherwise.
--
readInt :: [Char] -> Maybe Int
readInt = readMaybe

{-    STEP 2    -}

--
-- A function which reads a line from the standard input and returns its length as a IO Int.
--
getLineLength :: IO Int
getLineLength = getLine >>= (\x -> return $ length x)

--
-- A function which takes a string as argument, prints it on the standard output followed by a carriage return,
-- and returns its length in the IO monad.
--
printAndGetLength :: String -> IO Int
printAndGetLength str = putStrLn str >> (return . length) str

--
-- A function which takes an Int (N) as argument, and draw a box of height N and width N*2 on the standard
-- output (see example bellow). If N is zero or less, it does nothing.
--
printMiddleLine :: Int -> Int -> IO ()
printMiddleLine _ 0 = return ()
printMiddleLine middleCharCount l =  do
  putStrLn $ "|" ++ (replicate middleCharCount ' ') ++ "|"
  printMiddleLine middleCharCount (l-1)

printBox :: Int -> IO ()
printBox n
  | n <= 0 = return ()
printBox n = printLine >> printMiddleLine middleCharCount (n-2) >> printLine
  where middleCharCount = n * 2 - 2
        printLine = putStrLn $ "+" ++ (replicate middleCharCount '-') ++ "+"

--
-- A function which takes an Int (N) as argument, read N lines from the standard input and returns a concatenation
-- of these lines in the IO monad. If N is 0 or negative, an empty string is returned.
--
concatLines :: Int -> IO String
concatLines n
  | n <= 0 = return []
concatLines n = do
  str <- getLine
  str' <- concatLines (n-1)
  return (str ++ str')

--
-- A function which reads a line from the standard input and returns a Maybe Int in the IO monad.
--
getInt :: IO (Maybe Int)
getInt = getLine >>= (\val -> return (readInt val))

--
-- This program takes three arguments on the command line. The first and third arguments are numbers
-- (signed integers). The second argument is an arithmetic operator (either + - * / or %) and returns the result
-- of the operation.
--
calc :: (Int -> Int -> Int) -> Maybe Int -> Maybe Int -> Maybe Int
calc div _ (Just 0) = Nothing
calc mod _ (Just 0) = Nothing
calc f (Just x) (Just y) = Just $ f x y
calc _ _ _ = Nothing

doop :: [String] -> Maybe Int
doop [a, ['+'], c] = calc (+) (readInt a) (readInt c)
doop [a, ['-'], c] = calc (-) (readInt a) (readInt c)
doop [a, ['*'], c] = calc (*) (readInt a) (readInt c)
doop [a, ['/'], c] = calc (div) (readInt a) (readInt c)
doop [a, ['%'], c] = calc (mod) (readInt a) (readInt c)
doop _ = Nothing

{-
main :: IO ()
main = getArgs >>= (\av -> case doop av of
                                Just res -> print res
                                _ -> exitWith $ ExitFailure 84)
-}
