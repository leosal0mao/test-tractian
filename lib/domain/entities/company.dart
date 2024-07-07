import 'package:equatable/equatable.dart';

class Company with EquatableMixin {
  final String? id;
  final String? name;

  Company({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
