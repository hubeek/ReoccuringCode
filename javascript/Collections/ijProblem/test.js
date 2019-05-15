const ijProblem = require('./index');
const clueChars = ["P", "A", "D", "V", "I", "N", "D", "E", "R", "I", "J"];

test('function ijproblem exists', () => {
    expect(ijProblem([''])).toBeDefined();
});

test('padvinderij', () => {
    expect(ijProblem(clueChars)).toEqual(["P", "A", "D", "V", "I", "N","D", "E", "R", "IJ"])
});

test('padvinderij met more Js', () =>{
    clueChars[0] = 'J'
    clueChars[5] = 'J'
    clueChars[11] = 'O'
    expect(ijProblem(clueChars)).toEqual(["J", "A", "D", "V", "IJ", "D", "E", "R", "IJ", "O"])
});

test('o ij o ij o', () =>{
    let astring = ['o','i','j','o','i','j','o'];
    expect(ijProblem(astring)).toEqual(['O','IJ','O','IJ','O'])
});


test('ij o ij o', () =>{
    let astring = ['i','j','o','i','j','o'];
    expect(ijProblem(astring)).toEqual(['IJ','O','IJ','O'])
});
test('j o ij o', () =>{
    let astring = ['j','o','i','j','o'];
    expect(ijProblem(astring)).toEqual(['J','O','IJ','O'])
});
