import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Services Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _services = [
    'Plumber',
    'Electrician',
    'Cleaner',
    'Gardener',
    'Carpenter',
    'Painter',
  ];

  String _selectedService = 'Plumber';
  late DatabaseReference _databaseRef;
  List<Map<String, String>> _serviceProviders = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseRef = FirebaseDatabase.instance.ref('services');
    _fetchProviders();
  }

  void _fetchProviders() {
    _databaseRef.child(_selectedService).get().then((snapshot) {
      if (snapshot.exists) {
        final Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          _serviceProviders = data.entries.map((entry) {
            final provider = entry.value as Map<dynamic, dynamic>;
            return {
              'name': provider['name'] as String,
              'rating': provider['rating'] as String,
              'contact': provider['contact'] as String,
            };
          }).toList();
        });
      } else {
        setState(() {
          _serviceProviders = [];
        });
      }
    }).catchError((error) {
      print('Error fetching data: $error');
    });
  }

  void _addProvider() {
    final name = _nameController.text;
    final rating = _ratingController.text;
    final contact = _contactController.text;

    if (name.isNotEmpty && rating.isNotEmpty && contact.isNotEmpty) {
      _databaseRef.child(_selectedService).push().set({
        'name': name,
        'rating': rating,
        'contact': contact,
      }).then((_) {
        Navigator.of(context).pop();
        _nameController.clear();
        _ratingController.clear();
        _contactController.clear();
        _fetchProviders();
      }).catchError((error) {
        print('Error adding provider: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Services Finder'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add New Provider'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          controller: _ratingController,
                          decoration: const InputDecoration(labelText: 'Rating'),
                        ),
                        TextField(
                          controller: _contactController,
                          decoration: const InputDecoration(labelText: 'Contact'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: _addProvider,
                        child: const Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedService,
              onChanged: (newValue) {
                setState(() {
                  _selectedService = newValue!;
                  _fetchProviders();
                });
              },
              items: _services.map<DropdownMenuItem<String>>((String service) {
                return DropdownMenuItem<String>(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _serviceProviders.length,
                itemBuilder: (context, index) {
                  final provider = _serviceProviders[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(provider['name']!),
                      subtitle: Text('Rating: ${provider['rating']}'),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(provider['name']!),
                              content: Text(
                                'Service: ${_selectedService}\n'
                                    'Rating: ${provider['rating']}\n'
                                    'Contact: ${provider['contact']}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
