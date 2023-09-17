import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:camera/camera.dart';

class Learn extends StatefulWidget {
  final List<CameraDescription> cameras; // List of available cameras

  Learn({required this.cameras}); // Constructor that accepts cameras parameter

  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Initialize the camera
    _controller = CameraController(
      widget.cameras[0], // Use the first available camera
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                kPrimaryPurple,
                kPrimaryBlue,
              ], // Change colors as needed
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: GestureDetector(
                  child: GlassContainer(
                    height: 50,
                    width: 50,
                    blur: 8,
                    color: Colors.white.withOpacity(1),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.blue.withOpacity(0.6),
                      ],
                    ),
                    //--code to remove border
                    border: Border.fromBorderSide(BorderSide.none),
                    shadowStrength: 8,
                    borderRadius: BorderRadius.circular(16),
                    shadowColor: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: Text("Learn", style: kHeadingTextStyle),
              ),
              Expanded(
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, display the camera preview
                      return CameraPreview(_controller);
                    } else {
                      // Otherwise, display a loading indicator
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}