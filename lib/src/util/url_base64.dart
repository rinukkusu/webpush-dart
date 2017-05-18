import 'dart:convert';

class UrlBase64 {
  static List<int> Decode(String base64) {
    base64 = base64.replaceAll('-', '+').replaceAll('_', '/');

    while (base64.length % 4 != 0) base64 += '=';

    return BASE64.decode(base64);
  }

  static String Encode(List<int> data) {
    var base64 = BASE64.encode(data).replaceAll('+', '-').replaceAll('/', '_');

    while (base64[base64.length - 1] == '=')
      base64.substring(0, base64.length - 1);

    return base64;
  }
}
