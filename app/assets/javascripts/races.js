// Add second click functionality to hide NEW PR and PRS

$(function () {
  console.log('races.js is loaded ...')
  listenForNewRaceClick()
  listenForNewRaceFormClick()
  listenForViewRaceUsersClick()

function listenForNewRaceClick() {
  $('button#new-race').on('click', function (e) {
    e.preventDefault()

    let newRaceForm = Race.newRaceForm()

    document.querySelector('div#race-form').innerHTML = newRaceForm
    listenForNewRaceFormClick()
  })
}

function listenForNewRaceFormClick() {
    $('#new-race-form').submit(function(e) {
      //prevent form from submitting the default way
      e.preventDefault();

      let values = $(this).serialize();

      let posting = $.post('/races.json', values);
debugger
      posting.done(function(data) {
        // TODO: handle response
        raceDiv = `<p>${data.name} - ${data.distance} - ${data.location} - ${data.event_date}</p>`
        $('#new-race-div').html(raceDiv);
      });
    });
  };

function listenForViewRaceUsersClick() {
  $('button#view-race-users').on('click', function(e) {
    e.preventDefault()
// debugger hits
    $.ajax({
      url: 'http://localhost:3000/races.json',
      method: 'GET',
      dataType: 'json',
    }).done(function (data) {

        let raceUsers = ""

        data.forEach(race => {
          debugger
          race.users.forEach(
            user => {
              // debugger
              raceUsers = `
              <p>${user.name}</p>
              `
              $('#view-race-users-div').html(raceUsers);
            }
          )
        })
      })
    })
  }

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
        <input id='event_date' type='date' name='race[event_date]' placeholder="Date"></input><br>
        <input type ='submit'/>
      </form>
    `)
  };
}

Race.prototype.raceHTML = function () {
  return (`
    <div>
      <h2>$(this.name)</h2>
      <p>$(this.distance)</p>
      <p>$(this.location)</p>
      <p>$(this.event_date)</p>
    </div>
  `)
};

});
