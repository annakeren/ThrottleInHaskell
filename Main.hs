import Control.Monad
import Data.Char  
import Counter
  
main = forever $ do  

    let times = [0]
    putStr "Give me some input: "  
    l <- getLine  
    currentTime <-  Counter.currentTime
    let stack = []
    let ((),newStack1)=push currentTime stack

    let (lastRequestTime, newStack2)=pop newStack1
    print lastRequestTime

    let ellapsed = Counter.timeEllapsed lastRequestTime currentTime
    print ellapsed

type Stack = [Int]

pop :: Stack -> (Int,Stack)
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((),Stack)
push a xs = ((),a:xs)
