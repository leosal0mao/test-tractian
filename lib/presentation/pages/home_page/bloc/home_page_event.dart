part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class GetCompaniesEvent extends HomePageEvent {
  const GetCompaniesEvent();

  @override
  List<Object> get props => [];
}
