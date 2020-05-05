import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/configurations_data_store.dart';
import 'package:shimmer/model/configurations_repository.dart';

class ConfigurationsDataStoreTest extends ConfigurationsDataStoreInterface {
  @override
  T fetch<T>(Configuration key) {
    switch (T) {
      case bool:
        return true as T;
      case int:
        return Colors.red.value as T;
      default:
        return null;
    }
  }

  @override
  void save<T>(Configuration key, T value) {}
}

void main() {
  final instance = ConfigurationsRepository(ConfigurationsDataStoreTest());
  group(
    'fetchIsDarkMode() case test data',
    () {
      final result = instance.fetchIsDarkMode();
      test(
        'return value should not be null',
        () {
          expect(
            result != null,
            true,
          );
        },
      );
      test(
        'return value should be true',
        () {
          expect(
            result,
            true,
          );
        },
      );
    },
  );
  group(
    'fetchIsHandWriting() case test data',
    () {
      final result = instance.fetchIsHandWriting();
      test(
        'return value should not be null',
        () {
          expect(
            result != null,
            true,
          );
        },
      );
      test(
        'return value should be true',
        () {
          expect(
            result,
            true,
          );
        },
      );
    },
  );
  group(
    'fetchPrimaryColor() case test data',
    () {
      final result = instance.fetchPrimaryColor();
      test(
        'return value should not be null',
        () {
          expect(
            result != null,
            true,
          );
        },
      );
      test(
        'return value should be blue value',
        () {
          expect(
            result,
            Colors.red,
          );
        },
      );
    },
  );
}
