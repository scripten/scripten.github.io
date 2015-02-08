module Cipher
( encode
, decode
) where

-- Grab the cipher out of input during encoding
cipher :: String -> String
cipher = filter (/=':') . dropWhile (/=':')

-- Grab the phrase out of input
phrase :: String -> String
phrase = takeWhile (/=':')

-- Encode a string using a provided cipher
encode :: String -> String
encode input = str ++ key
  where str = phrase input
        key = cipher input

-- Decode a string using a provided cipher
decode :: String -> String
decode x = x
 
