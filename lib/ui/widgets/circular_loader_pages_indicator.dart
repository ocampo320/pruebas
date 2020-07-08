import 'package:app/ui/platform_widgets/platform_progress_indicator.dart';
import 'package:flutter/material.dart';

class CircularLoaderPageIndicator extends StatelessWidget {
  final String text;

  CircularLoaderPageIndicator({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          PlatformProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
