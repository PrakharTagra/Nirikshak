import { randomBytes } from 'node:crypto';

// Controller ye password officer ko phone par bolta hai ya parchi par likhta
// hai. Jo bhi galat padha ja sakta hai woh hata diya: 0/O nahi, 1/l/I nahi,
// 5/S nahi, 2/Z nahi, 8/B nahi. Char-char ke groups, taaki bola ja sake.
const ALPHABET = 'abcdefghjkmnpqrstuvwxyz' + 'ACDEFGHJKLMNPQRTUVWXY' + '346789';

/** 50-symbol alphabet se 12 characters — lagbhag 68 bits, jo ek aise password
 *  ke liye zaroorat se kaafi zyada hai jo pehle login par badalna hi hai. */
export function generateTemporaryPassword(length = 12) {
  const bytes = randomBytes(length * 2);
  let out = '';
  for (let i = 0; out.length < length; i += 1) {
    // Alphabet size ke aakhri poore multiple se aage wale bytes reject karo,
    // taaki har symbol barabar sambhavna rakhe aur shuru ke kuch favour na hon.
    const limit = 256 - (256 % ALPHABET.length);
    if (bytes[i] < limit) out += ALPHABET[bytes[i] % ALPHABET.length];
  }
  return out.replace(/(.{4})(?=.)/g, '$1-');
}