import 'dart:io';

import 'package:module_control_1/services/weather_service.dart';

Future<void> main() async {
  final service = WeatherService();

  stdout.writeln('=== Поточна погода ===');

  try {
    final weather = await service.fetchCurrentWeather('Київ');
    stdout.writeln('Місто: ${weather['city']}');
    stdout.writeln('Температура: ${weather['temperature']} °C');
    stdout.writeln('Умови: ${weather['condition']}');
  } catch (error) {
    stdout.writeln('Помилка отримання погоди: $error');
  }

  stdout.writeln('\n=== Перевірка порожнього міста ===');

  try {
    await service.fetchCurrentWeather('');
  } catch (error) {
    stdout.writeln('Очікувана помилка: $error');
  }

  stdout.writeln('\n=== Оновлення температури ===');

  await for (final temperature in service.temperatureUpdates(times: 5)) {
    stdout.writeln('Температура: $temperature °C');
  }

  stdout.writeln('Оновлення завершено.');
}
