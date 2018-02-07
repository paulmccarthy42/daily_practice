Read about the Ruby `each` method for arrays. Then refactor the code below using `each`.

```
numbers = [1, 2, 4, 2]
sum = 0
index = 0
numbers.length.times do
  number = numbers[index]
  sum = sum + number
  index = index + 1
end
p sum
```
