// import 'package:flutter/material.dart';
//
// class categorypage extends StatefulWidget {
//   const categorypage({super.key});
//
//   @override
//   State<categorypage> createState() => _categorypageState();
// }
//
// class _categorypageState extends State<categorypage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mehandhi/homepage.dart';

// Define the Item class
class Item {
  List<String> name;
  List<String> description;

  Item({required this.name, required this.description});

  // Convert the Item object to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,


    };


  }

  // Create an Item object from a Map
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['vadi'],
      description: map['SAKKALATHI'],
    );
  }
}

// Function to add an item to Firebase
void addItemToFirebase(String category, Item item) async {



  Firebase.initializeApp();

  FirebaseFirestore.instance.collection("category").add(item.toMap());
  try {
    await FirebaseFirestore.instance.collection("category").add(item.toMap());
    print('Data added successfully!');
  } catch (e) {
    print('Error adding data: $e');
  }
}



// Function to get items from Firebase for a specific category
Future<List<Item>> getItemsFromFirebase(String category) async {


  await Firebase.initializeApp();

  var snapshot = await FirebaseFirestore.instance.collection(category).get();
  return snapshot.docs.map((doc) => Item.fromMap(doc.data())).toList();
}



// MyApp widget
class category extends StatelessWidget {



// Function to add an item to Firebase
 
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home:  Scaffold(
        appBar: AppBar(title: InkWell(

          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => homepage(),) );
          },

            child: Icon(Icons.icecream_outlined)),iconTheme: IconThemeData(color: Colors.red),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
          onPressed:() {
            addItemToFirebase;
          },
          child: Text('Add to Firestore'),
          ),

          ],
        ),
      ),

        );
  }
}

// MyHomePage widget
class fuck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBarView Example'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Category 1'),
              Tab(text: 'Category 2'),
              Tab(text: 'Category 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyListView(category: 'category1'),
            MyListView(category: 'category2'),
            MyListView(category: 'category3'),
          ],
        ),
      ),
    );
  }
}

// MyListView widget
class MyListView extends StatelessWidget {
  final String category;

  MyListView({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: getItemsFromFirebase(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                // title: Text(snapshot.data![index].name),
                // subtitle: Text(snapshot.data![index].description),
              );
            },
          );
        }
      },
    );
  }
}
