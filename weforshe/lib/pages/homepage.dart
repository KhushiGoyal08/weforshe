import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weforshe/controller/auth/auth_controller.dart';
import 'package:weforshe/controller/image_picker_controller.dart';
import 'package:weforshe/utils/const.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  HomeScreen({super.key});
  final ImagePickerController _controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('Trend Tracker',
            style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authController.logout(),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CustomCard(context);
        },
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child:
            // Obx(
            // ()=>
            FloatingActionButton(
          backgroundColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // ignore: unnecessary_null_comparison
          onPressed: () {
            _controller.pickImage(ImageSource.camera);
          },
          child: const Text(
            "Myntra Mirror",
          ),
        ),
        // ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomCard(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Image(
                image: AssetImage(
                  getRandomImages(images),
                ),
                fit: BoxFit.cover,
                // height: 200,
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Image(
              image: AssetImage(
                getRandomImages(images),
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'KAVINDI',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Row(
            children: [
              Text(
                '₹1,699  ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
              Text(
                '₹6,796',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const Text(
            '75% OFF',
            style: TextStyle(
              fontSize: 14,
              color: Colors.green,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
              Text(
                '3.8',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
