import 'package:flutter/material.dart';
import '../../data/repositories/recipe_repository.dart';
import '../../design_system/app_spacing.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final judulC = TextEditingController();
  final bahanC = TextEditingController();
  final langkahC = TextEditingController();
  final catatanC = TextEditingController();

  String kategori = 'Sarapan';
  final repo = RecipeRepository();

  @override
  void dispose() {
    judulC.dispose();
    bahanC.dispose();
    langkahC.dispose();
    catatanC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Resep')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: ListView(
          children: [
            TextField(
              controller: judulC,
              decoration: const InputDecoration(labelText: 'Judul Resep'),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: kategori,
              items: const [
                DropdownMenuItem(value: 'Sarapan', child: Text('Sarapan')),
                DropdownMenuItem(value: 'Makan Siang', child: Text('Makan Siang')),
                DropdownMenuItem(value: 'Makan Malam', child: Text('Makan Malam')),
                DropdownMenuItem(value: 'Dessert', child: Text('Dessert')),
              ],
              onChanged: (v) => setState(() => kategori = v!),
              decoration: const InputDecoration(labelText: 'Kategori'),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: bahanC,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Bahan-bahan'),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: langkahC,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Langkah-langkah'),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: catatanC,
              decoration:
                  const InputDecoration(labelText: 'Catatan (opsional)'),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (judulC.text.isEmpty) return;

                      await repo.addRecipe(
                        judul: judulC.text,
                        kategori: kategori,
                        bahan: bahanC.text,
                        langkah: langkahC.text,
                        catatan: catatanC.text,
                      );

                      Navigator.pop(context, true); // 🔥 trigger refresh
                    },
                    child: const Text('Simpan'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
