const reverse = require('./index');

test('Reverse function exists', () => {
  expect(reverse).toBeDefined();
});

test('Reverse reverses a string abcd', () => {
  expect(reverse('abcd')).toEqual('dcba');
});

test('Reverse reverses a string ___abcd to dcba____', () => {
  expect(reverse('  abcd')).toEqual('dcba  ');
});
