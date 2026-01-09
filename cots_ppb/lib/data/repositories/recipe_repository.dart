import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/recipe.dart';

class RecipeRepository {
  final supabase = Supabase.instance.client;

  // CREATE
  Future<void> addRecipe({
    required String judul,
    required String kategori,
    required String bahan,
    required String langkah,
    required String catatan,
  }) async {
    await supabase.from('recipes').insert({
      'judul': judul,
      'kategori': kategori,
      'bahan': bahan,
      'langkah': langkah,
      'catatan': catatan,
    });
  }

  // READ
  Future<List<Recipe>> getRecipes() async {
    final data = await supabase
        .from('recipes')
        .select()
        .order('id', ascending: false);

    return data.map<Recipe>((e) => Recipe.fromJson(e)).toList();
  }

  // UPDATE
  Future<void> updateRecipe({
    required int id,
    required String judul,
    required String kategori,
    required String bahan,
    required String langkah,
    required String catatan,
  }) async {
    await supabase.from('recipes').update({
      'judul': judul,
      'kategori': kategori,
      'bahan': bahan,
      'langkah': langkah,
      'catatan': catatan,
    }).eq('id', id);
  }

  // DELETE
  Future<void> deleteRecipe(int id) async {
    await supabase.from('recipes').delete().eq('id', id);
  }

  // DASHBOARD STATS
  Future<Map<String, int>> getStats() async {
    final data = await supabase.from('recipes').select('kategori');

    return {
      'total': data.length,
      'sarapan':
          data.where((e) => e['kategori'] == 'Sarapan').length,
      'dessert':
          data.where((e) => e['kategori'] == 'Dessert').length,
      'makan': data
          .where((e) =>
              e['kategori'] == 'Makan Siang' ||
              e['kategori'] == 'Makan Malam')
          .length,
    };
  }
}
