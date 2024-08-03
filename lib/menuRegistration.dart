import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // 권한 핸들러 패키지

class MenuRegistration extends StatefulWidget {
  const MenuRegistration({super.key});

  @override
  State<MenuRegistration> createState() => _MenuRegistrationState();
}

class _MenuRegistrationState extends State<MenuRegistration> {
  XFile? selectedImage; // 선택된 이미지를 저장하는 변수
  bool isImageUpdated = false; // 이미지가 업데이트되었는지 확인하는 플래그

  // 입력 필드 컨트롤러 추가
  final TextEditingController _mysteryBoxDescriptionController =
      TextEditingController();

  // 이미지 선택을 처리하는 메서드
  Future<void> imagePicker() async {
    // 저장소 권한 요청
    PermissionStatus status = await Permission.storage.request();

    // 권한 상태 확인
    if (status.isDenied) {
      // 권한이 거부된 경우 모달 표시
      _showPermissionDeniedModal();
    } else if (status.isPermanentlyDenied) {
      // 권한이 영구적으로 거부된 경우 설정으로 이동
      _showPermissionPermanentlyDeniedModal();
    } else if (status.isGranted) {
      // 이미지 선택기 초기화
      final ImagePicker picker = ImagePicker();

      try {
        // 갤러리에서 이미지 선택
        final XFile? localImage = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 50, // 이미지 품질을 50%로 줄임
        );

        // 이미지가 선택된 경우 상태 업데이트
        if (localImage != null) {
          setState(() {
            selectedImage = localImage;
            isImageUpdated = true;
          });
        }
      } catch (error) {
        // 오류가 발생한 경우 오류 모달 표시
        _showErrorModal();
      }
    }
  }

  // 권한 거부 모달을 보여주는 메서드
  void _showPermissionDeniedModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('권한 필요'),
          content: const Text('사진을 선택하려면 저장소 권한이 필요합니다. 권한을 허용해주세요.'),
          actions: <Widget>[
            TextButton(
              child: const Text('다시 시도'),
              onPressed: () {
                Navigator.of(context).pop();
                imagePicker(); // 다시 권한 요청
              },
            ),
            TextButton(
              child: const Text('닫기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // 영구적으로 권한이 거부된 경우 설정으로 이동할 수 있는 모달
  void _showPermissionPermanentlyDeniedModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('권한 필요'),
          content: const Text('사진을 선택하려면 저장소 권한이 필요합니다. 설정에서 권한을 허용해주세요.'),
          actions: <Widget>[
            TextButton(
              child: const Text('설정 열기'),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings(); // 앱 설정 열기
              },
            ),
            TextButton(
              child: const Text('닫기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // 오류 모달을 보여주는 메서드
  void _showErrorModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('오류 발생'),
          content: const Text('이미지를 선택하는 중 오류가 발생했습니다. 다시 시도해주세요.'),
          actions: <Widget>[
            TextButton(
              child: const Text('닫기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // 이미지 선택 초기화 메서드
  void _resetImage() {
    setState(() {
      selectedImage = null;
      isImageUpdated = false;
    });
  }

  // 입력된 정보를 출력하거나 서버로 전송하는 함수
  void _submitForm() {
    String mysteryBoxDescription = _mysteryBoxDescriptionController.text;

    if (mysteryBoxDescription.isEmpty) {
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

    // 선택된 정보 출력
    print('Mystery Box Description: $mysteryBoxDescription');

    // 여기에 서버로 데이터를 전송하는 코드를 추가합니다.
    // 예를 들어:
    // sendToServer(mysteryBoxDescription, selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // 이전 화면으로 돌아가기
          },
        ),
        title: const Text(
          '미스떠리 박스 등록', // AppBar 제목
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // 제목을 가운데로 정렬
        actions: [
          TextButton(
            onPressed: _submitForm, // 저장 기능 추가
            child: const Text(
              '저장',
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
            Center(
              child: selectedImage != null
                  ? Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.file(
                          File(selectedImage!.path), // 선택한 이미지 표시
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: _resetImage, // 이미지 초기화 메서드 호출
                          ),
                        ),
                      ],
                    )
                  : IconButton(
                      iconSize: 100.0, // 강조를 위한 큰 크기 설정
                      icon: const Icon(Icons.add_a_photo, color: Colors.orange),
                      onPressed: imagePicker, // 이미지 선택 메서드 호출
                    ),
            ),
            const SizedBox(height: 20),
            const Text(
              '미스떠리 박스 설명',
              style: TextStyle(
                  fontSize: 22, fontFamily: 'Pretendard', color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _mysteryBoxDescriptionController,
              maxLines: 5, // 다중 라인 입력을 위한 설정
              decoration: const InputDecoration(
                hintText: '미스떠리 박스 설명을 입력해주세요.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const Spacer(), // 남은 공간을 채워 버튼을 위로 밀기
          ],
        ),
      ),
    );
  }
}
