import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_e_commerce/common/assets/resources.dart';

void main() {
  test('logos assets test', () {
    expect(File(Logos.platzi).existsSync(), isTrue);
  });
}
