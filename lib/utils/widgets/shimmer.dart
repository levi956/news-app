import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  final bool? isEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                enabled: isEnabled!,
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 32,
                  width: 87,
                  decoration: BoxDecoration(
                    color: backgroundWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Shimmer.fromColors(
                enabled: isEnabled!,
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 24,
                  width: 215,
                  decoration: BoxDecoration(
                    color: backgroundWhite,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Shimmer.fromColors(
                    enabled: isEnabled!,
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 32,
                      width: 87,
                      decoration: BoxDecoration(
                        color: backgroundWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Shimmer.fromColors(
                    enabled: isEnabled!,
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 32,
                      width: 87,
                      decoration: BoxDecoration(
                        color: backgroundWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Shimmer.fromColors(
                    enabled: isEnabled!,
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 32,
                      width: 87,
                      decoration: BoxDecoration(
                        color: backgroundWhite,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Shimmer.fromColors(
                enabled: isEnabled!,
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: 215,
                  decoration: BoxDecoration(
                    color: backgroundWhite,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Shimmer.fromColors(
                enabled: isEnabled!,
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 32,
                  width: 87,
                  decoration: BoxDecoration(
                    color: backgroundWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Shimmer.fromColors(
                  enabled: isEnabled!,
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: backgroundWhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
