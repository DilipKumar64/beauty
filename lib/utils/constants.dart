import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors

const kPrimaryColor = Color(0xff175c4c);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const kSelectedNavBarColor = Color(0xff165b4b);
const kUnselectedNavBarColor = Colors.black;
const kSelectedNavBarBackColor = Color(0xffd7e1df);

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.roboto(
      fontSize: 48, fontWeight: FontWeight.w700, color: Colors.white),
  displayMedium: GoogleFonts.merriweather(
      fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.merriweather(
      fontSize: 33,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
      color: const Color(0xFF343046)),
  headlineSmall:
      GoogleFonts.merriweather(fontSize: 23, fontWeight: FontWeight.w700),
  titleLarge:
      GoogleFonts.merriweather(fontSize: 33, fontWeight: FontWeight.w500),
  titleMedium: GoogleFonts.merriweather(fontSize: 18),
  titleSmall:
      GoogleFonts.merriweather(fontSize: 13, fontWeight: FontWeight.w500),
  bodyLarge: GoogleFonts.merriweather(fontSize: 15),
  bodyMedium: GoogleFonts.merriweather(fontSize: 13),
  bodySmall: GoogleFonts.merriweather(fontSize: 12),
  labelLarge: GoogleFonts.merriweather(fontSize: 22),
  labelSmall: GoogleFonts.merriweather(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
// ignore: constant_identifier_names
const String USER_LOGGED_IN = 'isUserLoggedIn';
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
Reference firebaseStorage = FirebaseStorage.instance.ref();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// carousal
const List<String> carouselImages = [
  "assets/images/carousel1.png",
  "assets/images/carousel3.png",
  "assets/images/caurasel-image2.png",
];

const List<Map<String, String>> categoryImages = [
  {
    'title': 'Haircut',
    'image': 'assets/images/haircut.png',
  },
  {
    'title': 'Nails',
    'image': 'assets/images/nails.png',
  },
  {
    'title': 'Facial',
    'image': 'assets/images/facial.png',
  },
  {
    'title': 'Coloring',
    'image': 'assets/images/coloring.png',
  },
  {
    'title': 'Spa',
    'image': 'assets/images/spa.png',
  },
  {
    'title': 'Waxing',
    'image': 'assets/images/waxing.png',
  },
  {
    'title': 'Makeup',
    'image': 'assets/images/makeup.png',
  },
  {
    'title': 'Massage',
    'image': 'assets/images/massage.png',
  },
];
// const List<Map<String, IconData>> profileData = [
//   {'title': 'Home', IconData: Icons.home_outlined},
// ];
