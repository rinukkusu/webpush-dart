import 'package:pointycastle/ecc/curves/prime256v1.dart';
import 'package:pointycastle/pointycastle.dart';

class ECKeyHelper {
  static CipherParameters getPrivateKey(List<int> privateKey) {
    new StreamCipher(algorithmName)
  }

  static AsymmetricKeyPair generateKeys() {
    var ecSpec = new ECCurve_prime256v1();
    var keyPairGenerator = new KeyGenerator('EC');
    keyPairGenerator.init(new ECKeyGeneratorParameters(ecSpec));
    return keyPairGenerator.generateKeyPair();
  }
}
