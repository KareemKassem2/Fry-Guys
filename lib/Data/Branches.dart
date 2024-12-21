import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../Components/BranchCard.dart';

List<BranchCard> getBranches({
  required int selectedBranchIndex,
  required Function(int, LatLng) onSelectBranch,
}) {
  return [
    BranchCard(
      index: 0,
      title: 'فرع أبو عريش',
      address: 'حي الروضة - طريق الأمير السلطان جيزان',
      distance: '1.45 كم',
      openingStart: const TimeOfDay(hour: 1, minute: 30), // Start time
      openingEnd: const TimeOfDay(hour: 12, minute: 0), // End time
      phoneNumber: '+966547367971',
      selectedBranchIndex: selectedBranchIndex,
      onSelect: onSelectBranch,
      location: const LatLng(16.9408, 42.5494),
    ),
    BranchCard(
      index: 1,
      title: 'فرع العارضة',
      address: 'شارع التحلية - جدة',
      distance: '3.25 كم',
      openingStart: const TimeOfDay(hour: 9, minute: 0), // Start time
      openingEnd: const TimeOfDay(hour: 23, minute: 0), // End time
      phoneNumber: '+966547367972',
      selectedBranchIndex: selectedBranchIndex,
      onSelect: onSelectBranch,
      location: const LatLng(21.4858, 39.1925),
    ),
  ];
}
