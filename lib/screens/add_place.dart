import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../providers/user_places.dart';
import '../models/place.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation; // 1. Added the location state variable

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }

    // 3. Passing the actual fetched location to Riverpod instead of the dummy data
    ref.read(userPlacesProvider.notifier).addPlace(
      enteredTitle,
      _selectedImage!,
      _selectedLocation!,
    );

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24), // Increased padding for a cleaner, modern layout
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretches elements to full width
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 24), // Increased spacing for better UI breathing room
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 24),
            // 4. Hooking up the callback to grab the location from LocationInput
            LocationInput(
              onSelectLocation: (location) {
                _selectedLocation = location;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add_rounded),
              label: const Text(
                'Add Place',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary, // Vibrant Blue
                foregroundColor: Colors.white, // Crisp white text
                elevation: 2,
                shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}