import 'dart:io';

void main() {
  const int maxValue = 100;

  for (var i = 0; i <= maxValue; i++) {
    if(i%3 == 0 && i%5 == 0){
      stdout.write("Apabole ");
    }else if(i % 3 == 0){
      stdout.write("Apa ");
    }else if(i % 5 == 0){
      stdout.write("Bole ");
    }else{
      stdout.write("$i ");
    }
  }
}
