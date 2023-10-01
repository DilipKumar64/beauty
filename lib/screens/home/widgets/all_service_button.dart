import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class AllServiceButton extends StatelessWidget {
  const AllServiceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: BorderSide(color: kPrimaryColor.withOpacity(0.3)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: const Text('All Services'),
      ),
    );
  }
}
