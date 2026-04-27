import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../screens/edit_book_screen.dart';

class BookCard extends StatelessWidget {

  final int index;

  const BookCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<BookProvider>(context);
    final book = provider.books[index];

    return Card(

      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),

      child: ListTile(

        leading: const Icon(
          Icons.menu_book,
          color: Colors.indigo,
        ),

        title: Text(book.title),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Author: ${book.author}"),

            Text("ISBN: ${book.isbn}"),

            Text("Quantity: ${book.quantity}"),

            const SizedBox(height: 4),

            Text(
              book.issued ? "Status: Issued" : "Status: Available",
              style: TextStyle(
                color: book.issued ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,

          children: [

            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditBookScreen(
                      book: book,
                      index: index,
                    ),
                  ),
                );

              },
            ),

            IconButton(
              icon: Icon(
                book.issued
                    ? Icons.assignment_return
                    : Icons.assignment,
              ),
              color: Colors.orange,
              onPressed: () {

                provider.toggleIssue(index);

              },
            ),

            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {

                provider.deleteBook(index);

              },
            ),

          ],
        ),
      ),
    );
  }
}