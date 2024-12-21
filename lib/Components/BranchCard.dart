import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:fry_guys/Constants/Colors.dart';
import 'CardContent.dart';
import '../Constants/Fonts.dart';

class BranchCard extends StatelessWidget {
  final int index;
  final String title;
  final String address;
  final String distance;
  final TimeOfDay openingStart; // Start time of opening hours
  final TimeOfDay openingEnd; // End time of opening hours
  final String phoneNumber;
  final int selectedBranchIndex;
  final Function(int, LatLng) onSelect;
  final LatLng location; // Added location field
  final LatLng? currentLocation; // Current location of the user (optional)

  const BranchCard({
    super.key,
    required this.index,
    required this.title,
    required this.address,
    required this.distance,
    required this.openingStart,
    required this.openingEnd,
    required this.phoneNumber,
    required this.selectedBranchIndex,
    required this.onSelect,
    required this.location, // Initialize location
    this.currentLocation, // Initialize current location
  });

  /// Check if the branch is open based on the current time
  bool isOpen() {
    final now = TimeOfDay.now();
    if (openingStart.hour < openingEnd.hour) {
      return now.hour > openingStart.hour && now.hour < openingEnd.hour;
    } else {
      // Handles cases where opening hours span midnight
      return now.hour >= openingStart.hour || now.hour < openingEnd.hour;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedBranchIndex == index;
    bool openStatus = isOpen();

    return GestureDetector(
      onTap: () => onSelect(index, location), // Pass the location to onSelect
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              // Title
              Text(
                title,
                style: kMessiri_14.copyWith(color: yellow),
              ),
              const SizedBox(height: 5),

              // Status and Distance
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        openStatus ? "مفتوح" : "مغلق",
                        style: openStatus
                            ? kMessiri_10.copyWith(color: green)
                            : kMessiri_10.copyWith(color: Colors.red),
                      ),
                      const SizedBox(height: 5),

                      // distance
                      Text(
                        distance,
                        style: kMessiri_10.copyWith(color: yellow),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Address
                        CardContent(
                          text: address,
                          icon: Icons.location_on,
                          textStyle: kMessiri_10,
                          iconColor: darkgrey,
                        ),
                        // Phone Number
                        CardContent(
                          text: phoneNumber,
                          icon: Icons.phone_enabled_rounded,
                          textStyle: kMessiri_10,
                          iconColor: darkgrey,
                        ),
                        // Work Time
                        CardContent(
                          text:
                              '${openingStart.format(context)} - ${openingEnd.format(context)}',
                          icon: Icons.access_time,
                          textStyle: kMessiri_10,
                          iconColor: darkgrey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
