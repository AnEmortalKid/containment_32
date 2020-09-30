module Main where

{- 
cerner_2^5_2020
-}
-- cerner_2^5_2020
import System.Environment (getArgs)
import Data.List

crowntail = "Crowntail, the most popular freshwater fish."
veiltail = "Veiltail, another very common variation of tail type which is widely available."
plakat = "Plakat Bettas have short and round tails."
halfmoon = "Halfmoon, the tail is large creating half a circle similar to the shape of a half moon."
rosetail = "Rosetail, variation of the half-moon where the total spread of the caudal fin is larger than 180°"

-- colors :: String -> [String]
colors "crowntail" = ["red", "blue"]
colors "veiltail" = [ "blue", "red", "purple", "white"]
colors "plakat" = ["marble", "cambodian", "yellow", "platinum"]
colors "halfmoon" = ["yellow", "blue", "mustard gas"]
colors "rosetail" = ["pink", "red", "white", "gold"]

-- getKnownColors :: String -> String
getKnownColors fish = " Known Colors: " ++ (concat (intersperse "," (colors fish)))

main :: IO ()
main = do
  [switch] <- getArgs
  case switch of
    "crowntail" -> print $ crowntail ++ getKnownColors switch
    "veiltail" -> print $ veiltail ++ getKnownColors switch
    "plakat" -> print $ plakat ++ getKnownColors switch
    "halfmoon" -> print $ halfmoon ++ getKnownColors switch
    "rosetail" -> print $ rosetail ++ getKnownColors switch
    _ -> print $ "Not a known Betta"