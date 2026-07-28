//import statements
import 'package:flutter/material.dart';
import '../utils/colors.dart';

//creates custom button widgets across the app with a consistent style and behavior
class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

//constructor for the CustomButton class
  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

//builds the CustomButton widget with specified text, icon, and onPressed callback
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}