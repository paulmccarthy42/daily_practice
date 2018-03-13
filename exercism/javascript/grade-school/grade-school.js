var School = function() {
  this.schoolRoster = {};
};

School.prototype.roster = function() {
  return this.schoolRoster;
};

School.prototype.add = function(name, grade) {
  if (this.schoolRoster[grade] === undefined) {
    this.schoolRoster[grade] = [name];
  } else {
    this.schoolRoster[grade].push(name);
    this.schoolRoster[grade] = this.schoolRoster[grade].sort(function(
      student1,
      student2
    ) {
      return student1 > student2;
    });
  }
};

School.prototype.grade = function(grade) {
  if (!this.schoolRoster[grade]) {
    return [];
  }
  return this.schoolRoster[grade].sort(function(student1, student2) {
    return student1 > student2;
  });
};

module.exports = School;
