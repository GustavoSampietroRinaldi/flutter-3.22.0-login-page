import 'package:flutter/material.dart';
import '/app_theme.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  final bool applyBackground;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  const BasePage({
    super.key,
    required this.child,
    this.applyBackground = true,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          if (applyBackground)
            Container(
              decoration: AppTheme.backgroundDecoration,
              constraints: const BoxConstraints.expand(),
            ),
          SafeArea(
            minimum: const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }
}