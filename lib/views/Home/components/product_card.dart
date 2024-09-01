import 'package:flutter/material.dart';
import 'package:shoeme_app/utils/constans.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.02;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: screenHeight * 0.13, //125,
        width: screenWidth * 0.9, //350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x4A828282),
                  offset: Offset(0, 6),
                  blurRadius: 8,
                  spreadRadius: 4)
            ]),
        child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Marca:',
                                        style: TextStyle(
                                          fontSize: fontSize * 0.9, //14,
                                        ),
                                      ),
                                      Text(
                                        'Adidas',
                                        style: TextStyle(
                                            fontSize: fontSize, //16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Mod:',
                                          style: TextStyle(fontSize: fontSize)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text('AD-5419',
                                          style: TextStyle(
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  Icon(
                                    Icons.edit,
                                    size: fontSize * 1.1,
                                  ),
                                  Icon(
                                    Icons.delete,
                                    size: fontSize * 1.1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('Precio:',
                                        style: TextStyle(
                                            fontSize: fontSize * 0.8)),
                                    Text('580.00',
                                        style: TextStyle(
                                            color: TColors.yellowColor,
                                            fontSize: fontSize * 1.1,
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Número:',
                                        style: TextStyle(
                                            fontSize: fontSize * 0.8)),
                                    Text('#29',
                                        style: TextStyle(
                                            color: TColors.greenColor,
                                            fontSize: fontSize * 1.1,
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Stock:',
                                        style: TextStyle(
                                            fontSize: fontSize * 0.8)),
                                    Text(
                                      '56 pzs',
                                      style: TextStyle(
                                          color: TColors.blueColor,
                                          fontSize: fontSize * 1.1,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
