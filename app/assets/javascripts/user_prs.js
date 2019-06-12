class UserPr {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.description = obj.description
  }
}

UserPr.prototype.postHTML = function () {
  return (`
    <div>
      <h2>$(this.name)</h2>
      <p>$(this.description)</p>
    </div>
  `)
};

// UserPr.prototype.newPrForm = function () {
//   return (`
//
//   `)
// };
