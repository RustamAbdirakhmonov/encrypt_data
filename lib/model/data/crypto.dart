import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/services.dart';
import 'package:pointycastle/export.dart';

class Cryptom {

  String publickey =
      "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAiHad18"
      "T5QHKSkZpeq7lvDHcZI6SdYGvEg4b64rvaCv21U4ml3qtI/HWr+i"
      "96ysQwgT9fL7+5skWgtzqFjxLasxDL0Pom9rTaQGzdFtSM51BTZxnDO"
      "BMDiKdTMkL6OkUyBJDikV0r2ILssLCXB68ErzxSYheWfVnD73VExZ8pJ331Okl"
      "uWDlZDXi34/98dRAtToqRrqrjds52PpX7GJ1/09aifv2jqm71qLye3hH75Z9eLtW"
      "GgRTNHU++VK2e4T/LZ2idjpOtGnK1zmnV/6vY92EJ45JmgTK0aM8YNzXZyvF35w3M"
      "0u50CYSXm0jC5xVyyVd1dvvY/mmvHWwwCuGh7c7DFfP1uVnDaWg4MazYj70vIyU/87i"
      "1doHH3kHX7uCNMHQO/xf51YmLsB3Z0CX8xKCKjBch3nQi8r8i8DTuTHL/ELPBNTRnNDtN"
      "N7s1gA7RLLXkb2ziFVjOgWPwC3UO1huJi0qIJIPuTYSxfVNnyVORTSV5AyLrCtplZMA+ua"
      "rcUcauMOUGWxo7HkleOQ2bNqluBrpfBgKRfR+hGnsOeLj0m8tlbKbsYTFigQpwOwHY1Sc0N"
      "PfN7oAPqB4Cw6Usl/Q1Bmlb1JPnYCXj9qovdUWllqDMHY7QqJc/1v1uggHuXJ4gR/KtE2SwqOTc"
      "PcHxqu32kkd30SqGEvVSyVV9lK0CAwEAAQ==";

  String encrypt(String plaintext, String publicKey) {
      var pem =
        '-----BEGIN RSA PUBLIC KEY-----\n$publickey\n-----END RSA PUBLIC KEY-----';
    var public = CryptoUtils.rsaPublicKeyFromPem(pem);
    var cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));
      Uint8List output =
    cipher.process(Uint8List.fromList(utf8.encode(plaintext)));
    var base64EncodedText = base64Encode(output);
    return base64EncodedText;
  }

  String text(String text) {
    return encrypt(text, publickey);
  }
}