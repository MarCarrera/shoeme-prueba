import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoeme_app/models/view_model.dart';

import '../../../controller/request.dart';

class SearchInput extends StatefulWidget {
  final Function onRefreshSuccess;
  final Function(List<Calzado>) onCalzadosSelected;
  const SearchInput({
    super.key,
    required this.onCalzadosSelected,
    required this.onRefreshSuccess,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  String? selectedSucursalName;
  bool isSearched = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.02;
    double paddingSize = screenWidth * 0.05;

    void _showSearchModal(
        BuildContext context, Function(List<Calzado>) onCalzadosSelected) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: screenHeight * 0.2,
            child: FutureBuilder<List<Sucursal>>(
              future: getSucursales(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No hay datos disponibles.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return ListTile(
                        title: Text(item.nombre),
                        onTap: () async {
                          setState(() {
                            selectedSucursalName = item.nombre;
                            isSearched = true;
                          });
                          Navigator.pop(context);
                          List<Calzado> calzados = await getShoesById(
                              idAlmacen: item.idSucursal.toString());
                          //se notifica a Home los calzados obtenidos
                          widget.onCalzadosSelected(calzados);
                        },
                      );
                    },
                  );
                }
              },
            ),
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: paddingSize),
      child: GestureDetector(
        onTap: () {
          _showSearchModal(context, widget.onCalzadosSelected);
        },
        child: Container(
          height: screenHeight * 0.052, //125,
          width: screenWidth * 0.7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                    color: Color(0x4A828282),
                    offset: Offset(0, 6),
                    blurRadius: 8,
                    spreadRadius: 4)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedSucursalName ?? 'Buscar por sucursal',
                  style: TextStyle(fontSize: fontSize * 0.9),
                ),
                GestureDetector(
                    onTap: () {
                      if (isSearched) {
                        widget.onRefreshSuccess();
                        setState(() {
                          selectedSucursalName = null;
                        });
                      } 
                    },
                    child: isSearched
                        ? Icon(Icons.close_rounded)
                        : Icon(Icons.search))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
