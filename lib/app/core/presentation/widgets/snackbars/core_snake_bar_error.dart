import 'package:flutter/material.dart';

class CoreSnackBarError extends StatelessWidget {
  const CoreSnackBarError({super.key, required this.message});
  final String message;

  show(BuildContext context) => SnackBar(
      backgroundColor: Theme.of(context).colorScheme.error, content: this, duration: const Duration(seconds: 3));

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(
        Icons.warning,
        size: 40,
        color: Theme.of(context).colorScheme.onError,
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
