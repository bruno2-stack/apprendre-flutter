
/*
  ============================================================
  PROJET DE SYNTHESE DART : GESTION SCOLAIRE
  ============================================================

  Objectifs :
  1. Enregistrer plusieurs élèves dans une liste.
  2. Representer chaque élève avec une Map.
  3. Stocker les notes et les matières.
  4. Calculer les moyennes individuelles.
  5. Déterminer les appréciations et les résultats.
  6. Calculer les statistiques de la classe.
  7. Détecter et traiter les données invalides.

  Notions utilisées :
  - Fonctions et paramètres nommés ;
  - List, Set et Map ;
  - Boucles et conditions ;
  - Gestion des exceptions ;
  - Validation des données.

  Convention pédagogique :
  Un élève est admis si sa moyenne est supérieure
  ou égale à 10/20.
*/

// ============================================================
// PARTIE 1 : VALIDATION DES NOTES
// ============================================================

// Cette fonction vérifie qu'une note est comprise entre 0 et 20.
//
// Le type void signifie que la fonction ne retourne pas de valeur.
// Elle signale une erreur avec throw si la note est invalide.
//
// Une fonction de validation permet de centraliser les règles
// et de les réutiliser à plusieurs endroits du programme.
void validerNote(double note) {
  if (note < 0 || note > 20) {
    throw FormatException(
      'La note $note est invalide : elle doit être entre 0 et 20.',
    );
  }
}

// ============================================================
// PARTIE 2 : CALCUL DE LA MOYENNE
// ============================================================

// La fonction reçoit une liste de notes décimales.
// Elle retourne la moyenne sous forme de double.
double calculerMoyenne(List<double> notes) {

  // Une liste vide ne permet pas de calculer une moyenne.
  // Nous déclenchons donc une exception explicite.
  if (notes.isEmpty) {
    throw ArgumentError(
      'Impossible de calculer la moyenne : aucune note.',
    );
  }

  // Variable destinée à accumuler les notes.
  double somme = 0;

  // Parcours de chaque note de la liste.
  for (double note in notes) {

    // Chaque note est validée avant son utilisation.
    validerNote(note);

    // Ajout de la note à la somme totale.
    somme += note;
  }

  // La moyenne est égale à la somme divisée
  // par le nombre de notes.
  return somme / notes.length;
}

// ============================================================
// PARTIE 3 : DETERMINATION DE L'APPRECIATION
// ============================================================

// Cette fonction reçoit une moyenne et retourne une appréciation.
//
// Les paramètres nommés rendent les appels plus explicites.
// Le mot required impose la présence du paramètre moyenne.
String obtenirAppreciation({
  required double moyenne,
}) {
  // On vérifie d'abord que la moyenne est valide.
  validerNote(moyenne);

  // Les conditions sont testées dans l'ordre décroissant.
  if (moyenne >= 16) {
    return 'Très bien';
  } else if (moyenne >= 14) {
    return 'Bien';
  } else if (moyenne >= 12) {
    return 'Assez bien';
  } else if (moyenne >= 10) {
    return 'Passable';
  } else {
    return 'Insuffisant';
  }
}

// ============================================================
// PARTIE 4 : AFFICHAGE D'UN BULLETIN
// ============================================================

// Cette fonction reçoit un nom, un âge et une liste de notes.
// Elle affiche les informations et les résultats de l'élève.
//
// Les paramètres nommés évitent les confusions entre arguments.
void afficherBulletin({
  required String nom,
  required int age,
  required List<double> notes,
}) {
  // On calcule la moyenne à l'aide de la fonction précédente.
  double moyenne = calculerMoyenne(notes);

  print('');
  print('----------------------------------------');
  print('BULLETIN DE : $nom');
  print('Âge : $age ans');

  // Affichage de toutes les notes de l'élève.
  print('Notes : $notes');

  // Affichage de la moyenne avec deux décimales.
  print('Moyenne : ${moyenne.toStringAsFixed(2)}/20');

  // Appel de la fonction qui détermine l'appréciation.
  print(
    'Appréciation : '
    '${obtenirAppreciation(moyenne: moyenne)}',
  );

  // Vérification de la décision scolaire.
  if (moyenne >= 10) {
    print('Décision : ADMIS');
  } else {
    print('Décision : NON ADMIS');
  }

  print('----------------------------------------');
}

// ============================================================
// PARTIE 5 : DONNEES DES ELEVES
// ============================================================

