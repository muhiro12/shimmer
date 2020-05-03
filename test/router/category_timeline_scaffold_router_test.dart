import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/router/category_timeline_scaffold_router.dart';

void main() {
  group(
    'default value',
    () {
      final instance = CategoryTimelineScaffoldRouter();
      test('category is plain', () {
        expect(
          instance.category,
          ShimmerCategory.plain,
        );
      });
    },
  );
}
