import 'package:flutter/material.dart';

void main() {
  runApp(const Loading());
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: Image.network(
                          "http://cdn.shopify.com/s/files/1/0321/9596/9069/collections/cartoon-network-portal.png?v=1588605085"),
    );
  }
}
