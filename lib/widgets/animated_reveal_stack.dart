import 'package:flutter/material.dart';
import 'package:playground/app/common.dart';

class AnimatedRevealStack extends StatefulWidget {
  const AnimatedRevealStack({super.key});

  static PageRoute<AnimatedRevealStack> route() =>
      MaterialPageRoute(builder: (_) => const AnimatedRevealStack());

  @override
  State<AnimatedRevealStack> createState() => _AnimatedRevealStackState();
}

class _AnimatedRevealStackState extends State<AnimatedRevealStack> {
  bool isExpanded = false;
  final double partialVisibleHeight = 40;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Reveal Stack'),
      ),
      body: Stack(
        children: [
          ColoredBox(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF19171A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: List.generate(
                        20,
                        (index) => const Column(
                          children: [
                            RowAddress(),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: isExpanded ? -(screenHeight - partialVisibleHeight) : 0,
            left: 0,
            right: 0,
            height: screenHeight,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                // Allow dragging down to collapse
                if (details.primaryDelta! > 0 && isExpanded) {
                  toggleExpanded();
                }
              },
              onVerticalDragEnd: (details) {
                // Optional: add logic here
              },
              onTap: toggleExpanded,
              child: ClipRRect(
                borderRadius: isExpanded
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                    : BorderRadius.zero,
                child: ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        ListView(
                          physics: isExpanded
                              ? const NeverScrollableScrollPhysics()
                              : const AlwaysScrollableScrollPhysics(),
                          children: [
                            Container(
                              height: 300,
                              decoration: skeletonDecoration,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 200,
                                        decoration: skeletonDecoration,
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 10,
                                        width: 100,
                                        decoration: skeletonDecoration,
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 28,
                                  color: skeletonColor,
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.more_horiz,
                                  size: 28,
                                  color: skeletonColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 1,
                              decoration: skeletonDecoration,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 80,
                                        decoration: skeletonDecoration,
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 15,
                                        width: 120,
                                        decoration: skeletonDecoration,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 1,
                                  height: 50,
                                  decoration: skeletonDecoration,
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 80,
                                        decoration: skeletonDecoration,
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 15,
                                        width: 120,
                                        decoration: skeletonDecoration,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 1,
                              decoration: skeletonDecoration,
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 200,
                              decoration: skeletonDecoration,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 160),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Swap',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Send',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 8,
                            width: 52,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: skeletonColor,
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowAddress extends StatelessWidget {
  const RowAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFF19171A),
          radius: 28,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 120,
              decoration: skeletonDecoration.copyWith(
                color: const Color(0xFF19171A),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 15,
              width: 80,
              decoration: skeletonDecoration.copyWith(
                color: const Color(0xFF19171A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
