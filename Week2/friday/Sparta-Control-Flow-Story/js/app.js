var playerName = '';

function print(message) {
  var outputDiv = document.getElementById('output');
  outputDiv.innerHTML = message;
}

function printList(list) {
  var report = '<ol>';
  for (var i=0 ; i<list.length ; i++) {
    report += '<li>Guess: ' + list[i] + '</li>';
  }
  report += '</ol>'
  print(report);
}

function initialise() {
  alert("Hi!\nMy name is Guesso! I can guess a number between 1-100 in 7 guesses!\n\n you wanna bet?\n\n Ok then. Click Ok to get started.");
  playerName = prompt("First things first! What should I call you?","Ali");
  alert("Ok " + playerName + "!\nChoose a number between 1-100 and write it down OR shout it out, whatever! .... just don't tell me :D");
}

function play() {
  var answer;
  var guess = 50;
  var guessList = [50];
    answer = prompt("Is it 50? (say yes[y], higher[h] or lower[l])");
    answer = answer.toLowerCase();
    for (var i=2 ; i<=7 ; i++) {
    if (answer === 'y' || answer === 'yes') {
      break;
    } else if (answer === 'h' || answer === 'higher') {
      guess += Math.round(100/Math.pow(2,i));
      // guessList.push(guess);
    } else if (answer === 'l' || answer === 'lower') {
      guess -= Math.round(100/Math.pow(2,i));
      // guessList.push(guess);
    } else {
      alert ("obviously you don't want to play!\n Goodbye!");
      break;
    }
    guessList.push(guess);
    printList(guessList);
    answer = prompt("Is it " + guess + "? (say yes[y], higher[h] or lower[l])");
    answer = answer.toLowerCase();
  }
}

initialise();
play();
