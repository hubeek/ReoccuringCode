
function reverse(str) {
  return str.split('').reduce((r, c) => c + r, '')
}

module.exports = reverse;
