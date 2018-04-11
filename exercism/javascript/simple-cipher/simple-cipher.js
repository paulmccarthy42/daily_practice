var alphabet = "abcdefghijklmnopqrstuvwxyz";

function Cipher(key) {
  if (key === "" || (key && key === key.toUpperCase())) {
    throw Error("Bad key");
  }
  this.key = key || randomizedKey();
}

Cipher.prototype.encode = function(phrase) {
  var encoded = "";
  for (var i = 0; i < phrase.length; i++) {
    var indexFromKey = alphabet.indexOf(this.key[i % this.key.length]);
    var indexFromPhrase = alphabet.indexOf(phrase[i]);
    encoded += alphabet[(indexFromPhrase + indexFromKey) % alphabet.length];
  }
  return encoded;
};

Cipher.prototype.decode = function(phrase) {
  var decoded = "";
  for (var i = 0; i < phrase.length; i++) {
    var indexFromKey = alphabet.indexOf(this.key[i]);
    var indexFromPhrase = alphabet.indexOf(phrase[i]);
    decoded +=
      alphabet[
        (indexFromPhrase - indexFromKey + alphabet.length) % alphabet.length
      ];
  }
  return decoded;
};

function randomizedKey() {
  var key = "";
  for (var i = 0; i < 100; i++) {
    key += alphabet[Math.floor(Math.random() * alphabet.length)];
  }
  return key;
}

module.exports = Cipher;

