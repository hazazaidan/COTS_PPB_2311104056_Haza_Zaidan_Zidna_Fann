class Recipe {
  final int id;
  final String judul;
  final String kategori;
  final String bahan;
  final String langkah;
  final String catatan;

  Recipe({
    required this.id,
    required this.judul,
    required this.kategori,
    required this.bahan,
    required this.langkah,
    required this.catatan,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      judul: json['judul'],
      kategori: json['kategori'],
      bahan: json['bahan'],
      langkah: json['langkah'],
      catatan: json['catatan'] ?? '',
    );
  }
}
