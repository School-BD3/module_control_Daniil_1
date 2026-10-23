import 'dart:async';
import 'dart:math';

class WeatherService {
  final Random _random = Random();

  Future<Map<String, dynamic>> fetchCurrentWeather(
    String city,
  ) async {
    if (city.trim().isEmpty) {
      throw ArgumentError('Місто не вказано');
    }

    await Future.delayed(
      Duration(seconds: 1 + _random.nextInt(2)),
    );

    const conditions = [
      'Сонячно',
      'Хмарно',
      'Дощ',
      'Мінлива хмарність',
    ];

    return {
      'city': city.trim(),
      'temperature': 10 + _random.nextInt(21),
      'condition': conditions[_random.nextInt(conditions.length)],
    };
  }

  Stream<int> temperatureUpdates({int times = 5}) async* {
    if (times < 0) {
      throw ArgumentError('Кількість оновлень не може бути від’ємною');
    }

    for (var i = 0; i < times; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield -5 + _random.nextInt(36);
    }
  }
}
