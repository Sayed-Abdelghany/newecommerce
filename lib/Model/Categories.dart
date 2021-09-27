List categories = [
  { 'name':"Shirts",'image':"assets/images/sh.jpg"},
  { 'name':"Watches",'image':"assets/images/clo.jpg"},
  {'name':"Bags",'image':"assets/images/ba.jpg"},
  { 'name':"Shoes",'image':"assets/images/shoes.jpg"},
  {'name':"Jeans",'image':"assets/images/je.jpg"},
  { 'name':"Jackets",'image':"assets/images/ja.jpg"},
  {'name':"Accessories",'image':"assets/images/acces.jpg"},

];
List<Product> products = [
  Product( name:'Versace',image:'assets/images/p1.jpg',price:"700 LE",quantity: '3'),
  Product( name:'Namshi',image:'assets/images/p2.jpg',price:"650 LE",quantity: '4'),
  Product( name:'Adidas',image:'assets/images/p3.jpg',price:"450 LE",quantity: '8'),
  Product( name:'Zara',image:'assets/images/p4.jpg',price:"900 LE",quantity: '5'),
  Product( name:'Gucci',image:'assets/images/p5.jpg',price:"800 LE",quantity: '7'),
  Product( name:'Converse',image:'assets/images/p6.jpg',price:"500 LE",quantity: '2'),
  Product( name:'Lacoste',image:'assets/images/p7.jpg',price:"780 LE",quantity: '6'),

];
List animate=[
  "assets/images/a1.jpg",
  "assets/images/a2.jpg",
  "assets/images/a3.jpg",
  "assets/images/a4.jpg",
];
class Product{

  String ?name;
  String ?price;
  String ?quantity;
  String ?image;
  Product({this.name,this.price,this.quantity,this.image});
}

class Order{
  String ?id;
  String ?name;
  String ?size;
  String ?price;
  String ?desc;
  String ?link;
  Order({this.id,this.name,this.size,this.price,this.desc,this.link});
}