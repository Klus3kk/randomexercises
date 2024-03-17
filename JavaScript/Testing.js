console.log("Hello from JavaScript"); // output

var number = 5; // variable
/* DATA TYPES */
var myName = 'Belly';

myName = 8;

let my_name = 'Dick'; 

const pi = 3.14 // var - whole program, let - scope of declaration, const = can't change

var myStr = 'I am a \"Warlus\"';

console.log(myStr)

console.log(myStr.length)

function wordBlanks(myNoun, myAdjective, myVerb, myAdverb) { // function
    var result = ''
    return result + myNoun + myAdjective + myVerb + myAdverb
}

console.log(wordBlanks("Dick ", "Sexy ", "What ", "jk"))

var myArray = []; // array

var magic1 = function() {
    return new Date();
};

// Alternative way
var magic2 = () => new Date();



// If else if, switch, while, for jak w c++, try catch, class