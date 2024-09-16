import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class TeacherProfileScreen extends StatefulWidget {
  @override
  _TeacherProfileScreenState createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  String? _teacherName;
  String? _imageUrl;
  String? _country;
  String? _city;
  String? _university;
  String? _subject;
  File? _imageFile;
  bool _profileCreated = false;
  final _picker = ImagePicker();
  final _databaseReference = FirebaseDatabase.instance.ref();
  final _storageReference = FirebaseStorage.instance;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadProfile() async {
    if (_teacherName != null && _imageFile != null) {
      try {
        // Upload image to Firebase Storage
        String imageName = 'teachers/${_teacherName!}.jpg';
        UploadTask uploadTask = _storageReference.ref(imageName).putFile(_imageFile!);
        TaskSnapshot taskSnapshot = await uploadTask;
        String imageUrl = await taskSnapshot.ref.getDownloadURL();

        // Save profile data to Firebase Realtime Database
        await _databaseReference.child('teacher_profiles').push().set({
          'name': _teacherName,
          'photoUrl': imageUrl,
          'country': _country, // Use selected country
          'city': _city, // Use selected city
          'university': _university, // Use selected university
          'subject': _subject, // Use selected subject
        });

        setState(() {
          _imageUrl = imageUrl;
          _profileCreated = true;
        });
      } catch (e) {
        print('Failed to upload profile: $e');
      }
    }
  }

  Future<void> _loadProfile() async {
    final snapshot = await _databaseReference.child('teacher_profiles').orderByKey().limitToLast(1).once();
    if (snapshot.snapshot.value != null) {
      final Map profileData = snapshot.snapshot.value as Map;
      final key = profileData.keys.first;
      final data = profileData[key];

      setState(() {
        _teacherName = data['name'];
        _imageUrl = data['photoUrl'];
        _country = data['country'];
        _city = data['city'];
        _university = data['university'];
        _subject = data['subject'];
        _profileCreated = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Profile'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            if (!_profileCreated) ...[
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                  child: _imageFile == null
                      ? Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                      : null,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  _teacherName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadProfile,
                child: Text(
                  'Create Profile',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ] else ...[
              Center(
                child: Text(
                  'Profile Created',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              if (_imageUrl != null)
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(_imageUrl!),
                ),
              SizedBox(height: 20),
              if (_teacherName != null)
                Text(
                  _teacherName!,
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(_country ?? 'Unknown Country'),
                subtitle: Text('Country'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(_city ?? 'Unknown City'),
                subtitle: Text('City'),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(_university ?? 'Unknown University'),
                subtitle: Text('University'),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text(_subject ?? 'Unknown Subject'),
                subtitle: Text('Subject'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
