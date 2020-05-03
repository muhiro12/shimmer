import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/router/shimmer_card_detail_scaffold_router.dart';
import 'package:shimmer/scaffold/shimmer_card_detail_scaffold.dart';

void main() {
  group(
    'injected()',
    () {
      final result = ShimmerCardDetailScaffoldRouter().injected();
      test(
        'return value type is ShimmerCardDetailScaffold',
        () {
          expect(
            result.runtimeType,
            ShimmerCardDetailScaffold,
          );
        },
      );
    },
  );
}
