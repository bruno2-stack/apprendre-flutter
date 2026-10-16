
/*
  FICHIER : gestion_erreurs.dart

  OBJECTIFS :
  - Comprendre try et catch ;
  - Traiter une exception avec on ;
  - Utiliser finally ;
  - Déclencher une exception avec throw.
*/

// Cette fonction effectue une division.
// Elle refuse un diviseur égal à zéro.
double diviser(double a, double b) {
  // Une division par zéro n'est pas autorisée dans
  // notre logique métier.
  if (b == 0) {
    // throw déclenche une exception.
    // Exception permet de signaler une opération invalide.
    throw Exception('Division impossible : diviseur nul.');
  }

  // Si le diviseur est non nul, on effectue le calcul.
  return a / b;
}

void main() {
  print('Début du programme.');

  try {
    // Le bloc try contient les instructions susceptibles
    // de déclencher une exception.
    double resultat = diviser(10, 2);

    print('Résultat : $resultat');

    // Essayons maintenant une division par zéro.
    // Cette instruction déclenche l'exception définie
    // dans la fonction diviser().
    double resultatInvalide = diviser(10, 0);

    // Cette ligne ne sera pas exécutée si l'appel précédent
    // déclenche effectivement l'exception.
    print('Résultat invalide : $resultatInvalide');

  } on Exception catch (erreur) {
    // on Exception permet de traiter spécifiquement
    // les exceptions de type Exception.
    //
    // catch reçoit l'objet représentant l'erreur.
    print('Une erreur a été détectée : $erreur');

  } finally {
    // finally est exécuté que l'opération réussisse
    // ou qu'une exception soit interceptée.
    // Il est utile pour les opérations de nettoyage.
    print('Fin du traitement de la division.');
  }

  // Le programme continue après le bloc try-catch-finally.
  print('Le programme continue.');
}
