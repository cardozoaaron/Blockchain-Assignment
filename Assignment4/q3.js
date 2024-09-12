const crypto = require('crypto');

function findNonceForInput(inputString, prefix) {
    let nonce = 0;
    while (true) {
        const combinedString = `${inputString}${nonce}`;
        const hash = crypto.createHash('sha256').update(combinedString).digest('hex');
        if (hash.startsWith(prefix)) {
            return { nonce, hash };
        }
        nonce++;
    }
}

const inputString = "Dev => Karan | Rs 100\nKaran => Darsh | Rs 10";
const result = findNonceForInput(inputString, '00000');
console.log(`Nonce: ${result.nonce}`);
console.log(`Hash: ${result.hash}`);
