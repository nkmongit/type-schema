public class HashingUtil {
  /**
   * Generates the SHA-256 hash of the given input.
   *
   * @param input The string input to hash.
   * @return The SHA-256 hash of the input as a hexadecimal string.
   */
  public String generateSHA256Hash(String input) {
    Blob inputBlob = Blob.valueOf(input);
    Blob hashedBlob = Crypto.generateDigest('SHA-256', inputBlob);
    return EncodingUtil.convertToHex(hashedBlob);
  }

  /**
   * Generates the MD5 hash of the given input.
   *
   * @param input The string input to hash.
   * @return The MD5 hash of the input as a hexadecimal string.
   */
  public String generateMD5Hash(String input) {
    Blob inputBlob = Blob.valueOf(input);
    Blob hashedBlob = Crypto.generateDigest('MD5', inputBlob);
    return EncodingUtil.convertToHex(hashedBlob);
  }

  /**
   * Generates the hash of the given input using a custom algorithm.
   *
   * @param algorithm The hashing algorithm (e.g., SHA-256, MD5).
   * @param input The string input to hash.
   * @return The hash of the input as a hexadecimal string.
   */
  public String generateCustomHash(String algorithm, String input) {
    Blob inputBlob = Blob.valueOf(input);
    Blob hashedBlob = Crypto.generateDigest(algorithm, inputBlob);
    return EncodingUtil.convertToHex(hashedBlob);
  }

  /**
   * Generates the SHA-512 hash of the given input.
   *
   * @param input The string input to hash.
   * @return The SHA-512 hash of the input as a hexadecimal string.
   */
  public String generateSHA512Hash(String input) {
    Blob inputBlob = Blob.valueOf(input);
    Blob hashedBlob = Crypto.generateDigest('SHA-512', inputBlob);
    return EncodingUtil.convertToHex(hashedBlob);
  }

  /**
   * Generates the HMAC-SHA256 hash of the given input using a secret key.
   *
   * @param input The string input to hash.
   * @param secretKey The secret key to use for HMAC.
   * @return The HMAC-SHA256 hash as a hexadecimal string.
   */
  public static String generateHMACSHA256Hash(String input, String secretKey) {
    Blob inputBlob = Blob.valueOf(input);
    Blob keyBlob = Blob.valueOf(secretKey);
    Blob hashedBlob = Crypto.generateMac('HMACSHA256', inputBlob, keyBlob);
    return EncodingUtil.convertToHex(hashedBlob);
  }

  /**
   * Generates the SHA-1 hash of the given input.
   *
   * @param input The string input to hash.
   * @return The SHA-1 hash of the input as a hexadecimal string.
   */
  public String generateSHA1Hash(String input) {
    Blob inputBlob = Blob.valueOf(input);
    Blob hashedBlob = Crypto.generateDigest('SHA-1', inputBlob);
    return EncodingUtil.convertToHex(hashedBlob);
  }
}
