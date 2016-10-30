import Control.Monad
import Data.Char  
import Counter
import Stack
initList=[0]
main = do
    currentTime <-  Counter.currentTime
    let ((),newStack1) = push currentTime initList
    print newStack1
    putStr "Give me some input: "
    l <- getLine
    newTime <- Counter.currentTime
    print newTime
    let ellapsed = Counter.timeEllapsed currentTime newTime
    print ellapsed
