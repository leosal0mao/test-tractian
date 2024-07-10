import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_tractian/domain/usecases/get_all_companies.dart';

import '../../../../domain/entities/company.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({
    required GetAllCompanies getAllCompanies,
  })  : _getAllCompanies = getAllCompanies,
        super(const HomePageState()) {
    on<GetCompaniesEvent>((event, emit) async {
      _getCompanies(event, emit);
    });
  }

  final GetAllCompanies _getAllCompanies;

  Future<void> _getCompanies(event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));

    final list = await _getAllCompanies();

    emit(
      state.copyWith(
        status: HomePageStatus.success,
        companies: list,
      ),
    );
  }
}
