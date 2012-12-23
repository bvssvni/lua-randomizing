require "cutoutpro-randomizing"

math.randomseed(230937)

function shuffleItems(items)
  local items = {1,2,3,4,5,6}
  cutoutpro.randomizing.shuffle(items)
  print(table.concat(items, ","))
end

function printShufflePrevious(items)
  print(table.concat(items, ""))
  for i = 1, #items do
    cutoutpro.randomizing.shufflePrevious(items, i)
  end
  cutoutpro.randomizing.shuffleLast(items)
end

-- Do normal shuffling.
shuffleItems()
print("")

-- Use partial and predictive shuffling.
local items = {1,2,3,4,5,6}
for i = 1, 20 do
  printShufflePrevious(items)
end

