// $(document).on('ready page:load',
//   function () {

$(function () {
  console.log('user_prs.js is loaded ...')
  listenForClick()
});

function listenForClick() {
  $('button#prs-data').on('click', function (event) {
    event.preventDefault()
    getPrs();
  })
}

function getPrs() {
  $.ajax({
    url: 'https://localhost:3000/user_prs',
    method: 'get',
    dataType: 'json'
  }).done(function (data) {
    console.log("the data is: ", data)

    let mypr = new UserPr(data[0])
    let myPrHTML = mypr.prHTML()
// complete **********
    document.getElementById('new-pr-form').innerHTML += myPrHTML
  })
}

class UserPr {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.description = obj.description
  }
}

UserPr.prototype.prHTML = function () {
  return (`
    <div>
      <h2>$(this.name)</h2>
      <p>$(this.description)</p>
    </div>
  `)
};

UserPr.prototype.newPrForm = function () {
  return (`
    <strong>Add a New PR</strong>
    <form>
      <input id='pr-name' type='text' name='name'></input><br>
      <input type='textarea' name='description'></input><br>
      <input type ='submit'/>
  `)
};
