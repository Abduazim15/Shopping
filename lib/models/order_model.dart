class OrderModel{
  final String title;
  final String subTitle;
  final String btnTxt;
  final String? description;
  final bool isCheck;

  OrderModel({this.description, required this.title, required this.subTitle, required this.btnTxt, required this.isCheck});
}