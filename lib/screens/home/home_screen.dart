import 'package:beauty/screens/home/widgets/all_service_button.dart';
import 'package:beauty/screens/home/widgets/carousal_image.dart';
import 'package:beauty/screens/home/widgets/catagory_component.dart';
import 'package:beauty/screens/home/widgets/custom_app_bar.dart';
import 'package:beauty/screens/home/widgets/offer_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16.0,
            top: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(height: 20),
              const CarouselImage(),
              const SizedBox(height: 40),
              const CatagoryComponent(),
              const SizedBox(height: 20),
              const AllServiceButton(),
              const SizedBox(height: 20),
              OfferCard(size: size)
            ],
          ),
        ),
      ),
    ));
  }
}
