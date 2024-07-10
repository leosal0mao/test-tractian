part of 'asset_page_bloc.dart';

sealed class AssetPageState extends Equatable {
  const AssetPageState();
  
  @override
  List<Object> get props => [];
}

final class AssetPageInitial extends AssetPageState {}
