
/*
  FICHIER : fonctions_parametres.dart

  OBJECTIF :
  Comprendre les paramètres positionnels,
  les paramètres nommés et les valeurs par défaut.
*/

// Fonction avec deux paramètres positionnels obligatoires.
//
// Le premier argument correspond à longueur.
// Le deuxième argument correspond à largeur.
double calculerAireRectangle(double longueur, double largeur) {
  // Calcul de l'aire d'un rectangle :
  // aire = longueur * largeur.
  return longueur * largeur;
}

// Fonction avec des paramètres nommés obligatoires.
//
// Les accolades {} indiquent que les paramètres
// doivent être transmis sous forme nommée.
//
// Le mot required signifie que chaque paramètre
// doit obligatoirement être fourni lors de l'appel.
String presenterEleve({
  required String nom,
  required int age,
}) {
  // La fonction construit et retourne une phrase.
  return 'Élève : $nom, âge : $age ans';
}

// Fonction avec un paramètre nommé facultatif.
//
// La valeur par défaut de coefficient est 1.0.
// Si aucun coefficient n'est fourni, cette valeur est utilisée.
double calculerNotePonderee({
  required double note,
  double coefficient = 1.0,
}) {
  // On multiplie la note par son coefficient.
  return note * coefficient;
}

void main() {
  // --------------------------------------------------------
  // TEST 1 : PARAMÈTRES POSITIONNELS
  // --------------------------------------------------------

  // 5 correspond à longueur et 3 à largeur.
  double aire = calculerAireRectangle(5, 3);

  print('Aire du rectangle : $aire');

  // --------------------------------------------------------
  // TEST 2 : PARAMÈTRES NOMMÉS
  // --------------------------------------------------------

  // L'ordre des paramètres nommés n'est pas important.
  // Chaque argument est identifié par son nom.
  print(presenterEleve(age: 16, nom: 'Alex'));

  // --------------------------------------------------------
  // TEST 3 : PARAMÈTRE FACULTATIF
  // --------------------------------------------------------

  // Aucun coefficient n'est précisé :
  // le coefficient par défaut, égal à 1.0, est utilisé.
  print('Note sans pondération : '
      '${calculerNotePonderee(note: 14)}');

  // Ici, le coefficient fourni est 2.0.
  print('Note pondérée : '
      '${calculerNotePonderee(note: 14, coefficient: 2.0)}');
}
