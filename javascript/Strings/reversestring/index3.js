// --- Directions
// Given a string, return a new string with the reversed
// order of characters
// --- Examples
//   reverse('apple') === 'leppa'
//   reverse('hello') === 'olleh'
//   reverse('Greetings!') === '!sgniteerG'

function reverse(str) {

  let reversed = '';
  for (let character of str) {
    reversed = character + reversed;
  }
  return reversed;
  //return str.split('').reduce((r, c) => c + r, '')
}

module.exports = reverse;
