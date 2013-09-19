import 'dart:html';

Map<String, int> frequenceLettre(String text) {
  text.replaceAll(' ', ''); //remove spaces
  List listeLettre = text.split('');
  listeLettre.sort((m,n) => m.compareTo(n));
  var lettreMap = {};
  for (var l in listeLettre) {lettreMap[l] = lettreMap.putIfAbsent(l,()=> 0) + 1;}
  return lettreMap;
}

void main() {
  TextAreaElement champTexte = document.query('#textBox');
  TextAreaElement resultatTexte = document.query('#resultatBox');
  ButtonElement submitButton = document.query('#frequenceButton');

  var text = champTexte.value.trim();

  submitButton.onClick.listen((MouseEvent e) {
    var resultat = frequenceLettre(text);
    resultatTexte.value = resultat;
  });
}