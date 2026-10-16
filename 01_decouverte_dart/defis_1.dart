
/*
  DÉFI 1 : AJOUTER UN CINQUIÈME ÉLÈVE

  Objectifs :
  - Manipuler une liste de dictionnaires (List<Map<String, Object>>).
  - Ajouter un nouvel élève avec ses informations.
  - Calculer sa moyenne.
  - Déterminer s'il est admis ou non.
*/

void main() {
  // Liste des élèves : chaque Map représente un élève.
  List<Map<String, Object>> eleves = [
    {
      'nom': 'Alex',
      'age': 16,
      'notes': <double>[12.0, 14.0, 16.0],
    },
    {
      'nom': 'Marie',
      'age': 15,
      'notes': <double>[8.0, 10.0, 9.0],
    },
    {
      'nom': 'Paul',
      'age': 17,
      'notes': <double>[17.0, 18.0, 16.0],
    },
    {
      'nom': 'Awa',
      'age': 16,
      'notes': <double>[11.0, 12.0, 13.0],
    },
  ];

  // Ajout du cinquième élève dans la liste.
  eleves.add({
    'nom': 'Jean',
    'age': 16,
    'notes': <double>[15.0, 13.0, 17.0],
  });

  // Parcours de la liste pour afficher chaque bulletin.
  for (Map<String, Object> eleve in eleves) {
    // Récupération des informations contenues dans le Map.
    String nom = eleve['nom'] as String;
    int age = eleve['age'] as int;
    List<double> notes = eleve['notes'] as List<double>;

    // Calcul de la somme des notes.
    double somme = 0;

    for (double note in notes) {
      somme += note;
    }

    // Calcul de la moyenne.
    double moyenne = somme / notes.length;

    print('\n----------------------------');
    print('Élève : $nom');
    print('Âge : $age ans');
    print('Notes : $notes');
    print('Moyenne : ${moyenne.toStringAsFixed(2)}/20');

    // Une moyenne d'au moins 10/20 donne l'admission.
    if (moyenne >= 10) {
      print('Décision : ADMIS');
    } else {
      print('Décision : NON ADMIS');
    }
  }

  // Affichage de l'effectif après l'ajout.
  print('\nEffectif total : ${eleves.length} élèves');
}
