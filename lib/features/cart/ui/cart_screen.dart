import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_app/features/cart/ui/cart_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart Items'),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
          body: _buildBody(state, cartBloc),
        );
      },
    );
  }
}

Widget _buildBody(CartState state, CartBloc cartBloc) {
  switch (state.runtimeType) {
    case CartSuccessState:
      final successState = state as CartSuccessState;

      return ListView.builder(
        itemCount: successState.cartItems.length,
        itemBuilder: (context, index) {
          return CartCard(
            product: successState.cartItems[index],
            cartBloc: cartBloc,
          );
        },
      );
    default:
      return SizedBox();
  }
}
