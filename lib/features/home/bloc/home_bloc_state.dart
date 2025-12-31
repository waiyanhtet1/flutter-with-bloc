part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<ProductModel> products;
  HomeSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateWishlistState extends HomeActionState {}

class HomeNavigateCartState extends HomeActionState {}

class HomeWishlistItemState extends HomeActionState {}

class HomeCartItemState extends HomeActionState {}
