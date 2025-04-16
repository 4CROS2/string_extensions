extension StringExtensions on String {
  String toTitleCase() {
    return split(' ').map((String word) {
      if (word.isEmpty) {
        return word;
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

   String capitalize() {
    if (isEmpty) return '';

    final regExp = RegExp(r'[A-Za-zÁÉÍÓÚáéíóúÑñ]');
    final match = regExp.firstMatch(this);

    if (match == null) return this;

    final index = match.start;
    return substring(0, index) +
        this[index].toUpperCase() +
        substring(index + 1).toLowerCase();
  }

  String capitalizeSentences() {
    if (isEmpty) {
      return '';
    }
    List<String> sentences = split('. ');
    for (int i = 0; i < sentences.length; i++) {
      if (sentences[i].isNotEmpty) {
        sentences[i] = sentences[i][0].toUpperCase() +
            sentences[i].substring(1).toLowerCase();
      }
    }
    return sentences.join('. ');
  }
}
