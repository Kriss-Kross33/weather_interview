import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class ErrorWiget extends StatelessWidget {
  const ErrorWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
