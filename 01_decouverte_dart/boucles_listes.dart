void main() {
  List<double> notes = [12.5, 8.0, 16.0, 9.5, 14.0];

  double somme = 0;
  int admis = 0;
  int nonAdmis = 0;

  for (int i = 0; i < notes.length; i++) {
    double note = notes[i];
    somme += note;

    if (note >= 10) {
      admis++;
    } else {
      nonAdmis++;
    }

    print('Élève ${i + 1} : $note/20');
  }

  double moyenne = somme / notes.length;

  print('--------------------');
  print('Nombre d élèves : ${notes.length}');
  print('Moyenne : ${moyenne.toStringAsFixed(2)}/20');
  print('Admis : $admis');
  print('Non admis : $nonAdmis');
}