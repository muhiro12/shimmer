import 'package:hive/hive.dart';
import 'package:shimmer/model/enum_parser.dart';

part 'shimmer_category.g.dart';

@HiveType(typeId: 1)
enum ShimmerCategory {
  @HiveField(0)
  plain,

  @HiveField(1)
  concert,

  @HiveField(2)
  movie,

  @HiveField(3)
  book,

  @HiveField(4)
  cafe,

  @HiveField(5)
  museum,
}

extension ShimmerCategoryExtension on ShimmerCategory {
  String toUpperCamelCaseString() {
    return EnumParser.upperCamelCaseStringOf(this);
  }
}
