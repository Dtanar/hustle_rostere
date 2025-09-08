import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todosql/providers/providers.dart';
import 'package:todosql/utils/utils.dart';
import 'package:todosql/widgets/widgets.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Text('Category', style: context.textTheme.titleLarge),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(categoryProvider.notifier).state = category;
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: CircleContainer(
                        color: category.color.withValues(alpha: 0.3),
                        borderColor: category == selectedCategory
                            ? context.colorScheme.onPrimary
                            : category.color.withValues(alpha: 0.8),
                        child: Icon(
                          category.icon,
                          color: category == selectedCategory
                              ? context.colorScheme.onPrimary
                              : category.color,
                        ),
                      ),
                    ),
                    const Gap(8),
                    Text(category.name, style: context.textTheme.bodySmall),
                  ],
                );
              },
              separatorBuilder: (context, index) => const Gap(8),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
