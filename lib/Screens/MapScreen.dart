import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../Components/BranchCard.dart';
import '../Constants/Colors.dart';
import '../Constants/Fonts.dart';
import '../Components/Map.dart';
import '../Data/Branches.dart';
import '../Screens/Home.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int selectedBranchIndex = -1;
  LatLng? _selectedLocation;

  void _onSelectBranch(int index, LatLng location) {
    setState(() {
      selectedBranchIndex = index;
      _selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<BranchCard> branches = getBranches(
      selectedBranchIndex: selectedBranchIndex,
      onSelectBranch: _onSelectBranch,
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: yellow,
        title: Text(
          'إختر الفرع',
          style: kMessiri_20.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Map screen
          Map(
            selectedLocation: _selectedLocation,
            showRoute: selectedBranchIndex != -1,
          ),

          // Scrollable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: lightgrey,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 8,
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, top: 10, right: 140, left: 140),
                      child: Container(
                        height: 4.0,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // Display branch cards dynamically
                    ...branches,
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: ElevatedButton(
                        onPressed: selectedBranchIndex == -1
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(
                                      branchTitle:
                                          branches[selectedBranchIndex].title,
                                      isOpen: branches[selectedBranchIndex]
                                          .isOpen(),
                                    ),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          backgroundColor:
                              selectedBranchIndex == -1 ? darkgrey : yellow,
                        ),
                        child: Center(
                          child: Text(
                            'إرسال',
                            style: kMessiri_16.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
