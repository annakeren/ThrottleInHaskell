import Control.Monad
import Data.Char  
import Counter
initList=[0]
main = forever $ do
    putStr "Give me some input: "
    l <- getLine
    let (previousRequestTime, newStack2)=pop initList
    putStr " Previous request time: "
    print previousRequestTime
    currentTime <-  Counter.currentTime
    putStr " Current request time: "
    print currentTime

    let ((),newStack1)=push currentTime initList

    let (previousRequestTime, newStack2)=pop newStack1

    let ellapsed = Counter.timeEllapsed previousRequestTime currentTime
    print ellapsed

type Stack = [Int]

pop :: Stack -> (Int,Stack)
pop [] = (0,[])
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((),Stack)
push a xs = ((),a:xs)
