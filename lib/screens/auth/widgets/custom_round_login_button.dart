import 'package:flutter/material.dart';

class CustomRoundLoginButon extends StatelessWidget {
  const CustomRoundLoginButon({
    super.key,
    required this.voidCallback,
    required this.logoUrl,
  });
  final VoidCallback voidCallback;
  final String logoUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 226, 225, 225),
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 212, 212, 212),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 40,
        child: Image.asset(logoUrl),
      ),
    );
  }
}
