class Challenges {
  final String name;
  final String description;
  final String image;

  Challenges(this.name, this.description, this.image);
}

final challenges = List.generate(
  _names.length,
  (index) => Challenges(
    _names[index],
    _descriptions[index],
    'assets/image/ic_challange${index + 1}.jpeg',
  ),
);

final _names = [
  "Time Attack",
  "Brain Storm",
  "Words Power",
  "StoryBox",
  "Comic Sentences"
];

final _descriptions = [
  "Belirlenen sürede en çok kelimeyi doğru bil",
  "En sıradışı kelimeleri bul ve rakibini zorla",
  "Seçtiğin kelime sepetini rakibine gönder",
  "Üç adet ipucu belirle, rakibin hikayesini dinle",
  "Günlük kullandığın cümlelerin çevirilerini sor"
];
