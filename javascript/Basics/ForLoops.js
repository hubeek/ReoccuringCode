import * as constants from '../Constants/constants';

const forLoops1 = () => {
    let counter = 0;
    constants.arrayWithNumbers.forEach((num,index)=>{
        console.log(`index ${index}: value ${num}`)
        counter += 1
    })
    return counter
}

const forLoops2 = () => {
    let counter = 0;
    constants.objectWithArray.arrayWithin.forEach((n,i)=>{
        console.log(`index ${index}: value ${n}`)
        counter += 1
    })
    return counter
}
