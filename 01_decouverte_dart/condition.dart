void main() {
  String nom = 'Alex';
  int age = 16;
  double note = 14.5;
  bool debutant = true;

  print('Nom : $nom');
  print('Age : $age ans');
  print('Note : $note');
  print('Débutant : $debutant');

  if (note >= 10) {
    print('Admis');
  } else {
    print('Non admis');
  }

  if (debutant == true) {
    print('Débutant en Dart');
  } else {
    print('Niveau intermédiaire ou avancé');
  }
}