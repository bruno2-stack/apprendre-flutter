
/*
  DÉFI 3 : GESTION DES ERREURS ET EXCEPTIONS

  Objectifs :
  - Valider une note.
  - Déclencher une exception avec throw.
  - Intercepter l'erreur avec try-catch.
  - Garantir la poursuite normale du programme.
*/

// Fonction de validation d'une note.
void validerNote(double note) {
  // Une note inférieure à 0 ou supérieure à 20 est invalide.
  if (note < 0 || note > 20) {
    throw FormatException(
      'La note $note est invalide. '
      'Elle doit être comprise entre 0 et 20.',
    );
  }

  // Cette instruction n'est exécutée que si la note est valide.
  print('La note $note est valide.');
}

void main() {
  // Liste de notes pour tester les différents cas.
  List<double> notesATester = [12.0, -2.0, 22.0, 15.5];

  print('===== TEST DE VALIDATION DES NOTES =====');

  // On teste chaque note indépendamment.
  for (double note in notesATester) {
    print('\nTest de la note : $note');

    try {
      // Appel de la fonction : elle peut déclencher une exception.
      validerNote(note);
    } on FormatException catch (erreur) {
      // Ce bloc traite spécifiquement les erreurs de validation.
      print('Erreur détectée : ${erreur.message}');
    } finally {
      // finally s'exécute que la note soit valide ou non.
      print('Fin du test de cette note.');
    }
  }

  // Le programme poursuit son exécution après les erreurs interceptées.
  print('\nFin normale du programme.');
}
