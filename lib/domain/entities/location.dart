import 'package:equatable/equatable.dart';

class Location with EquatableMixin {
  final String? id;
  final String? name;
  final String? parentId;

  Location({
    this.id,
    this.name,
    this.parentId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        parentId,
      ];
}
