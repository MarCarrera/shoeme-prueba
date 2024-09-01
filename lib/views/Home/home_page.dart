import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:shoeme_app/utils/constans.dart';
import 'components/add_button.dart';
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
          AddButton(),
        ],
      ),
    );
  }
}


