import 'package:flutter/material.dart';
import 'package:playground/src/face%20detection%20api%20chatgpt%20coding/face_detection_view.dart';
import 'package:playground/src/substack%20stack/substack_view.dart';
import 'package:playground/src/what%20a%20drag/drag_select.dart';

import '../settings/settings_view.dart';
import '../animated bg/animated_bg.dart';
import '../sexy prompts/sexy_prompts.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem(1, 'Sample Item'),
      SampleItem(2, 'Substack stack'), 
      SampleItem(3, 'Animated Background'),
      SampleItem(4, 'Drag Select'),
      SampleItem(5, 'Face Detection'),
    ],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierColor: Color(0x01000000),
                builder: (_) => const SexyPrompt(title: 'Sexy promt',)
              );
            }, 
            icon: const Icon(Icons.military_tech)
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
            title: Text(item.title),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              switch (item.id) {
                case 2:
                  Navigator.restorablePushNamed(
                    context,
                    SubstackView.routeName,
                  );
                  break;
                case 3:
                  Navigator.restorablePushNamed(
                    context,
                    AnimatedGradient.routeName,
                  );
                  break;
                case 4:
                  Navigator.restorablePushNamed(
                    context,
                    DragSelect.routeName
                  );
                  break;
                case 5:
                  Navigator.restorablePushNamed(
                    context,
                    FaceDetectionView.routeName
                  );
                  break;
                default:
                  Navigator.restorablePushNamed(
                    context,
                    SampleItemDetailsView.routeName,
                  );
              }
            }
          );
        },
      ),
    );
  }
}
