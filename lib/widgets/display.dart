import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculadora/widgets/common/app_colors.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String value;
  const Display({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: AppColors.display,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                value,
                maxFontSize: 80,
                minFontSize: 20,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(                  
                  fontSize: 70,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),  
              ),
            ),
          ],
        ),
      ),
    );
  }
}
