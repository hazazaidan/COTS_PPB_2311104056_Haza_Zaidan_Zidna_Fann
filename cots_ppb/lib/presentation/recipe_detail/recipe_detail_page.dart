import 'package:flutter/material.dart';
import '../../data/models/recipe.dart';
import '../../design_system/app_typography.dart';
import '../../design_system/app_spacing.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailPage({super.key, required this.recipe});

  Widget section(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.section),
        const SizedBox(height: 8),
        Text(content, style: AppTypography.body),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Resep')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipe.judul, style: AppTypography.title),
            const SizedBox(height: 4),
            Text('Kategori: ${recipe.kategori}',
                style: AppTypography.caption),
            const SizedBox(height: 16),

            section('Bahan-bahan', recipe.bahan),
            section('Langkah-langkah', recipe.langkah),
            section('Catatan', recipe.catatan),
          ],
        ),
      ),
    );
  }
}
