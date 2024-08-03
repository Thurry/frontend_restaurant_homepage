import 'package:flutter/material.dart';
import '../model/menu_model.dart';
import '../model/category_model.dart';

class MenuList extends StatefulWidget {
  final Function(int) onCategoryChanged;
  final int selectedCategoryId;

  const MenuList({
    required this.onCategoryChanged,
    required this.selectedCategoryId,
    super.key,
  });

  @override
  MenuListState createState() => MenuListState();
}

class MenuListState extends State<MenuList> {
  final ScrollController _scrollController = ScrollController();

  /// 각 카테고리의 GlobalKey를 생성합니다.
  final Map<int, GlobalKey> categoryKeys = {};

  @override
  void initState() {
    super.initState();

    // 각 카테고리의 GlobalKey를 초기화합니다.
    for (var category in categories) {
      categoryKeys[category.id] = GlobalKey();
    }

    // 스크롤 리스너 추가
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  /// 스크롤 시 카테고리 변경
  void _onScroll() {
    double screenHeight = MediaQuery.of(context).size.height;
    double threshold = screenHeight * 0.5; // 스크롤 기준점 설정

    for (var i = 0; i < categories.length; i++) {
      final category = categories[i];
      final key = categoryKeys[category.id];
      if (key?.currentContext != null) {
        final box = key!.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (i == 0) {
          final nextCategoryKey = categoryKeys[categories[i + 1].id];
          if (nextCategoryKey?.currentContext != null) {
            final nextBox = nextCategoryKey!.currentContext!.findRenderObject()
                as RenderBox;
            final nextPosition = nextBox.localToGlobal(Offset.zero).dy;

            if (nextPosition > screenHeight * 0.5) {
              widget.onCategoryChanged(category.id);
              break;
            }
          }
        } else {
          // 일반적인 카테고리 처리
          if (position <= threshold &&
              position + box.size.height >= threshold) {
            widget.onCategoryChanged(category.id);
            break;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [];

    // 카테고리별로 아이템을 리스트에 추가합니다.
    for (var category in categories) {
      itemList.add(
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            category.name,
            key: categoryKeys[category.id],
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      for (var item
          in menuItems.where((item) => item.categoryId == category.id)) {
        itemList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: item,
          ),
        );
      }
    }

    // Expanded를 사용하여 ListView에 고정된 높이를 제공합니다.
    return Expanded(
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(8.0),
        children: itemList,
      ),
    );
  }
}
