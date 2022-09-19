class BannerModel {
  String urlImg;

  BannerModel(this.urlImg);
  static List<BannerModel> banner = 
      [
        BannerModel('https://static-cdn.jtvnw.net/ttv-boxart/505884-272x380.jpg'),
        BannerModel('https://www.startupmgzn.com/english/wp-content/uploads/2020/03/Screen-Shot-2020-03-22-at-10.59.04-AM.png'),
        BannerModel('https://i.pinimg.com/originals/08/68/dc/0868dcacc7c50ca2c7d35b27be81e5a9.png'),
        BannerModel('https://www.itp.net/cloud/2021/08/19/WU7oiBRv-SHAHID-PLUS-LOGO-1-800x379.jpg'),
        BannerModel('https://i.pinimg.com/originals/ff/e1/8b/ffe18bc07f4987eed129481171683dad.jpg'),
        BannerModel('https://i0.wp.com/news.xbox.com/en-us/wp-content/themes/microsoft/assets/img/default/img-default-medium.jpg'),
      ];
}
class ProductsModel {
  String urlImg;
  String title;
  String price;

  ProductsModel({required this.urlImg, required this.title, required this.price});
  static List<ProductsModel> products =
      [
        ProductsModel(
            urlImg: 'https://static-cdn.jtvnw.net/ttv-boxart/505884-272x380.jpg',
            title: 'شحن ببجي 60 شدة',
            price: "720 جنيه"
        ),
        ProductsModel(
            urlImg: 'https://static-cdn.jtvnw.net/ttv-boxart/505884-272x380.jpg',
            title: 'شحن ببجي 325 شدة',
            price: "3,078 جنيه"
        ),
        ProductsModel(
            urlImg: 'https://static-cdn.jtvnw.net/ttv-boxart/505884-272x380.jpg',
            title: 'شحن ببجي 660 شدة',
            price: "5,985 جنيه"
        ),
        ProductsModel(
            urlImg: 'https://static-cdn.jtvnw.net/ttv-boxart/505884-272x380.jpg',
            title: 'شحن ببجي 1800 شدة',
            price: "14,873 جنيه"
        ),

      ];
}