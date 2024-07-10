import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'asset_page_event.dart';
part 'asset_page_state.dart';

class AssetPageBloc extends Bloc<AssetPageEvent, AssetPageState> {
  AssetPageBloc() : super(AssetPageInitial()) {
    on<AssetPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
