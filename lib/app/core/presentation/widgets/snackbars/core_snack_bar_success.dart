import 'package:flutter/material.dart';

class CoreSnackBarSuccess extends StatelessWidget {
  const CoreSnackBarSuccess({super.key, required this.message});
  final String message;

  show() => SnackBar(content: this, duration: const Duration(seconds: 3));

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(
        Icons.done,
        size: 35,
        color: Theme.of(context).colorScheme.onInverseSurface,
      ),
      const SizedBox(width: 25),
      Flexible(
          child: Text(
        message,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      )),
    ]);
  }
}
