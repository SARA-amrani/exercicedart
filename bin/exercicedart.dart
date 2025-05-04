import 'package:exercicedart/exercicedart.dart' as exercicedart;

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

//Partie 3 : Contrôle de Flux
void main() {
  // Création de 3 livres
  Book book1 = Book.available('Livre1', 'auteur1', 2020);
  Book book2 = Book.available('Livre 2', 'Auteur 2', 2021);
  Book book3 = Book.available('Livre 3', 'Auteur 3', 2019);

  // Création de la bibliothèque et ajout des livres
  Library library = Library();
  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);

  // Emprunter un livre
  library.borrowBook('Livre 1');
  print('Livres disponibles après emprunt:');
  displayBooks(library.getAvailableBooks());

  // Fusionner deux bibliothèques
  Library library2 = Library();
  library2.addBook(Book.available('Livre 4', 'Auteur 4', 2022));
  Library mergedLibrary = library + library2;

  print('Bibliothèque fusionnée:');
  displayBooks(mergedLibrary.getAvailableBooks());


  // Création d'un employé et d'un manager
  Employe employe = Employe(nom: 'Alice', salaire: 3000);
  Manager manager = Manager(nom: 'Bob', salaire: 5000, prime: 1500);

  // Stockage dans une liste
  List<Employe> equipe = [employe, manager];

  // Parcours de la liste et affichage des infos
  for (var employe in equipe) {
    employe.afficherInfos();
  }

}

// Programmation orientée objet

// Création de la classe Employe et Manager :
class Employe {
  String _nom;
  double _salaire;

  Employe({required String nom, required double salaire}) 
      : _nom = nom, _salaire = salaire;

  void afficherInfos() {
    print('Nom: $_nom, Salaire: $_salaire');
  }
}
// Création de la sous-classe Manager :
class Manager extends Employe {
  double _prime;

  Manager({required String nom, required double salaire, required double prime})
      : _prime = prime,
        super(nom: nom, salaire: salaire);

  @override
  void afficherInfos() {
    super.afficherInfos();
    print('Prime: $_prime');
  }
}

