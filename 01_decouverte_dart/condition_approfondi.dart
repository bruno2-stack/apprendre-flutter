
void main() {
  // 1. Déclaration des variables
  String nom = 'Alex';
  double note = 14.5;

  print('===== RESULTATS DE L ELEVE =====');
  print('Nom : $nom');
  print('Note : $note/20');

  // 2. Vérification de la validité de la note
  if (note < 0 || note > 20) {
    print('Erreur : la note doit être comprise entre 0 et 20.');
  } else {
    print('Note valide.');

    // 3. Vérification de l'admission
    if (note >= 10) {
      print('Résultat : Admis');
    } else {
      print('Résultat : Non admis');
    }

    // 4. Appréciation selon la note
    if (note >= 16) {
      print('Appréciation : Très bien');
    } else if (note >= 14) {
      print('Appréciation : Bien');
    } else if (note >= 12) {
      print('Appréciation : Assez bien');
    } else if (note >= 10) {
      print('Appréciation : Passable');
    } else {
      print('Appréciation : Insuffisant');
    }

    // 5. Utilisation de l'opérateur logique &&
    if (note >= 10 && note <= 20) {
      print('Félicitations : la note est dans la plage d admission.');
    }
  }
}
