function reverseString(string) {
  var reversed = ""
  for (var char = string.length - 1; char >= 0; char--) {
    reversed += string[char]
  }
  return reversed
}

module.exports = reverseString;