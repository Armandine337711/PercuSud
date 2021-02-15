// const array = ['bleu', 'rouge', 'vert', 'jaune', 'chartreuse', 'fof']
// for (let i = 0; i < array.length; i++) {
//     console.log(array[i++])
//     console.log(array[i])
//     console.log('--------------')
// }


const string = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//const arraySplit = string.split(' ');

//console.table(arraySplit);

const str = 'The quick brown fox jumps over the lazy dog. Il faut beau et les petits oiseaux chantent';

const words = str.split(' ');
console.log(words[3]);
// expected output: "fox"

const chars = str.split('');
console.log(chars[8]);
// expected output: "k"

const strCopy = str.split('.');
console.table(strCopy);

var maChaine = "Ceci|est|un|test";
var morceaux = maChaine.split(['|']);

console.log(morceaux); // ["Ceci", "est", "un", "test"]