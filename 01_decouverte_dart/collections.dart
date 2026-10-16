
/*
  FICHIER : collections.dart

  OBJECTIFS :
  - Manipuler une List ;
  - Créer un Set pour conserver des valeurs uniques ;
  - Utiliser une Map pour associer des clés à des valeurs.
*/

void main() {
  // ========================================================
  // 1. LES LISTES : List
  // ========================================================

  // Une liste de chaînes de caractères.
  // Elle conserve l'ordre des éléments et accepte les doublons.
  List<String> matieres = [
    'Mathématiques',
    'Physique-Chimie',
    'Informatique',
    'Mathématiques',
  ];

  // Affichage de la liste complète.
  print('Liste initiale : $matieres');

  // Ajout d'un nouvel élément à la fin de la liste.
  matieres.add('SVT');

  // Accès au premier élément : l'indice commence à zéro.
  print('Première matière : ${matieres[0]}');

  // Nombre d'éléments de la liste.
  print('Nombre d éléments : ${matieres.length}');

  // Parcours de chaque élément de la liste.
  for (String matiere in matieres) {
    print('Matière : $matiere');
  }

  // ========================================================
  // 2. LES ENSEMBLES : Set
  // ========================================================

  // Un Set ne conserve qu'une occurrence de chaque élément.
  // Les valeurs 12 et 15 répétées ne seront présentes qu'une fois.
  Set<int> notesUniques = {12, 15, 12, 18, 15, 20};

  print('Notes uniques : $notesUniques');

  // Ajouter un élément à l'ensemble.
  notesUniques.add(16);

  // Ajouter une valeur déjà présente ne crée pas de doublon.
  notesUniques.add(12);

  // Vérifier si une valeur est présente.
  print('La note 18 existe : ${notesUniques.contains(18)}');

  // Supprimer une valeur.
  notesUniques.remove(15);

  print('Ensemble après modification : $notesUniques');

  // ========================================================
  // 3. LES DICTIONNAIRES : Map
  // ========================================================

  // Une Map associe chaque clé à une valeur.
  //
  // Ici :
  // 'nom' est une clé de type String et 'Alex' sa valeur ;
  // 'age' est une clé de type String et 16 sa valeur ;
  // 'note' est une clé de type String et 14.5 sa valeur.
  Map<String, dynamic> eleve = {
    'nom': 'Alex',
    'age': 16,
    'note': 14.5,
  };

  // Accès à une valeur à partir de sa clé.
  print('Nom : ${eleve['nom']}');
  print('Âge : ${eleve['age']}');
  print('Note : ${eleve['note']}');

  // Modification de la valeur associée à une clé existante.
  eleve['note'] = 16.0;

  // Ajout d'une nouvelle paire clé-valeur.
  eleve['classe'] = 'Seconde';

  print('Fiche de l élève : $eleve');

  // Parcours des paires clé-valeur.
  eleve.forEach((String cle, dynamic valeur) {
    print('$cle : $valeur');
  });
}
