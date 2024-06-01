import 'package:artisan_shop/components/cart_item.dart';
import 'package:artisan_shop/pages/models/artModel.dart';
import 'package:artisan_shop/pages/models/cart.dart';
import 'package:artisan_shop/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import the payment form

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const Text(
              'Art Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),

            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: value.getuserCart().length,
                itemBuilder: (context, index) {
                  // Get individual art
                  Art individualArt = value.getuserCart()[index];

                  // Return the cart item
                  return CartItem(art: individualArt);
                },
              ),
            ),

            // Proceed to Payment Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentForm()),
                    );
                  },
                  child: Text('Proceed to Payment'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
