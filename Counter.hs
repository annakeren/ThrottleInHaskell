-- how to run :load "/Users/annakeren/Documents/workspace/Throttle/Counter.hs"
module Counter
(timeEllapsed, currentTime)where
import Data.Time
import Data.Time.Clock.POSIX
timeEllapsed::Int->Int->Bool
timeEllapsed lastRequestTime currentRequestTime
 | currentRequestTime - lastRequestTime > 15000 = True
 | otherwise = False

currentTime::IO Int
currentTime=round `fmap` getPOSIXTime


