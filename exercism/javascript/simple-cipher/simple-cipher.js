var alphabet = "abcdefghijklmnopqrstuvwxyz";

function Cipher(key) {
  if (key === "" || (key && key === key.toUpperCase())) {
    throw Error("Bad key");
  }
  this.key = key || "aaaaaaaaaaaaaaaaaa";
}

Cipher.prototype.encode = function(phrase) {
  var encoded = "";
  for (var i = 0; i < phrase.length; i++) {
    var indexFromKey = alphabet.indexOf(this.key[i]);
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
    decoded += alphabet[indexFromPhrase - indexFromKey];
  }
  return decoded;
};

module.exports = Cipher;

// var x = new Cipher("iamapandabear");

// console.log(x.encode("iamapandabear"));

// console.log(alphabet.indexOf("n"));

// console.log(alphabet[28 % 26]);

