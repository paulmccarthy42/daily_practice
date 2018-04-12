function Bob() {}

Bob.prototype.hey = function(statement) {
  var cleaned = statement.replace(/\s/g, "");
  if (cleaned === cleaned.toUpperCase() && cleaned !== cleaned.toLowerCase()) {
    return "Whoa, chill out!";
  } else if (cleaned[cleaned.length - 1] === "?") {
    return "Sure.";
  } else if (cleaned === "") {
    return "Fine. Be that way!";
  } else {
    return "Whatever.";
  }
};

module.exports = Bob;
