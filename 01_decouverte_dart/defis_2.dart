
/*
  DÉFI 2 : COMPTER LES MATIÈRES PAR ÉLÈVE

  Objectifs :
  - Stocker plusieurs matières dans une liste.
  - Parcourir les élèves avec une boucle for.
  - Compter les matières grâce à .length.
*/

void main() {
  // Chaque élève possède une liste de matières.
  List<Map<String, Object>> eleves = [
    {
      'nom': 'Alex',
      'matieres': <String>['Mathématiques', 'Informatique'],
    },
    {
      'nom': 'Marie',
      'matieres': <String>['Mathématiques', 'SVT'],
    },
    {
      'nom': 'Paul',
      'matieres': <String>['Physique-Chimie', 'Informatique'],
    },
    {
      'nom': 'Awa',
      'matieres': <String>[
        'Mathématiques',
        'Physique-Chimie',
        'SVT',
      ],
    },
    {
      'nom': 'Jean',
      'matieres': <String>[
        'Mathématiques',
        'Informatique',
        'Physique-Chimie',
      ],
    },
  ];

  print('===== NOMBRE DE MATIÈRES PAR ÉLÈVE =====');

  // Parcours de chaque élève.
  for (Map<String, Object> eleve in eleves) {
    // Récupération du nom.
    String nom = eleve['nom'] as String;

    // Récupération de la liste des matières.
    List<String> matieres = eleve['matieres'] as List<String>;

    // .length renvoie le nombre d'éléments de la liste.
    int nombreMatieres = matieres.length;

    print('\nÉlève : $nom');
    print('Matières : $matieres');
    print('Nombre de matières : $nombreMatieres');
  }
}
