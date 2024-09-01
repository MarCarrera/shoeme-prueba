import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:shoeme_app/utils/constans.dart';
import 'components/product_card.dart';
import 'components/search_input.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });
  final TextEditingController? editTextController = TextEditingController();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.02;
    double paddingSize = screenWidth * 0.05;

    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              SearchInput(),
              SizedBox(
                height: 24,
              ),
              const ProductCard(),
              const ProductCard(),
              const ProductCard(),
              const ProductCard(),
              const ProductCard(),

              //Boton agregar calzado
            ],
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(
                  left: paddingSize * 15, top: paddingSize * 34),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const AddScreen();
                  //     },
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: TColors.blueColor,
                  padding: const EdgeInsets.all(6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Container(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.045,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
