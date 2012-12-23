lua-randomizing
===============

Module for doing shuffle and randomizing tasks.  
BSD license.  
For version log, view the individual files.  

##Shuffle-Previous

This algorithm shuffles items while not repeating same items twice.  
The shuffling can be done in parts to avoid lagging in framerate.  
It keeps the rest of the list static, including the current index position.  
This is useful for looping music tracks, sounds, AI attacks etc.  

##Shuffle

A Fisher-Yates shuffle that shuffles items within the same array.  
It was the inspiration of the Shuffle-Previous algorithm.  
Article: http://bost.ocks.org/mike/shuffle/  
