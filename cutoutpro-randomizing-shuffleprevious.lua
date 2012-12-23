--[[

shuffleprevious - Shuffle previous item in loop while not repeating same item twice.
BSD license.
by Sven Nilsen, 2012
http://www.cutoutpro.com

Version: 0.000 in angular degrees version notation
http://isprogrammingeasy.blogspot.no/2012/08/angular-degrees-versioning-notation.html

When playing sounds or music tracks in a game, you might want to avoid repeat the same sound track twice.
If you have a very long list, you might need to avoid shuffling the whole list in a single frame update.
This algorithm consists of two function calls, one meant to be called inside the loop and one after.

  for i = 1, #items do
    doSomething(items[i])
    cutoutpro.randomizing.shufflePrevious(items, i)
  end
  cutoutpro.randomizing.shuffleLast(items)
  
The algorithm does not alter the list at the index of any item after it.
This makes it possible to do other kinds of operations in the same loop that will not be affected by the shuffling.

--]]

--[[
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the FreeBSD Project.
--]]

if not cutoutpro then
  cutoutpro = {}
end

if not cutoutpro.randomizing then
  cutoutpro.randomizing = {}
end

-- Shuffles the previous with an earlier index.
-- Keeps rest of the list static.
-- This type of shuffling gives good predictability ahead when looping.
function cutoutpro.randomizing.shufflePrevious(items, index)
    local n = #items
    local i, j
    if index == 1 then
      return
    else
      i = index - 1
      j = math.random(1, i)
    end
    items[i], items[j] = items[j], items[i]
end

-- Shuffles the last item with any except the first item.
-- This is to prevent one item from appearing twice in a row when looping.
-- Call this after looping to not always end up with same last item.
function cutoutpro.randomizing.shuffleLast(items)
  local i, j = #items, math.random(2, #items)
  items[i], items[j] = items[j], items[i]
end
