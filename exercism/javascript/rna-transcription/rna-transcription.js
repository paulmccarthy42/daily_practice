var DnaTranscriber = function() {};

DnaTranscriber.prototype.toRna = function(Dna) {
  if (RegExp("[^CGAT]").exec(Dna)) {
    throw Error("Invalid input");
  } else {
    var translator = {
      C: "G",
      G: "C",
      A: "U",
      T: "A"
    };
    var Rna = "";
    for (var i = 0; i < Dna.length; i++) {
      Rna += translator[Dna[i]];
    }
    return Rna;
  }
};

module.exports = DnaTranscriber;