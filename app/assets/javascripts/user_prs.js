$(function () {
  console.log('user_prs.js is loaded ...')
  // listenForClick()
  listenForNewPrClick()
  listenForNewPrFormClick()
  listenForViewPrsClick()

// function listenForClick() {
//   $('button#view-prs').on('click', function (e) {
//     e.preventDefault()
//     getPrs();
//   })
// }
let allUserPrs = []

function listenForViewPrsClick() {
  $('#view-prs').on('click', function(e) {
    e.preventDefault()

    $.ajax({
      url: 'http://localhost:3000/user_prs',
      method: 'GET',
      dataType: 'json',
    }).done(function (data) {
        let myPrs = ""

          allUserPrs = []

            data.forEach(pr => {
              let newUserPr = new UserPr(pr)
                allUserPrs.push(newUserPr)
            })
              let sortedPrs = allUserPrs.sort((a, b) => (a.name > b.name) ? 1 : -1)

              sortedPrs.forEach(pr => {
                myPrs += pr.prHTML()
              })
              $('#view-prs-div').html(myPrs);
            })
          })
        }

// create function to hide text on second click
function hideViewPrsText() {
  var x = document.getElementById("#view-prs-div");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
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
        let newUserPr = new UserPr(data)

          myDiv = newUserPr.prHTML()

        $('#new-pr-div').html(myDiv);
      });
    });
  };

// function clearViewPrsOnLinkClick() {
//   let link = document.querySelector('#view-prs');
//   let div = document.querySelector('button#view-prs-div');
//     link.addEventListener('click', function(e) {
//       div.innerHTML = ''
//     });
// }

class UserPr {
  constructor(obj) {
    // this.id = obj.id
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
      <p>${this.name} - ${this.description}</p>
  `)
};

});
