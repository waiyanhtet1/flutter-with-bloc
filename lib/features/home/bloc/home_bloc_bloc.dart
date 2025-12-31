import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_app/data/cart_items.dart';
import 'package:flutter_bloc_app/data/grocery_data.dart';
import 'package:flutter_bloc_app/data/wishlist_items.dart';
import 'package:flutter_bloc_app/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeEvent, HomeState> {
  HomeBlocBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateWishlistEvent>(homeNavigateWishlistEvent);
    on<HomeNavigateCartEvent>(homeNavigateCartEvent);
    on<HomeClickWishlistEvent>(homeClickWishlistEvent);
    on<HomeClickCartEvent>(homeClickCartEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeSuccessState(
        products: GroceryData.groceryList
            .map(
              (item) => ProductModel(
                id: item['id'],
                name: item['name'],
                category: item['category'],
                price: item['price'],
                unit: item['unit'],
                imageUrl: item['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
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

  FutureOr<void> homeClickWishlistEvent(
    HomeClickWishlistEvent event,
    Emitter<HomeState> emit,
  ) {
    print('wishlistclick');
    emit(HomeWishlistItemState());
    wishlistItems.add(event.clickedProduct);
  }

  FutureOr<void> homeClickCartEvent(
    HomeClickCartEvent event,
    Emitter<HomeState> emit,
  ) {
    print('cart click');
    emit(HomeCartItemState());
    cartItems.add(event.clickedProduct);
  }
}
