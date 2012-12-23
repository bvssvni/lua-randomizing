--[[

shuffle - Simple shuffle of items in list.
BSD license.
by Sven Nilsen, 2012
http://www.cutoutpro.com

Version: 0.000 in angular degrees version notation
http://isprogrammingeasy.blogspot.no/2012/08/angular-degrees-versioning-notation.html

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

-- Shuffle items in a list in random order.
-- This alters the original list.
-- There are n! possible sequences using this shuffle.
-- This is known as Fisher-Yates shuffle or Knuth shuffle.
function cutoutpro.randomizing.shuffle(items)
  local n = #items
  for i = n, 1, -1 do
    local j = math.random(n)
    items[i], items[j] = items[j], items[i]
    n = n - 1
  end
end

-- Shuffle items in a list but leave not items at the same position.
-- In group-theory, this equals an generator g^n = e, where e is the original list.
-- It means when shuffling a cycle of a list of items 1 to 3, each item will
-- visit all positions such that items[items[items[i]]] = items[i].
-- There are (n-1)! possible sequences to generate using this method.
-- This is known as Sattolo's algorithm.
function cutoutpro.randomizing.shuffleCycle(items)
  local n = #items
  for i = n, 1, -1 do
    local j = math.random(n-1)
    items[i], items[j] = items[j], items[i]
    n = n - 1
  end
end
