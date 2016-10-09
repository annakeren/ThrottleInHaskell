import Control.Monad
import Data.Char  
import Counter
initList=[0]
main = forever $ do

    putStr " What is inside initList?: "
    print initList
    putStr "Give me some input: "
    l <- getLine
--    input
--    pop previous time
    let (previousRequestTime, newStack2)=pop initList
    putStr " Previous request time: "
    print previousRequestTime
--     get current time
    currentTime <-  Counter.currentTime
    putStr " Current request time: "
    print currentTime
--      push current time to stack
    let ((),initList)=push currentTime newStack2
    putStr " Pushed request time: "
    print initList
    let ellapsed = Counter.timeEllapsed previousRequestTime currentTime
    print ellapsed

type Stack = [Int]

pop :: Stack -> (Int,Stack)
pop [] = (0,[])
pop (x:xs) = (x,xs)

push :: Int -> Stack -> ((),Stack)
push a xs = ((),a:xs)
