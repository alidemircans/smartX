import 'package:flutter/material.dart';
import 'package:smartx/core/constants/string_constants.dart';
import 'package:smartx/core/utils/text/text_generator_widget.dart';

class GoRouterErrorPage extends StatelessWidget {
  const GoRouterErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextStyleGenerator(
          text: AppStrings.ups,
        ),
      ),
    );
  }
}
