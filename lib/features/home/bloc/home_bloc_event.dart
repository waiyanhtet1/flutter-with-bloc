part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeClickWishlistEvent extends HomeEvent {}

class HomeClickCartEvent extends HomeEvent {}

class HomeNavigateWishlistEvent extends HomeEvent {}

class HomeNavigateCartEvent extends HomeEvent {}
