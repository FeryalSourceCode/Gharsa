import 'package:flutter/material.dart';

class PlantBankInfoDetails extends StatelessWidget {

  final int plantId;
  const PlantBankInfoDetails({super.key, required this.plantId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Plant Details"),
        centerTitle: true,
      ),
      body: Text("The index is: $plantId"),
    );
  }
}
