part of 'home_page_bloc.dart';

enum HomePageStatus { initial, loading, success, failure }

class HomePageState extends Equatable {
  final HomePageStatus status;
  final List<Company> companies;
  const HomePageState({
    this.status = HomePageStatus.initial,
    this.companies = const [],
  });

  HomePageState copyWith({
    HomePageStatus? status,
    List<Company>? companies,
  }) {
    return HomePageState(
      status: status ?? this.status,
      companies: companies ?? this.companies,
    );
  }

  @override
  List<Object> get props => [status, companies];
}

final class HomePageInitial extends HomePageState {}
