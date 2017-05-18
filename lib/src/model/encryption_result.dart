import 'dart:convert';

class EncryptionResult {
  List<int> publicKey;
  List<int> payload;
  List<int> salt;

  String get base64EncodePublicKey => BASE64.encode(publicKey);
  String get base64EncodeSalt => BASE64.encode(salt);
}
