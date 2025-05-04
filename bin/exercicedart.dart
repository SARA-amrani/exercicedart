import 'package:exercicedart/exercicedart.dart' as exercicedart;

void main(List<String> arguments) {
  print('Hello world: ${exercicedart.calculate()}!');
}

//Partie 1 : Structures de Données 

// Création de la classe Book :
class Book {
  String title;
  String author;
  int year;
  bool isAvailable;

  // Constructeur
  Book.available(this.title, this.author, this.year) : isAvailable = true;
}

//Création de la classe Library :
class Library {
  List<Book> books = [];

  // Ajouter un livre
  void addBook(Book book) {
    books.add(book);
  }

  // Emprunter un livre
  void borrowBook(String title) {
    for (var book in books) {
      if (book.title == title) {
        book.isAvailable = false;
        break;
      }
    }
  }

  // Obtenir la liste des livres disponibles
  List<Book> getAvailableBooks() {
    return books.where((book) => book.isAvailable).toList();
  }
}


