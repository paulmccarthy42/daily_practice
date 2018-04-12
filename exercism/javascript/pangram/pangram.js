var alphabet = "abcdefghijklmnopqrstuvwxyz".split("");

function Pangram(sentence) {
  this.sentence = sentence;
}
Pangram.prototype.letters = function() {
  return this.sentence
    .toLowerCase()
    .split("")
    .filter(function(letter) {
      return alphabet.includes(letter);
    });
};

Pangram.prototype.isPangram = function() {
  var counts = {};
  this.letters().forEach(function(letter) {
    if (alphabet.includes(letter) && counts[letter] === undefined) {
      counts[letter] = 1;
    } else {
      counts[letter] += 1;
    }
  });
  return Object.keys(counts).length === alphabet.length;
};

module.exports = Pangram;

