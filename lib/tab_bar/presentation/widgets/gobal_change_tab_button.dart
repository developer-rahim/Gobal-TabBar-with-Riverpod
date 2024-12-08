part of '../pages/tab_page.dart';

class _GobalChangeTabButton extends ConsumerWidget {
  const _GobalChangeTabButton({
    required this.onPressed,
    required this.buttionText,
  });
  final void Function() onPressed;
  final String buttionText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttionText),
    );
  }
}
