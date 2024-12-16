import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:arfoon_note/configs/layout/responsive.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MyNoteListWidget extends StatefulWidget {
  const MyNoteListWidget({
    super.key,
    required this.data,
    required this.title,
    required this.description,
    required this.label,
    required this.backgroundColor,
    required this.onTap,
  });
  final DateTime data;
  final String title;
  final String description;
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  State<MyNoteListWidget> createState() => _MyNoteListWidgetState();
}

class _MyNoteListWidgetState extends State<MyNoteListWidget> {
  bool isPined = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: Responsive.isMobile(context)
                ? BorderRadius.circular(25)
                : BorderRadius.circular(8),
          ),
          child: Padding(
            padding: Responsive.isMobile(context)
                ? const EdgeInsets.fromLTRB(25, 20, 25, 25)
                : const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('d MMM').format(widget.data),
                      style: TextStyle(
                        color: widget.backgroundColor == AppColors.surface
                            ? const Color(0xFF919191)
                            : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: !isPined
                            ? AppColors.lightBackground
                            : AppColors.primary,
                        border: Border.all(
                          color: AppColors.borderColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isPined = !isPined;
                          });
                        },
                        child: SvgPicture.asset(
                          AppVectors.pin,
                          height: 16,
                          width: 16,
                          colorFilter: ColorFilter.mode(
                            isPined
                                ? AppColors.lightBackground
                                : AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: widget.backgroundColor == AppColors.surface
                        ? const Color(0xFF09090B)
                        : Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: Responsive.isDesktop(context) ? 260 : 338,
                  ),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      color: widget.backgroundColor == AppColors.surface
                          ? const Color(0xFFA2A2A2)
                          : Colors.white,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      if (widget.label.isEmpty) {
                        return null;
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 11),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F4F5),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.borderColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            widget.label,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.secondaryTxtColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
