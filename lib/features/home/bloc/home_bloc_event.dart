part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeClickWishlistEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeClickWishlistEvent({required this.clickedProduct});
}

class HomeClickCartEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeClickCartEvent({required this.clickedProduct});
}

class HomeNavigateWishlistEvent extends HomeEvent {}

class HomeNavigateCartEvent extends HomeEvent {}
