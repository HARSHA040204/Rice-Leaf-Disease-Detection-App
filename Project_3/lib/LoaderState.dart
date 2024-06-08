
import 'package:flutter/material.dart';

class LoaderState extends StatefulWidget {
  const LoaderState({Key? key}) : super(key: key);

  @override
  _LoaderStateState createState() => _LoaderStateState();
}

class _LoaderStateState extends State<LoaderState>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(); // Repeat the animation
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _animation,
        child: Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: Color(0xC42B2B),
            borderRadius: BorderRadius.circular(1.0),
          ),
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ),
    );
  }
}
