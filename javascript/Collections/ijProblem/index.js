// IJ problem
// in an array of chars the 'i' followed by a 'J' should be combined.
// ['O','I','J','O','I','J','O'] should become ['O','IJ','O','IJ','O']

function ijProblem (clueChars) {
    let word = clueChars.map(c => c.toUpperCase());
    return word.reduce((array, item, index) => {
        const lastIndex = array.length - 1
        if (index > 0 && array[lastIndex] === 'I' && item === 'J') {
            array[lastIndex] = 'IJ'
        } else {
            array.push(item)
        }

        return array;
    }, [])
}

module.exports = ijProblem