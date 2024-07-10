import 'package:flutter/material.dart';
import 'package:test_tractian/presentation/constants/colors.dart';

class CompanyButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  const CompanyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBlue,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.view_comfy_alt_sharp,
            color: AppColors.whiteTextColor,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
