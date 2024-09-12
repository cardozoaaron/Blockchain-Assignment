const crypto = require('crypto');

function findHashWithPrefix(prefix, startString) {
    let nonce = 0;
    while (true) {
        const inputString = `${startString}${nonce}`;
        const hash = crypto.createHash('sha256').update(inputString).digest('hex');
        if (hash.startsWith(prefix)) {
            return { inputString, hash };
        }
        nonce++;
    }
}

const result = findHashWithPrefix('00000', 'chiragmali19');
console.log(`Input String: ${result.inputString}`);
console.log(`Hash: ${result.hash}`);
