import Control.Monad  
import Control.Monad.State
import Data.Char  
import Counter
  
main = forever $ do  

    let times = [0]
    putStr "Give me some input: "  
    l <- getLine  
    currentTime <-  Counter.currentTime
    let push1 = runState (push currentTime) []
    print currentTime
    print push1
    let ellapsed =  Counter.timeEllapsed currentTime currentTime
    let lastTime = currentTime 
    print ellapsed

type Stack = [Int]

pop :: State Stack Int
pop = do
 x:xs <- get
 put xs
 return x

push :: Int -> State Stack ()  
push a = do
 xs <- get
 put (a:xs)
 return ()

stackManip :: State Stack Int  
stackManip =
 push 3 >>
 pop >>=
 \a -> pop
