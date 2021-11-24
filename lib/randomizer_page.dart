import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  RandomizerPage({Key? key, required this.min, required this.max})
      : super(key: key);

  final int min;
  final int max;

  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    final _generatedNumber = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          _generatedNumber.value?.toString() ?? 'Generate a number',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _generatedNumber.value = randomGenerator.nextInt(max + 1 - min) + min;
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
