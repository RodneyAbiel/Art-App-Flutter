import 'package:artisan_shop/pages/models/artModel.dart';
import 'package:flutter/material.dart';

class ArtTile extends StatelessWidget {
  final Art art;
  void Function()? onTap;
  ArtTile({super.key, required this.art, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12)), //tile colour
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // space between pic and item description
        children: [
          // art pic
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(art.imagepath),
          ),
          //description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              art.description,
              style: const TextStyle(color: Colors.amber),
            ),
          ),
          //price + details
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0), //moves the description from the edge
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //art name
                    Text(
                      art.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    //author name
                    Text(
                      art.author,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38),
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    //price
                    Text("\$${art.price}", style: const TextStyle(fontSize: 20))
                  ],
                ),
                //plus button

                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 35),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(12))),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ), //wrap in container to give colour
                  ),
                )
              ],
            ),
          )
          //button to add to cart
        ],
      ),
    );
  }
}
