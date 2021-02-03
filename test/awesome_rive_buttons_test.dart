import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:awesome_rive_buttons/awesome_rive_buttons.dart';

void main() {
  const MethodChannel channel = MethodChannel('awesome_rive_buttons');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AwesomeRiveButtons.platformVersion, '42');
  });
}
