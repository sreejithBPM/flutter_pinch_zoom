import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<PhotoData> photos = [
    PhotoData(
      imageUrl: 'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmF0dXJlfGVufDB8fDB8fHww',
      mainHeading: 'Nature Scene 1',
      subHeading: 'A beautiful landscape with mountains and lakes.',
    ),
    PhotoData(
      imageUrl: 'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bmF0dXJlfGVufDB8fDB8fHww',
      mainHeading: 'City Lights',
      subHeading: 'Night view of a city with dazzling lights.',
    ),
    // Add more photos with main and subheadings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Feed'),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300, // Set a maximum height as needed
                ),
                child: PhotoView(
                  imageProvider: NetworkImage(photos[index].imageUrl),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      photos[index].mainHeading,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      photos[index].subHeading,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class PhotoData {
  final String imageUrl;
  final String mainHeading;
  final String subHeading;

  PhotoData({
    required this.imageUrl,
    required this.mainHeading,
    required this.subHeading,
  });
}