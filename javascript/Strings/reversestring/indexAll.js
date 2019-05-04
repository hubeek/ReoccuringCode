// --- Directions
// Given a string, return a new string with the reversed
// order of characters
// --- Examples
//   reverse('apple') === 'leppa'
//   reverse('hello') === 'olleh'
//   reverse('Greetings!') === '!sgniteerG'

function reverse(str) {
//  via array
  return str.split('').reverse().join('');
}

function reverse(str) {
  // via for loop
  let result = '';
  for (var i = str.length-1; i > -1; i--) {
    result += str[i]
  }
  return result
}

function reverse(str) {
  // via for loop2
  let reversed = '';
  for (let character of str) {
    reversed = character + reversed;
  }
  return reversed;
}

function reverse(str) {
  // split reduce
  return str.split('').reduce((r, c) => c + r, '')
}
