import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/configurations.dart';
import 'package:shimmer/interface/database/configurations_data_store.dart';
import 'package:shimmer/model/configurations_repository.dart';

class ConfigurationsDataStoreTest extends ConfigurationsDataStoreInterface {
  @override
  Configurations load() {
    return Configurations();
  }

  @override
  void save(Configurations configurations) {}
}

void main() {
  final instance = ConfigurationsRepository(ConfigurationsDataStoreTest());
  group(
    'load() case test data',
    () {
      final result = instance.load();
      test(
        'return value should not be null',
        () {
          expect(
            result != null,
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
            Colors.blue,
          );
        },
      );
    },
  );
  group(
    'fetchIsSystemTheme() case test data',
    () {
      final result = instance.fetchIsSystemTheme();
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
        'return value should not be true',
        () {
          expect(
            result != true,
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
        'return value should not be true',
        () {
          expect(
            result != true,
            true,
          );
        },
      );
    },
  );
}
