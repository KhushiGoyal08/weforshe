 import 'dart:math';

const images=[
  'assets/8.jpg',
  'assets/9.jpg',
  'assets/12.jpg',
  'assets/14.jpg',
  'assets/21.jpg',
  'assets/24.jpg',
  'assets/29.jpg',
  'assets/34.jpg',
  'assets/35.jpg',
  'assets/42.jpg',
  'assets/44.jpg',
  'assets/46.jpg',
  'assets/47.jpg',
  'assets/51.jpg',
  'assets/52.jpg',
  'assets/53.jpg',
  'assets/57.jpg',
  'assets/60.jpg',
  'assets/61.jpg',
  'assets/62.jpg',
  'assets/63.jpg',
  'assets/64.jpg',
  'assets/66.jpg',
  'assets/84.jpg',
  'assets/blue shoes.jpg'
 ];
 String getRandomImages(List<String> array) {
  final random = Random();
  int randomIndex = random.nextInt(array.length);
  return array[randomIndex];
}