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