void main() {

  // List représente la collection principale des élèves.
  //
  // Chaque élève est représenté par une Map :
  // - nom : chaîne de caractères ;
  // - age : entier ;
  // - notes : liste de nombres décimaux ;
  // - matieres : liste de matières étudiées.
  //
  // Object permet de stocker différentes catégories de valeurs.
  // Nous utilisons ensuite des conversions de type explicites
  // lors de la lecture des champs.
  List<Map<String, Object>> eleves = [
    {
      'nom': 'Alex',
      'age': 16,
      'notes': <double>[12.0, 14.0, 16.0],
      'matieres': <String>[
        'Mathématiques',
        'Informatique',
      ],
    },
    {
      'nom': 'Marie',
      'age': 15,
      'notes': <double>[8.0, 10.0, 9.0],
      'matieres': <String>[
        'Mathématiques',
        'SVT',
      ],
    },
    {
      'nom': 'Paul',
      'age': 17,
      'notes': <double>[17.0, 18.0, 16.0],
      'matieres': <String>[
        'Physique-Chimie',
        'Informatique',
      ],
    },
    {
      'nom': 'Awa',
      'age': 16,
      'notes': <double>[11.0, 12.0, 13.0],
      'matieres': <String>[
        'Mathématiques',
        'Physique-Chimie',
        'SVT',
      ],
    },
  ];

  // ==========================================================
  // PARTIE 6 : ENSEMBLE DES MATIERES
  // ==========================================================

  // Set conserve uniquement les matières distinctes.
  //
  // Par exemple, si Mathématiques apparaît chez plusieurs
  // élèves, cette matière ne sera comptée qu'une seule fois.
  Set<String> toutesLesMatieres = {};

  // ==========================================================
  // PARTIE 7 : VARIABLES STATISTIQUES
  // ==========================================================

  int nombreAdmis = 0;
  int nombreNonAdmis = 0;

  // Cette somme servira à calculer la moyenne des moyennes
  // individuelles des élèves.
  double sommeDesMoyennes = 0;

  print('========================================');
  print('       APPLICATION DE GESTION SCOLAIRE');
  print('========================================');

  // ==========================================================
  // PARTIE 8 : PARCOURS ET TRAITEMENT DES ELEVES
  // ==========================================================

  // La boucle for-in parcourt directement chaque Map.
  for (Map<String, Object> eleve in eleves) {

    // try permet de traiter une éventuelle erreur concernant
    // les données de l'élève sans interrompre tout le programme.
    try {
      // Lecture des champs de la Map.
      //
      // as String, as int et as List<double> indiquent
      // le type attendu pour chaque donnée.
      String nom = eleve['nom'] as String;
      int age = eleve['age'] as int;
      List<double> notes = eleve['notes'] as List<double>;

      // Calcul de la moyenne individuelle.
      double moyenne = calculerMoyenne(notes);

      // Affichage du bulletin.
      afficherBulletin(
        nom: nom,
        age: age,
        notes: notes,
      );

      // Mise à jour des statistiques d'admission.
      if (moyenne >= 10) {
        nombreAdmis++;
      } else {
        nombreNonAdmis++;
      }

      // Ajout de la moyenne individuelle à la somme.
      sommeDesMoyennes += moyenne;

      // Lecture des matières de l'élève.
      List<String> matieres = eleve['matieres'] as List<String>;

      // addAll ajoute les éléments de la liste au Set.
      // Les matières déjà présentes ne sont pas dupliquées.
      toutesLesMatieres.addAll(matieres);

    } on FormatException catch (erreur) {
      // Cette partie traite notamment une note hors de [0, 20].
      print('Erreur de validation : $erreur');

    } on ArgumentError catch (erreur) {
      // Cette partie traite notamment une liste de notes vide.
      print('Données insuffisantes : $erreur');

    } catch (erreur) {
      // Cette dernière partie intercepte les autres erreurs
      // inattendues, par exemple une donnée de type incorrect.
      print('Erreur lors du traitement d un élève : $erreur');
    }
  }

  // ==========================================================
  // PARTIE 9 : BILAN GENERAL DE LA CLASSE
  // ==========================================================

  print('');
  print('========================================');
  print('             BILAN DE CLASSE');
  print('========================================');

  // Affichage de l'effectif total.
  print('Nombre total d élèves : ${eleves.length}');

  // Calcul de la moyenne générale des moyennes individuelles.
  //
  // On vérifie que la liste n'est pas vide pour éviter
  // une division par zéro.
  if (eleves.isNotEmpty) {
    double moyenneClasse = sommeDesMoyennes / eleves.length;

    print(
      'Moyenne de la classe : '
      '${moyenneClasse.toStringAsFixed(2)}/20',
    );

    // Le taux de réussite est exprimé en pourcentage.
    double tauxReussite = nombreAdmis / eleves.length * 100;

    print(
      'Taux de réussite : '
      '${tauxReussite.toStringAsFixed(1)} %',
    );
  }

  print('Nombre d admis : $nombreAdmis');
  print('Nombre de non-admis : $nombreNonAdmis');

  // toList transforme le Set en liste pour un affichage trié.
  // Le tri améliore la lisibilité du bilan.
  List<String> matieresTriees = toutesLesMatieres.toList();
  matieresTriees.sort();

  print('Matières étudiées : $matieresTriees');
  print('Nombre de matières distinctes : '
      '${toutesLesMatieres.length}');

  print('========================================');

  // ==========================================================
  // PARTIE 10 : TEST DE LA GESTION DES EXCEPTIONS
  // ==========================================================

  print('');
  print('TEST DE VALIDATION D UNE NOTE');

  try {
    // Nous essayons volontairement de valider une note invalide.
    // Cette opération doit déclencher une FormatException.
    validerNote(22.0);

    // Cette ligne ne sera pas exécutée si validerNote()
    // déclenche l'exception attendue.
    print('La note est valide.');

  } on FormatException catch (erreur) {
    // L'erreur est interceptée et affichée proprement.
    print('Erreur détectée et traitée : $erreur');
  }

  // Le programme peut continuer après la gestion de l'erreur.
  print('Fin normale du programme.');
}
