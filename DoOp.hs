--
-- EPITECH PROJECT, 2020
-- FUN_day2_2020
-- File description:
-- DoOp.hs
--
module Main where

import Text.Read
import System.Environment
import System.Exit(exitWith, ExitCode(ExitFailure))

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs)
  | a == x = True
  | otherwise = myElem a xs

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv a b = Just $ a `div` b

safeNth :: [a] -> Int -> Maybe a
safeNth a i
  | i < 0 = Nothing
  | length a < i = Nothing
safeNth (x:_) 0 = Just x
safeNth (_:xs) i = safeNth xs (i - 1)

safeSucc :: Maybe Int -> Maybe Int
safeSucc Nothing = Nothing
safeSucc (Just a) = Just $ succ a

myLookup :: Eq a => a -> [(a, b)] -> Maybe b
myLookup _ [] = Nothing
myLookup a (x:_)
  | a == fst x = Just $ snd x
myLookup a (_:xs) = myLookup a xs

maybeDo :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
maybeDo _ Nothing _ = Nothing
maybeDo _ _ Nothing = Nothing
maybeDo f (Just a) (Just b) = Just $ f a b

readInt :: [Char] -> Maybe Int
readInt = readMaybe

getLineLength :: IO Int
getLineLength = getLine >>= (\x -> return $ length x)

printAndGetLength :: String -> IO Int
printAndGetLength str = putStrLn str >> (return . length) str

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

concatLines :: Int -> IO String
concatLines n
  | n <= 0 = return []
concatLines n = do
  str <- getLine
  str' <- concatLines (n-1)
  return (str ++ str')

getInt :: IO (Maybe Int)
getInt = getLine >>= (\val -> return (readInt val))

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

main :: IO ()
main = getArgs >>= (\av -> case doop av of
                                Just res -> print res
                                _ -> exitWith $ ExitFailure 84)
