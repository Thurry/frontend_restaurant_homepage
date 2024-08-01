class CategoryModel {
  final String name;
  bool active;
  int id;

  CategoryModel({required this.name, required this.active, required this.id});
}

List<CategoryModel> categories = [
  CategoryModel(name: '인기', active: true, id: 1),
  CategoryModel(name: '신영빈', active: false, id: 2),
  CategoryModel(name: '강민규', active: false, id: 3),
  CategoryModel(name: '김성은', active: false, id: 4),
];
