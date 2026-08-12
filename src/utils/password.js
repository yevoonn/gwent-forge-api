import argon2 from "argon2";

/**
 * Password hashing is isolated in a utility module so that the rest
 * of the authentication logic does not depend directly on Argon2.
 */
export async function hashPassword(password) {
  return argon2.hash(password, {
    type: argon2.argon2id,
  });
}

/**
 * Argon2 reads the parameters and salt stored inside the hash,
 * so the same function can verify passwords without separately
 * storing the salt or hashing parameters.
 */
export async function verifyPassword(password, hash) {
  return argon2.verify(hash, password);
}
