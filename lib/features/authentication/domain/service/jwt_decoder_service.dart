import 'package:flutter_e_commerce/features/authentication/domain/model/oauth.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JWTValidator {
  final JwtDecoder decoder;

  const JWTValidator(this.decoder);

  bool hasExpired(OAuth oAuth) {
    final expirationDate = JwtDecoder.getExpirationDate(oAuth.accessToken);
    return DateTime.now().isAfter(expirationDate);
  }

}
