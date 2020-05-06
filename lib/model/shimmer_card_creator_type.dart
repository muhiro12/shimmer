enum ShimmerCardCreatorType {
  create,
  edit,
}

extension ShimmerCardCreatorTypeExtension on ShimmerCardCreatorType {
  String title() {
    switch (this) {
      case ShimmerCardCreatorType.create:
        return 'Create';
      case ShimmerCardCreatorType.edit:
        return 'Save';
      default:
        return null;
    }
  }
}
