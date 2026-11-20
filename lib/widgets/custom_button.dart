//import statements
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/accessibility.dart';

//creates custom button widgets across the app with a consistent style and behavior
class CustomButton extends StatefulWidget {
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

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

//CustomButton class
class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  //builds the CustomButton widget with specified text, icon, and onPressed callback
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;

        //animated button changes appearance when pressed for better user experience
        return AnimatedScale(
          duration: const Duration(milliseconds: 140),
          scale: _isPressed ? 0.97 : 1.0,
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: _isPressed ? 0.12 : 0.18,
                  ),
                  blurRadius: _isPressed ? 8 : 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onPressed,
                onTapDown: (_) => setState(() => _isPressed = true),
                onTapUp: (_) => setState(() => _isPressed = false),
                onTapCancel: () => setState(() => _isPressed = false),
                borderRadius: BorderRadius.circular(16),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.deepForest,
                        AppColors.forestGradientMiddle,
                        AppColors.forestGradientEnd,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: isWide ? 72 : 58),
                    padding: EdgeInsets.symmetric(
                      horizontal: isWide ? 24 : 20,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          widget.icon,
                          size: accessibleIconSize(context, isWide ? 24 : 20),
                          color: AppColors.buttonText,
                        ),
                        SizedBox(width: isWide ? 16 : 12),
                        Flexible(
                          child: Text(
                            widget.text,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(
                                  fontSize: isWide ? 20 : 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2,
                                  color: AppColors.buttonText,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
