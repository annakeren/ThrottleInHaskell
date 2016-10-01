import Control.Monad
import Data.Char  
import Counter
  
main = forever $ do  

    let times = [0]
    let emptyStack = []
    putStr "Give me some input: "  
    l <- getLine
    let (lastRequestTime, newStack2)=pop emptyStack
    currentTime <-  Counter.currentTime
    let stack = []
    let ((),newStack1)=push currentTime stack
    let ellapsed = Counter.timeEllapsed lastRequestTime currentTime
    print ellapsed

type Stack = [Int]

pop :: Stack -> (Int,Stack)
pop [] = (0,[])
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((),Stack)
push a xs = ((),a:xs)
