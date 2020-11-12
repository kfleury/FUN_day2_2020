--
-- EPITECH PROJECT, 2020
-- FUN_day2_2020
-- File description:
-- DoOp.hs
--
module DoOp where

import Text.Read

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