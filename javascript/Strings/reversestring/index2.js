// --- Directions
// Given a string, return a new string with the reversed
// order of characters
// --- Examples
//   reverse('apple') === 'leppa'
//   reverse('hello') === 'olleh'
//   reverse('Greetings!') === '!sgniteerG'

function reverse(str) {
  // via for loop
  let result = '';
  for (var i = str.length-1; i > -1; i--) {
    result += str[i]
  }
  return result
}

module.exports = reverse;
