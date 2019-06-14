$(function () {
  console.log('user_prs.js is loaded ...')
  listenForClick()
  listenForNewPrClick()
  listenForNewPrFormClick()

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
    document.getElementById('').innerHTML += myPrHTML
  })
}

function listenForNewPrClick() {
  $('button#new-pr').on('click', function (event) {
    event.preventDefault()
    let newPrForm = UserPr.newPrForm()
    document.querySelector('div#new-pr-form').innerHTML = newPrForm
    listenForNewPrFormClick()
  })
}

function listenForNewPrFormClick() {
  $('form#new-pr-form').submit(function(e) {
    e.preventDefault()

    const pr = {
      name: $('#name').val(),
      description: $('#description').val()
  };

    $.ajax({
      url: 'https://localhost:3000/user_prs',
      method: 'POST',
      data: JSON.stringify(pr),
      dataType: 'json',
      contentType: "application/json; charset=utf-8", 
      success: function(newPr) {
        $pr.append('<li>name: '+ newPr.name +', description: '+ newPr.description + '</li>');
      },
      error: function() {
        alert('error saving PR');
      }
    })
  })
}

class UserPr {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.description = obj.description
  }

  static newPrForm() {
    return (`
      <form id="new-pr-form">
        <input id='name' type='text' name='name' placeholder="PR Name"></input><br>
        <input id='description' type='text' name='description' placeholder="Description"></input><br>
        <input type ='submit'/>
      </form>
    `)
  };
}

UserPr.prototype.prHTML = function () {
  return (`
    <div>
      <h2>$(this.name)</h2>
      <p>$(this.description)</p>
    </div>
  `)
};
});
