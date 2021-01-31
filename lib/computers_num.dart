import 'dart:math';

class Computers_Num {
  List<int> random() {
    // bu bilgisayarın salladığı rakam
    int computerNumber = 0;
    int flag = 1;
    int temp = 0;
    List<int> digits = [0, 0, 0, 0];
    double a = 0.0;
    do {
      flag = 1;
      Random rnd = new Random();
      computerNumber = rnd.nextInt(9000) + 1000;
      temp = computerNumber;

      digits[0] = temp % 10;
      a = (temp / 10);
      temp = a.round();
      if (digits[0] == 0) {
        digits[0] = rnd.nextInt(8) + 1;
      }

      digits[1] = temp % 10;
      a = (temp / 10);
      temp = a.round();

      digits[2] = temp % 10;
      a = (temp / 10);
      digits[3] = a.round();

      if (digits[3] == 10) {
        digits[3] = digits[3] - 1;
      }

      for (int i = 0; i < digits.length - 1; i++) {
        for (int j = i + 1; j < digits.length; j++) {
          if (digits[i] == digits[j]) {
            flag = -1;
          } else {
            print("Farklı");
            print(digits);
          }
        }
      }

      if (flag == 1) {
        return digits;
      }
    } while (flag != 1);
  }

  bool inputchecker(List<String> inp) {
    // burda sayılar aynı mı değil mi kontrol ediyo. Tamam burası zaten ya ture ya fals eevet

    int flag2 = 1;
    List<int> inp_digits = inp.map(int.parse).toList();

    for (int i = 0; i < inp_digits.length - 1; i++) {
      for (int j = i + 1; j < inp_digits.length; j++) {
        if (inp_digits[i] == inp_digits[j]) {
          flag2 = -1; // aynı sayı bulduğunda

        }
      }
    }

    if (flag2 == -1) {
      return false;
    }

    return true;
  }
}
