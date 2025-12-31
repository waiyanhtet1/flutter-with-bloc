import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/cart/ui/cart_screen.dart';
import 'package:flutter_bloc_app/features/home/bloc/home_bloc_bloc.dart';
import 'package:flutter_bloc_app/features/home/ui/product_card.dart';
import 'package:flutter_bloc_app/features/wishlist/ui/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBlocBloc homeBloc = HomeBlocBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateWishlistState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistScreen()),
          );
        } else if (state is HomeNavigateCartState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        } else if (state is HomeWishlistItemState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Item was added to wishlist')));
        } else if (state is HomeCartItemState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Item was added to cart')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Grocery Store"),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeNavigateWishlistEvent());
                },
                icon: Icon(Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeNavigateCartEvent());
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
            ],
          ),
          body: _buildBody(state, homeBloc),
        );
      },
    );
  }
}

Widget _buildBody(HomeState state, HomeBlocBloc homeBloc) {
  switch (state.runtimeType) {
    case HomeLoadingState:
      return Center(child: CircularProgressIndicator());

    case HomeSuccessState:
      final successState = state as HomeSuccessState;

      return ListView.builder(
        itemCount: successState.products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: successState.products[index],
            homeBloc: homeBloc,
          );
        },
      );

    case HomeErrorState:
      return Center(child: Text("Error"));

    default:
      return SizedBox();
  }
}
