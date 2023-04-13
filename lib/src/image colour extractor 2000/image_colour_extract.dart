import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ImageExtractor extends StatefulWidget {
  const ImageExtractor({
    super.key,
    required this.imagePath
  });

  final String imagePath;

  @override
  State<ImageExtractor> createState() => _ImageExtractorState();
}

class _ImageExtractorState extends State<ImageExtractor> {
  late PaletteGenerator paletteGenerator;

  Future<PaletteGenerator> _updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset(widget.imagePath).image,
    );
    return paletteGenerator;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaletteGenerator>(
      future: _updatePaletteGenerator(),
      builder: (context, AsyncSnapshot<PaletteGenerator> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          //padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: snapshot.data!.darkMutedColor!.color.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 40,
                offset: const Offset(-4, -4),
              ),
              BoxShadow(
                color: snapshot.data!.dominantColor!.color.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 40,
                offset: const Offset(4, 4),
              ),
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(widget.imagePath)
          ),
        );
      }
    );
  }
}