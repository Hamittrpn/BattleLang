import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() {
    Hive.init('memory');
  });
  test('Name Box Create and Put', () async {
    final box = await Hive.openBox<String>('hmt');
    await box.add('hamit');

    expect(box.values.first, "hamit");
  });

  // Komple bir listeyi saklamak istediğimde
  test('Name Box Add List', () async {
    final box = await Hive.openBox<String>('hmt');
    await box.clear();
    List<String> items = List.generate(100, (index) => '$index');
    await box.addAll(items);

    expect(box.values.first, "0");
  });

// Liste içerisinde
  test('Name Box Put Items', () async {
    final box = await Hive.openBox<String>('demos');
    await box.clear();
    List<MapEntry<String, String>> items = List.generate(
        100, (index) => MapEntry('$index - $index', 'hmt $index'));
    await box.putAll(Map.fromEntries(items));

    expect(box.get('99 - 99'), 'hmt 99');
  });
}
