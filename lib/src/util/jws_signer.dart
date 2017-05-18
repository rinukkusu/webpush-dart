import 'dart:convert';
import 'dart:math';
import 'package:pointycastle/pointycastle.dart' as crypto;
import 'url_base64.dart';

class JWSSigner {
  final crypto.CipherParameters _privateKey;

  JWSSigner(this._privateKey);

  /// Generates a Jws Signature
  String generateSignature(
      Map<String, dynamic> header, Map<String, dynamic> payload) {
    String securedInput = _secureInput(header, payload);
    List<int> message = UTF8.encode(securedInput);

    var digest = new crypto.Digest('SHA-256');
    List<int> hashedMessage = digest.process(message);

    var signer = new crypto.Signer('SHA-256/ECDSA');
    signer.init(true, _privateKey);
    crypto.ECSignature result = signer.generateSignature(hashedMessage);

    // generate signature
    var a = result.r.toByteArray();
    var b = result.s.toByteArray();

    // a,b are required to be exactly the same length of bytes
    if (a.length != b.length) {
      var maxLength = max(a.length, b.length);
      a = _byteArrayPadLeft(a, maxLength);
      b = _byteArrayPadLeft(b, maxLength);
    }

    a.addAll(b);
    String signature = UrlBase64.Encode(a);

    return '$securedInput.$signature';
  }

  static String _secureInput(
      Map<String, dynamic> header, Map<String, dynamic> payload) {
    String encodedHeader = UrlBase64.Encode(UTF8.encode(JSON.encode(header)));
    String encodedPayload = UrlBase64.Encode(UTF8.encode(JSON.encode(payload)));

    return '$encodedHeader.$encodedPayload';
  }

  static List<int> _byteArrayPadLeft(List<int> src, int size) {
    var dst = src.toList();

    while (dst.length < size) dst.insert(0, 0);

    return dst;
  }
}
