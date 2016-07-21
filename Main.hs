import Control.Monad  
import Data.Char  
import Counter
  
main = forever $ do  

    putStr "Give me some input: "  
    l <- getLine  
    currentTime <-  Counter.currentTime    
    print currentTime
    let ellapsed =  Counter.timeEllapsed currentTime currentTime
    let lastTime = currentTime 
    print ellapsed
