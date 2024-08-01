import 'package:flutter/material.dart';
import 'menu_model.dart';
import 'category_model.dart';

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

  void scrollToCategory(int categoryId) async {
    final key = categoryKeys[categoryId];
    if (key?.currentContext != null) {
      await Future.delayed(Duration.zero); // 현재 스크롤이 완료될 때까지 대기

      final box = key!.currentContext!.findRenderObject() as RenderBox;
      double yPosition = box.localToGlobal(Offset.zero).dy;

      if (categoryId == categories.first.id) {
        // 첫 번째 카테고리는 상단에 고정
        yPosition = 0;
      } else if (categoryId == categories.last.id) {
        // 마지막 카테고리는 뷰포트에 따라 조정
        yPosition -= (MediaQuery.of(context).size.height - box.size.height);
      } else {
        // 중간 카테고리들은 중앙에 위치
        yPosition -=
            (MediaQuery.of(context).size.height / 2 - box.size.height / 2);
      }

      _scrollController.animateTo(
        yPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
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

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(8.0),
      children: itemList,
    );
  }
}
