import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_app/features/home/models/product_model.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.product, required this.cartBloc});

  final ProductModel product;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: BoxBorder.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 12.0, top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  product.category,
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${product.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_outline),
                        ),
                        IconButton(
                          onPressed: () {
                            cartBloc.add(
                              RemoveFromCartEvent(cartItem: product),
                            );
                          },
                          icon: Icon(Icons.shopping_bag),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NetworkImage(product.imageUrl),
        ],
      ),
    );
  }
}
