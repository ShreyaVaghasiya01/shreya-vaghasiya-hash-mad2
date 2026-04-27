import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../widgets/book_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<BookProvider>(context);

    if (provider.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(

      backgroundColor: Colors.indigo.shade50,

      appBar: AppBar(
        title: const Text("Library Dashboard"),
        
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,

        actions: [

          IconButton(
            icon: const Icon(Icons.logout),

            onPressed: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,

        onPressed: () {
          Navigator.pushNamed(context, "/addBook");
        },

        child: const Icon(Icons.add),
      ),

      body: FadeTransition(

        opacity: fadeAnimation,

        child: provider.books.isEmpty

            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [

                    Icon(
                      Icons.menu_book,
                      size: 80,
                      color: Colors.indigo,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "No Books Available",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Click + button to add books",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )

            : ListView.builder(

                padding: const EdgeInsets.all(10),

                itemCount: provider.books.length,

                itemBuilder: (context, index) {

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: BookCard(index: index),
                  );
                },
              ),
      ),
    );
  }
}