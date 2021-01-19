// "Always implement against abstractions, not concrete implementations." (Also
// see Liskov substitution principle)

// Example:
abstract class EncryptionAlgorithm {
  String encrypt();
}

class AesEncryption implements EncryptionAlgorithm {
  @override
  String encrypt() => "Some AES-based encryption";
}

class ShaEncryption implements EncryptionAlgorithm {
  @override
  String encrypt() => "Some SHA-based encryption";

}

// And then, to use it:
class FileEncryptor {
  void encryptFileContent(EncryptionAlgorithm encryptionAlgorithm) {
    // The concrete implementation is irrelevant, the FileEncryptor does
    // not need to know anything about it.
    encryptionAlgorithm.encrypt();
  }
}