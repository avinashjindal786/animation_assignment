import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:provider/provider.dart';

import '../provider/card_provider.dart';

class OnCompleteAnimation extends StatefulWidget {
  Color color;
  Color iconColor;
  OnCompleteAnimation({required this.color, required this.iconColor});

  @override
  State<OnCompleteAnimation> createState() => _OnCompleteAnimationState();
}

class _OnCompleteAnimationState extends State<OnCompleteAnimation> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    sequenceAnimation = SequenceAnimationBuilder().addAnimatable(animatable: ColorTween(begin: widget.color, end: widget.color), from: const Duration(seconds: 0), to: const Duration(seconds: 2), tag: "color").addAnimatable(animatable: Tween<double>(begin: 7, end: 25.0), from: const Duration(seconds: 0), to: const Duration(milliseconds: 700), tag: "radius", curve: Curves.easeIn).animate(controller);
    controller.forward().orCancel;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  onCompleteFuc(CardsDetailProvider provider) {
    Future.delayed(const Duration(seconds: 4), () {
      provider.changeStatus(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardsDetailProvider>(context);
    onCompleteFuc(provider);
    return AnimatedBuilder(
      builder: (context, child) {
        return Center(
          child: CircleAvatar(
            backgroundColor: sequenceAnimation["color"].value,
            radius: sequenceAnimation["radius"].value,
            child: sequenceAnimation["radius"].value > 24
                ? Center(
                    child: Icon(
                      Icons.check,
                      color: widget.iconColor,
                      size: 35,
                    ),
                  )
                : const SizedBox(),
          ),
        );
      },
      animation: controller,
    );
  }
}
