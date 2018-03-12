var Cipher = function(key) {
  this.key = key || "aaaaaaaaaa";
  this.alphabet = "abcdefghijklmonpqrstuvwxyz";
};

Cipher.prototype.encode = function(phrase) {
  if (phrase === this.key) {
    return this.key;
  }
  var encoded = "";
  for (var i = 0; i < phrase.length; i++) {
    encoded += this.alphabet[this.alphabet.indexOf(phrase[i]) + 1];
  }
  return encoded;
};

Cipher.prototype.decode = function(phrase) {
  var decoded = "";
  for (var i = 0; i < phrase.length; i++) {
    decoded += this.alphabet[this.alphabet.indexOf(phrase[i]) - 1];
  }
  return decoded;
};

module.exports = Cipher;
