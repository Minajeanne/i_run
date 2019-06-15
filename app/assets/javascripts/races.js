// Add second click functionality to hide NEW PR and PRS

$(function () {
  console.log('races.js is loaded ...')
  listenForNewRaceClick()
  listenForNewRaceFormClick()
  // listenForViewPrsClick()

function listenForNewRaceClick() {
  $('button#new-race').on('click', function (e) {
    e.preventDefault()

    let newRaceForm = Race.newRaceForm()

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

class Race {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.distance = obj.distance
    this.location = obj.location
    this.event_date = obj.event_date
  }

  static newRaceForm() {
    return (`
      <form id="new-race-form">
        <input id='name' type='text' name='race[name]' placeholder="Race Name"></input><br>
        <input id='distance' type='text' name='race[distance]' placeholder="Distance"></input><br>
        <input id='location' type='text' name='race[location]' placeholder="Location"></input><br>
        <input id='event_date' type='text' name='race[event_date]' placeholder="Date"></input><br>
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
