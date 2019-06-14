// Add second click functionality to hide NEW PR and PRS 

$(function () {
  console.log('user_prs.js is loaded ...')
  // listenForClick()
  listenForNewPrClick()
  listenForNewPrFormClick()
  listenForViewPrsClick()

function listenForClick() {
  $('button#view-prs').on('click', function (e) {
    e.preventDefault()
    getPrs();
  })
}

function listenForViewPrsClick() {
  $('#view-prs').on('click', function(e) {
    e.preventDefault()

    $.ajax({
      url: 'http://localhost:3000/user_prs',
      method: 'GET',
      dataType: 'json',
    }).done(function (data) {
        let myPrs = ""

        data.forEach(pr => {
          myPrs += `
          <p>${pr.name} - ${pr.description}</p>
          `
          $('#view-prs-div').html(myPrs);
        })
      })
    })
  }

function listenForNewPrClick() {
  $('button#new-pr').on('click', function (e) {
    e.preventDefault()
    let newPrForm = UserPr.newPrForm()
    document.querySelector('div#pr-form').innerHTML = newPrForm
    listenForNewPrFormClick()
  })
}

function listenForNewPrFormClick() {
    $('#new-pr-form').submit(function(e) {
      //prevent form from submitting the default way
      e.preventDefault();

      let values = $(this).serialize();

      let posting = $.post('/user_prs.json', values);

      posting.done(function(data) {
        // TODO: handle response
        myDiv = `<p>${data.name} - ${data.description}</p>`
        $('#new-pr-div').html(myDiv);
      });
    });
  };

class UserPr {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.description = obj.description
  }

  static newPrForm() {
    return (`
      <form id="new-pr-form">
        <input id='name' type='text' name='user_pr[name]' placeholder="PR Name"></input><br>
        <input id='description' type='text' name='user_pr[description]' placeholder="Description"></input><br>
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
