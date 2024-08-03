class CategoryModel {
  final String name;
  bool active;
  int id;

  CategoryModel({required this.name, required this.active, required this.id});
}

List<CategoryModel> categories = [
  CategoryModel(name: '브레드', active: true, id: 1),
  CategoryModel(name: '케이크', active: false, id: 2),
  CategoryModel(name: '샌드위치/샐러드', active: false, id: 3),
  CategoryModel(name: '디저트/스낵', active: false, id: 4),
];
