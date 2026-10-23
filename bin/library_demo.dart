// ignore_for_file: avoid_print

import 'package:module_control_1/models/library.dart';

void main() {
  final library = Library();

  library.addItem(
    const Book(
      title: 'Dart у дії',
      year: 2022,
      author: 'І. Петренко',
    ),
  );

  library.addItem(
    const Magazine(
      title: 'Mobile Dev',
      year: 2023,
      issueNumber: 5,
    ),
  );

  print('Видання за 2022 рік:');
  for (final item in library.findByYear(2022)) {
    print(item.describe());
  }

  print('\nУсі видання:');
  for (final description in library.allDescriptions) {
    print(description);
  }

  print('\nНайстаріше видання:');
  print(library.findOldest()?.describe() ?? 'Бібліотека порожня');

  print('\nПеревірка порожньої бібліотеки:');
  print(Library().findOldest() ?? 'Немає видань');
}
