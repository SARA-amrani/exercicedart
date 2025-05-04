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

//Partie 2 : Fonctions et Opérateurs 

//Fonction displayBooks :
void displayBooks(List<Book> books) {
  for (var book in books) {
    print('Titre: ${book.title}, Auteur: ${book.author} (Année: ${book.year})');
  }
}
//Surcharge de l'opérateur + :
extension LibraryOperator on Library {
  Library operator +(Library other) {
    Library newLibrary = Library();
    newLibrary.books.addAll(this.books);
    newLibrary.books.addAll(other.books);
    return newLibrary;
  }
}

