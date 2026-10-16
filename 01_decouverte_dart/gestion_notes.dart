
/*
  ==========================================================
  MINI-PROJET : GESTION DES NOTES D'ELEVES
  Module 1 - Découverte du langage Dart
  ==========================================================

  Objectifs pédagogiques :
  - Manipuler une liste de nombres ;
  - Utiliser des boucles et des conditions ;
  - Déclarer et appeler des fonctions ;
  - Retourner des résultats avec return ;
  - Calculer une moyenne et établir un bilan scolaire.

  Convention de cet exercice :
  - Une note est comprise entre 0 et 20 ;
  - Un élève ayant au moins 10/20 est admis.
*/

// ==========================================================
// FONCTION 1 : CALCULER LA MOYENNE D'UNE LISTE
// ==========================================================

// Cette fonction reçoit une liste de notes et retourne
// leur moyenne sous forme de nombre décimal.
//
// List<double> signifie que le paramètre notes est une liste
// dont les éléments sont des nombres de type double.
double calculerMoyenne(List<double> notes) {

  // Une liste vide ne permet pas de calculer une moyenne.
  // Nous retournons 0 pour éviter une division par zéro.
  if (notes.isEmpty) {
    return 0;
  }

  // Variable destinée à accumuler la somme des notes.
  double somme = 0;

  // Parcours de toutes les notes de la liste.
  for (double note in notes) {

    // Ajout de chaque note à la somme.
    // Cette boucle for-in permet de lire directement
    // les éléments de la liste sans utiliser leur indice.
    somme += note;
  }

  // Calcul et retour de la moyenne.
  return somme / notes.length;
}

// ==========================================================
// FONCTION 2 : COMPTER LES ELEVES ADMIS
// ==========================================================

// Cette fonction retourne le nombre d'élèves ayant
// obtenu une note supérieure ou égale à 10/20.
int compterAdmis(List<double> notes) {

  // Initialisation du compteur à zéro.
  int nombreAdmis = 0;

  // Examen de chaque note.
  for (double note in notes) {

    // Vérification de la condition d'admission.
    if (note >= 10) {

      // Incrémentation du compteur.
      nombreAdmis++;
    }
  }

  // Transmission du nombre d'admis au programme appelant.
  return nombreAdmis;
}

// ==========================================================
// FONCTION 3 : COMPTER LES ELEVES NON ADMIS
// ==========================================================

int compterNonAdmis(List<double> notes) {

  // Initialisation du compteur des non-admis.
  int nombreNonAdmis = 0;

  // Parcours de la liste.
  for (double note in notes) {

    // Si la note est strictement inférieure à 10,
    // l'élève n'est pas admis selon notre convention.
    if (note < 10) {
      nombreNonAdmis++;
    }
  }

  // Retour du nombre total de non-admis.
  return nombreNonAdmis;
}

// ==========================================================
// FONCTION 4 : DETERMINER L'APPRECIATION
// ==========================================================

// La fonction reçoit une note et retourne une appréciation
// sous forme de texte, donc de type String.
String obtenirAppreciation(double note) {

  // Vérification de la validité de la note.
  if (note < 0 || note > 20) {
    return 'Note invalide';
  }

  // Les conditions sont évaluées dans l'ordre.
  // La première condition vraie détermine le résultat.
  if (note >= 16) {
    return 'Très bien';

  } else if (note >= 14) {
    return 'Bien';

  } else if (note >= 12) {
    return 'Assez bien';

  } else if (note >= 10) {
    return 'Passable';

  } else {
    return 'Insuffisant';
  }
}

// ==========================================================
// FONCTION 5 : AFFICHER LE BULLETIN D'UN ELEVE
// ==========================================================

// Cette fonction reçoit le nom de l'élève et sa note.
// Elle affiche un bulletin individuel.
void afficherBulletin(String nom, double note) {

  print('--------------------------------');
  print('BULLETIN DE L ELEVE');
  print('Nom : $nom');
  print('Note : ${note.toStringAsFixed(2)}/20');

  // Appel de la fonction d'appréciation.
  // La valeur retournée est insérée directement dans le texte.
  print('Appréciation : ${obtenirAppreciation(note)}');

  // Détermination du résultat scolaire.
  if (note >= 10 && note <= 20) {
    print('Décision : Admis');
  } else if (note >= 0 && note < 10) {
    print('Décision : Non admis');
  } else {
    print('Décision : Non déterminée, note invalide');
  }

  print('--------------------------------');
}

// ==========================================================
// PROGRAMME PRINCIPAL
// ==========================================================

void main() {

  // Liste des noms des élèves.
  // Chaque nom occupe la même position que la note
  // correspondante dans la liste notes.
  List<String> noms = [
    'Alex',
    'Marie',
    'Paul',
    'Awa',
    'David'
  ];

  // Liste des notes des élèves.
  List<double> notes = [
    12.5,
    8.0,
    16.0,
    9.5,
    14.0
  ];

  // Vérification des tailles des deux listes.
  // Nous avons besoin d'un nom pour chaque note.
  if (noms.length != notes.length) {
    print('Erreur : les listes des noms et des notes '
          'n ont pas la même taille.');
    return;
  }

  // Affichage du titre du programme.
  print('================================');
  print('    GESTION DES NOTES');
  print('================================');

  // Affichage d'un bulletin pour chaque élève.
  //
  // La boucle parcourt les indices des deux listes.
  // Le même indice permet d'associer chaque nom à sa note.
  for (int i = 0; i < noms.length; i++) {

    // Récupération du nom et de la note correspondants.
    String nom = noms[i];
    double note = notes[i];

    // Appel de la fonction d'affichage du bulletin.
    afficherBulletin(nom, note);
  }

  // ========================================================
  // BILAN GENERAL DE LA CLASSE
  // ========================================================

  // Appel de la fonction de calcul de moyenne.
  double moyenne = calculerMoyenne(notes);

  // Appel des fonctions de comptage.
  int admis = compterAdmis(notes);
  int nonAdmis = compterNonAdmis(notes);

  // Affichage du bilan général.
  print('');
  print('================================');
  print('       BILAN DE LA CLASSE');
  print('================================');

  print('Nombre d élèves : ${notes.length}');

  // Présentation de la moyenne avec deux chiffres décimaux.
  print('Moyenne générale : '
        '${moyenne.toStringAsFixed(2)}/20');

  print('Nombre d admis : $admis');
  print('Nombre de non-admis : $nonAdmis');

  // Calcul du taux de réussite en pourcentage.
  // Le contrôle de la liste vide évite une division par zéro.
  if (notes.isNotEmpty) {
    double tauxReussite = (admis / notes.length) * 100;

    print('Taux de réussite : '
          '${tauxReussite.toStringAsFixed(1)} %');
  }

  print('================================');
}
