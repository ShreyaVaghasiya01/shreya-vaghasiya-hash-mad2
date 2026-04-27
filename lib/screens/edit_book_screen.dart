import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../models/book_model.dart';

class EditBookScreen extends StatefulWidget {

  final Book book;
  final int index;

  const EditBookScreen({
    super.key,
    required this.book,
    required this.index,
  });

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {

  late TextEditingController title;
  late TextEditingController author;
  late TextEditingController isbn;
  late TextEditingController qty;

  @override
  void initState() {
    super.initState();

    title = TextEditingController(text: widget.book.title);
    author = TextEditingController(text: widget.book.author);
    isbn = TextEditingController(text: widget.book.isbn);
    qty = TextEditingController(text: widget.book.quantity.toString());
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<BookProvider>(context);

    return Scaffold(

      backgroundColor: Colors.indigo.shade50,

      appBar: AppBar(
        title: const Text("Edit Book"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(

        child: Container(

          width: 400,
          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 10)
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              const Text(
                "Update Book",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: title,
                decoration: InputDecoration(
                  labelText: "Book Title",
                  prefixIcon: const Icon(Icons.book),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: author,
                decoration: InputDecoration(
                  labelText: "Author",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: isbn,
                decoration: InputDecoration(
                  labelText: "ISBN",
                  prefixIcon: const Icon(Icons.qr_code),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: qty,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Quantity",
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 45,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white
                  ),

                  onPressed: () {

                    provider.updateBook(

                      widget.index,

                      Book(
                        title: title.text,
                        author: author.text,
                        isbn: isbn.text,
                        quantity: int.parse(qty.text),
                      ),
                    );

                    Navigator.pop(context);
                  },

                  child: const Text("Update Book"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}