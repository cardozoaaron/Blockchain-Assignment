// Q1: Check if two strings are anagrams
function isAnagram(str1, str2) {
  // Helper function to normalize the strings: remove non-alphanumeric characters, convert to lower case, and sort characters
  const normalize = str => str.replace(/\W/g, '').toLowerCase().split('').sort().join('');
  
  // Compare normalized versions of the strings to determine if they are anagrams
  return normalize(str1) === normalize(str2);
}
console.log('Q1:', isAnagram('listen', 'silent')); // true

// Q2: Calculate total spent by category
function calculateTotalSpentByCategory(transactions) {
  const totals = {}; // Object to store total spent per category

  // Iterate through each transaction
  transactions.forEach(transaction => {
      const { category, price } = transaction;
      // Accumulate total spent for each category
      totals[category] = (totals[category] || 0) + price;
  });

  // Convert totals object to an array of objects with category and totalSpent
  return Object.entries(totals).map(([category, totalSpent]) => ({ category, totalSpent }));
}
console.log('Q2:', calculateTotalSpentByCategory([
  { category: 'food', price: 10 },
  { category: 'food', price: 20 },
  { category: 'entertainment', price: 15 }
])); // [{ category: 'food', totalSpent: 30 }, { category: 'entertainment', totalSpent: 15 }]

// Q3: Find the largest element
function findLargestElement(numbers) {
  // Use Math.max with the spread operator to find the largest number in the array
  return Math.max(...numbers);
}
console.log('Q3:', findLargestElement([1, 2, 3, 4, 5])); // 5

// Q4: Check if a string is a palindrome
function isPalindrome(str) {
  // Remove non-alphanumeric characters and convert to lower case
  const cleanStr = str.replace(/\W/g, '').toLowerCase();
  // Check if the cleaned string is equal to its reverse
  return cleanStr === cleanStr.split('').reverse().join('');
}
console.log('Q4:', isPalindrome('racecar')); // true

// Q5: Calculate time to sum numbers from 1 to n
function calculateTime(n) {
  const start = Date.now(); // Record start time
  let sum = 0;
  // Calculate sum from 1 to n
  for (let i = 1; i <= n; i++) sum += i;
  // Return time taken in seconds
  return (Date.now() - start) / 1000;
}
console.log('Q5:', calculateTime(10000)); // Varies

// Q6: Count the number of vowels
function countVowels(str) {
  // Use regex to match all vowels (both uppercase and lowercase) and count their occurrences
  return (str.match(/[aeiou]/gi) || []).length;
}
console.log('Q6:', countVowels('hello')); // 2

// Q7: Sum the elements of an array
function sumArray(numbers) {
  // Use reduce to accumulate the sum of all numbers in the array
  return numbers.reduce((sum, number) => sum + number, 0);
}
console.log('Q7:', sumArray([1, 2, 3, 4, 5])); // 15

// Q8: Filter even numbers
function filterEvenNumbers(numbers) {
  // Use filter to create a new array with only the even numbers
  return numbers.filter(number => number % 2 === 0);
}
console.log('Q8:', filterEvenNumbers([1, 2, 3, 4, 5])); // [2, 4]

// Q9: Find the smallest element
function findSmallestElement(numbers) {
  // Use Math.min with the spread operator to find the smallest number in the array
  return Math.min(...numbers);
}
console.log('Q9:', findSmallestElement([1, 2, 3, 4, 5])); // 1

// Q10: Reverse a string
function reverseString(str) {
  // Split the string into an array of characters, reverse the array, and join it back into a string
  return str.split('').reverse().join('');
}
console.log('Q10:', reverseString('hello')); // 'olleh'

// Q11: Find the nth Fibonacci number
function fibonacci(n) {
  if (n <= 1) return n; // Base cases: 0 and 1
  
  let [a, b] = [0, 1]; // Initialize first two Fibonacci numbers
  for (let i = 2; i <= n; i++) {
      [a, b] = [b, a + b]; // Update the values for next Fibonacci number
  }
  return b;
}
console.log('Q11:', fibonacci(5)); // 5

// Q12: Remove duplicates from an array
function removeDuplicates(arr) {
  // Use Set to remove duplicates and spread operator to convert it back to an array
  return [...new Set(arr)];
}
console.log('Q12:', removeDuplicates([1, 1, 2, 2, 3, 4, 5, 5])); // [1, 2, 3, 4, 5]

// Q13: Count occurrences of a character
function countOccurrences(str, char) {
  // Create a regular expression to match all occurrences of the character
  return (str.match(new RegExp(char, 'g')) || []).length;
}
console.log('Q13:', countOccurrences('hello', 'l')); // 2

// Q14: Find common elements in two arrays
function findCommonElements(arr1, arr2) {
  // Use filter to return elements present in both arrays
  return arr1.filter(element => arr2.includes(element));
}
console.log('Q14:', findCommonElements([1, 2, 3], [2, 3, 4])); // [2, 3]

// Q15: Sort an array of strings alphabetically
function sortStrings(arr) {
  // Use sort to arrange the strings in alphabetical order
  return arr.slice().sort();
}
console.log('Q15:', sortStrings(['banana', 'apple', 'cherry'])); // ['apple', 'banana', 'cherry']
