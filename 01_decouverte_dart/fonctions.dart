
void main() {
  // Appel de la fonction : nous demandons au programme
  // d'exécuter les instructions contenues dans direBonjour().
  direBonjour();

  // Appel de la fonction avec un argument.
  saluerEleve('Alex');

  // Appel d'une fonction qui retourne une valeur.
  double resultat = calculerMoyenne(12, 16);

  // Affichage de la valeur retournée par la fonction.
  print('Moyenne : $resultat/20');
}

// ----------------------------------------------------------
// FONCTION 1 : AFFICHER UN MESSAGE
// ----------------------------------------------------------

// void signifie que cette fonction ne retourne aucune valeur.
// Le nom de la fonction est direBonjour.
// Les parenthèses indiquent qu'il n'y a aucun paramètre.
void direBonjour() {
  print('Bonjour et bienvenue dans le cours de Dart !');
}

// ----------------------------------------------------------
// FONCTION 2 : UTILISER UN PARAMETRE
// ----------------------------------------------------------

// String nom est un paramètre : il reçoit un texte.
// Lors de l'appel saluerEleve('Alex'), nom prend la valeur Alex.
void saluerEleve(String nom) {
  print('Bonjour $nom !');
}

// ----------------------------------------------------------
// FONCTION 3 : RETOURNER UN RESULTAT
// ----------------------------------------------------------

// double indique que la fonction retourne un nombre décimal.
// Les paramètres note1 et note2 reçoivent les deux notes.
double calculerMoyenne(double note1, double note2) {
  // Calcul de la moyenne des deux notes.
  double moyenne = (note1 + note2) / 2;

  // return transmet le résultat à l'endroit où la fonction
  // a été appelée.
  return moyenne;
}
