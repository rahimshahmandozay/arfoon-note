import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:arfoon_note/configs/layout/responsive.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:arfoon_note/view/home/home_widget/chip_list_widget.dart';
import 'package:arfoon_note/view/home/home_widget/my_note_list_widget.dart';
import 'package:arfoon_note/view_model/label_provider.dart';
import 'package:arfoon_note/view_model/todo_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MyNoteWidget extends StatefulWidget {
  const MyNoteWidget({super.key});

  @override
  State<MyNoteWidget> createState() => _MyNoteWidgetState();
}

class _MyNoteWidgetState extends State<MyNoteWidget> {
  late final TextEditingController _searchController;
  late String selectedFilter = "All Notes";

  @override
  void initState() {
    _searchController = TextEditingController();
    selectedFilter = "All Notes";
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> filters = [
      "All Notes",
      ...context.watch<LabelProvider>().labels
    ];
    if (!filters.contains(selectedFilter)) {
      selectedFilter = "All Notes";
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          if (Responsive.isDesktop(context)) const SizedBox(height: 23),
          if (Responsive.isDesktop(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Notes",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTxtColor,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppVectors.plus,
                    height: 16,
                    width: 16,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  label: const Text("New"),
                ),
              ],
            ),
          Responsive.isMobile(context)
              ? const SizedBox(
                  height: 20,
                )
              : const SizedBox(height: 30),
          Container(
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.borderColor,
              ),
              borderRadius: Responsive.isMobile(context)
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(6),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                context.read<TodoProvider>().searchQuery(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: AppColors.disabled,
                ),
                hintText: "Search Notes",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.disabled,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (Responsive.isMobile(context))
            SizedBox(
              height: 28,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: ChipListWidget(
                        text: filter,
                        textColor: selectedFilter == filter
                            ? AppColors.lightBackground
                            : AppColors.primary,
                        backgroundColor: selectedFilter == filter
                            ? AppColors.primary
                            : AppColors.lightBackground,
                      ),
                    ),
                  );
                },
              ),
            ),
          if (Responsive.isMobile(context)) const SizedBox(height: 20),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, noteProvider, child) {
                final searched = noteProvider.searchedTodo;
                final filteredTodos = selectedFilter == "All Notes"
                    ? searched
                    : searched
                        .where((todo) =>
                            todo.label != null && todo.label == selectedFilter)
                        .toList();

                if (noteProvider.todos.isEmpty) {
                  return const Center(
                    child: Text("There is no Todo, please add some."),
                  );
                }
                return ListView.builder(
                  itemCount: filteredTodos.length,
                  itemBuilder: (context, index) {
                    final note = filteredTodos[index];
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        context.read<TodoProvider>().deleteTask(index);

                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${note.title} dismissed!'),
                          ),
                        );
                      },
                      child: MyNoteListWidget(
                        data: note.saveTime,
                        title: note.title,
                        description: note.description,
                        label: note.label ?? '',
                        backgroundColor: note.color,
                        onTap: () {
                          // context.read<TodoProvider>().pinOrUnpinTodo(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
