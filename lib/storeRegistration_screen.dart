import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menuRegistration.dart'; // 메뉴 등록 화면 가져오기

class StoreRegistrationScreen extends StatefulWidget {
  const StoreRegistrationScreen({super.key});

  @override
  State<StoreRegistrationScreen> createState() =>
      _StoreRegistrationScreenState();
}

class _StoreRegistrationScreenState extends State<StoreRegistrationScreen> {
  // 선택된 카테고리를 저장하는 리스트
  final List<String> _selectedCategories = [];

  // 카테고리 리스트
  final List<String> _categories = ['브레드', '케이크', '디저트/스낵', '샌드위치/샐러드', '기타'];

  // TextEditingController for input fields
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _storeAddressController = TextEditingController();
  final TextEditingController _storePhoneNumberController =
      TextEditingController(); // 전화번호 입력 컨트롤러 추가

  // 오픈 시간을 저장하는 변수
  int _selectedHour = 9; // Default open hour
  int _selectedMinute = 0; // Default open minute

  // 카테고리 선택/취소 함수
  void _toggleCategory(String category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
  }

  // 카테고리 버튼 생성 위젯
  Widget _buildCategoryButton(String category) {
    bool isSelected = _selectedCategories.contains(category);

    return GestureDetector(
      onTap: () => _toggleCategory(category),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.orange : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Pretendard',
              ),
            ),
            GestureDetector(
              onTap: () => _toggleCategory(category),
              child: Padding(
                padding: const EdgeInsets.only(left: 8), // 왼쪽에 여백 추가
                child: Icon(
                  isSelected ? Icons.remove : Icons.add,
                  color: isSelected ? Colors.orange : Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 입력된 정보를 출력하거나 서버로 전송하는 함수
  void _submitForm() {
    String storeName = _storeNameController.text;
    String storeAddress = _storeAddressController.text;
    String storePhoneNumber = _storePhoneNumberController.text; // 전화번호 추가

    if (storeName.isEmpty || storeAddress.isEmpty || storePhoneNumber.isEmpty) {
      // 입력 필드가 비어 있을 때
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '모든 필드를 입력해 주세요.',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white70,
        ),
      );
      return;
    }

    if (_selectedCategories.isEmpty) {
      // 카테고리가 선택되지 않았을 때
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            '하나 이상의 카테고리를 선택해 주세요.',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white70,
        ),
      );
      return;
    }

    // 선택된 정보 출력
    print('Store Name: $storeName');
    print('Store Address: $storeAddress');
    print('Store Phone Number: $storePhoneNumber');
    print(
        'Selected Opening Time: ${_selectedHour.toString().padLeft(2, '0')}:${_selectedMinute.toString().padLeft(2, '0')}');
    print('Selected Categories: $_selectedCategories');

    // 여기에 서버로 데이터를 전송하는 코드를 추가합니다.
    // 예를 들어:
    // sendToServer(storeName, storeAddress, storePhoneNumber, _selectedHour, _selectedMinute, _selectedCategories);

    // 모든 입력이 완료되면 다음 화면으로 이동
    _navigateToMenuRegisterScreen();
  }

  // 다음 화면으로 이동하는 함수
  void _navigateToMenuRegisterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MenuRegistration(),
      ),
    );
  }

  // 시간 선택기 생성 함수
  Widget _buildTimePicker() {
    return Row(
      children: [
        Expanded(
          child: CupertinoPicker(
            scrollController:
                FixedExtentScrollController(initialItem: _selectedHour),
            itemExtent: 32.0,
            backgroundColor: Colors.orange,
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedHour = index;
              });
            },
            children: List<Widget>.generate(24, (int index) {
              return Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Pretendard'),
                ),
              );
            }),
          ),
        ),
        const Text(
          ":",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontFamily: 'Pretendard'),
        ),
        Expanded(
          child: CupertinoPicker(
            scrollController:
                FixedExtentScrollController(initialItem: _selectedMinute),
            itemExtent: 32.0,
            backgroundColor: Colors.orange,
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedMinute = index;
              });
            },
            children: List<Widget>.generate(60, (int index) {
              return Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Pretendard'),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '매장 정보 등록', // 중앙에 텍스트 추가
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 20, // 크기 조정
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // 타이틀을 가운데로 정렬
        actions: [
          TextButton(
            onPressed: () {
              _submitForm(); // 폼 제출 함수 호출과 화면 전환
            },
            child: const Text(
              '다음',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '매장 이름',
              style: TextStyle(
                  fontSize: 22, fontFamily: 'Pretendard', color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _storeNameController,
              decoration: const InputDecoration(
                hintText: '매장 이름을 입력해주세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '매장 오픈 시간',
              style: TextStyle(
                  fontSize: 22, fontFamily: 'Pretendard', color: Colors.white),
            ),
            const SizedBox(height: 10),
            _buildTimePicker(), // 시간 선택기 추가
            const SizedBox(height: 20),
            const Text(
              '매장 전화번호', // 전화번호 입력 필드 추가
              style: TextStyle(
                  fontSize: 22, fontFamily: 'Pretendard', color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _storePhoneNumberController,
              keyboardType: TextInputType.phone, // 전화번호 입력에 적합한 키보드 타입 설정
              decoration: const InputDecoration(
                hintText: '매장 전화번호를 입력해주세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '매장 주소',
              style: TextStyle(
                  fontSize: 22, fontFamily: 'Pretendard', color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _storeAddressController,
              decoration: const InputDecoration(
                hintText: '매장 주소를 입력해주세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '카테고리 등록',
              style: TextStyle(
                  fontSize: 22, fontFamily: 'Pretendard', color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              '판매하실 미쓰떠리 박스 카테고리를 선택해주세요',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Pretendard',
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 16),
            // 카테고리 선택 버튼들
            Wrap(
              spacing: 5.0,
              runSpacing: 8.0,
              children: _categories.map(_buildCategoryButton).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
