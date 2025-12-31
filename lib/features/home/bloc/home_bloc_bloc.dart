import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeEvent, HomeState> {
  HomeBlocBloc() : super(HomeInitial()) {
    on<HomeNavigateWishlistEvent>(homeNavigateWishlistEvent);
    on<HomeNavigateCartEvent>(homeNavigateCartEvent);
  }

  FutureOr<void> homeNavigateWishlistEvent(
    HomeNavigateWishlistEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Wishlist Navigate Click");
    emit(HomeNavigateWishlistState());
  }

  FutureOr<void> homeNavigateCartEvent(
    HomeNavigateCartEvent event,
    Emitter<HomeState> emit,
  ) {
    print("Cart Navigate Click");
    emit(HomeNavigateCartState());
  }
}
