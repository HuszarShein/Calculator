#ifndef CALC_H
#define CALC_H

#include <QObject>
#include <QTextStream>
#include <string>
#include <QtMath>

#define PI 3.14159265

class Calc : public QObject
{
     Q_OBJECT
public:
    Calc();
private:
    // TextInput1

    const char multiplicationSymbol = 215, divisionSymbol = 247;

    bool last_number = false;

    bool is_symbol_repeated = false;

    QString real, real_with_symbol, symbol;

    int a,b;

    //TextInput2
    QString result;

    bool dot_is_true = false;

    double res = 0;
    double real_number = 0;

    int symNumber = 0;
    double number = 0; QString numberSTR;
    int num_of_symbol = 0;

    int buttonNumber = 0; // 0 => 0..9
                          // 1 => +-*/
                          // 2 => =
                          // 3 => CE
                          // 4 => C
                          // 5 => .
                          // 6 => swap sign
                          // 7 => sin(x)..ctg(x)
                          // 8 => log(x)
                          // 9 => exp
    //

public slots:
    //0
    void add_number(double num)
    {
        dot_is_true = false;
        switch (buttonNumber) {
            case 0:
                real = real_with_symbol;
                add_numberSTR(num);//number = number * 10 + num;
                last_number = true;
                break;
            case 1:
                real = real_with_symbol;
                numberSTR = "";
                add_numberSTR(num);//number = num;
                last_number = true;
                break;
            case 2:
                clearAll();
                //real = ""; real_with_symbol = "";
                //real = real_with_symbol;
                //numberSTR = "";
                add_numberSTR(num);//number = num;
                last_number = true;
                break;
            case 5:
                add_numberSTR(num);
                break;
            case 6:
                //real = real_with_symbol;
                //QTextStream(&real_with_symbol) << numberSTR;
                add_numberSTR(num);
                last_number = true;
                break;
         /* case 3:
            case 4:
            case 7:
            case 8:
            case 9: */

        }
        real_number = number;
        buttonNumber = 0;
    }
    //1
    void add_symbol(int sym)
    {
        dot_is_true = false;
        switch (buttonNumber) {
            case 0:
                calculate(symNumber);
                switchSymbol(sym);
                QTextStream(&real_with_symbol) << real << symbol;
                break;
            case 1:
                calculate(symNumber);
                switchSymbol(sym);
                QTextStream(&real_with_symbol) << real << symbol;
                break;
            case 2:
                number = res;
                real_with_symbol = "";
                real = "";
                switchSymbol(sym);
                QTextStream(&real_with_symbol) << real << symbol;
                break;
            case 5:
                calculate(symNumber);
                switchSymbol(sym);
                QTextStream(&real_with_symbol) << real << symbol;
                break;
            case 6:
                calculate(symNumber);
                real = real_with_symbol;
                switchSymbol(sym);
                real_with_symbol = real;
                QTextStream(&real_with_symbol) << symbol;
                break;
         /* case 3:
            case 4:
            case 7:
            case 8:
            case 9: */

        }
        real_number = 0;
        buttonNumber = 1;
    }
    //2
    void equally()
    {
        dot_is_true = false;
        switch (buttonNumber) {
            case 0:
                calculate(symNumber);
                QTextStream(&real_with_symbol) << number << " =";
                break;
            case 1:
                QTextStream(&real_with_symbol) << res << " =";
                is_symbol_repeated = false;
                last_number = true;
                number = res;
                calculate(symNumber);
                break;
            case 2:
                switchSymbol(symNumber);
                QTextStream(&real_with_symbol) << symbol << number << " =";
                last_number = true;
                calculate(symNumber);
                break;
            case 5:
                calculate(symNumber);
                QTextStream(&real_with_symbol) << number << " =";
                break;
            case 6:
                calculate(symNumber);
                QTextStream(&real_with_symbol) << number << " =";
                break;
         /* case 3:
            case 4:
            case 7:
            case 8:
            case 9:  */
        }
        real_number = 0;
        buttonNumber = 2;
    }
    //5
    void dot()
    {
            switch (buttonNumber) {
                case 0:
                    if(dot_is_true == false)
                        QTextStream(&numberSTR) << ".";
                    break;
                case 1:
                    QTextStream(&numberSTR) << "0.";
                    break;
                case 2:
                    clearAll();
                    QTextStream(&numberSTR) << "0.";
                    break;
                case 5:

                    break;
                case 6:
                    numberSTR = "";
                    QTextStream(&numberSTR) << real_number << ".";
                    break;
             /* case 3:
                case 4:
                case 7:
                case 8:
                case 9:  */
            }
        dot_is_true = true;
        buttonNumber = 5;
    }
    //6
    void swapSign()
    {
            switch (buttonNumber) {
                case 0:
                    number = number * (-1);
                    numberSTR = "";
                    QTextStream(&numberSTR) << number;
                    break;
                case 1:
                    number = res;
                    number = number * (-1);
                    numberSTR = "";
                    QTextStream(&numberSTR) << number;
                    last_number = true;
                 /* real = "";
                    QTextStream(&real) << numberSTR;
                    QTextStream(&real_with_symbol) << real; */
                    break;
                case 2:
                    numberSTR = "";
                    real_with_symbol = "";
                    number = res;
                    number = number * (-1);
                    QTextStream(&numberSTR) << number;
                  //QTextStream(&real_with_symbol) << number;
                    break;
                case 5:
                    //number = numberSTR.toDouble();
                    number = number * (-1);
                    numberSTR = "";
                    QTextStream(&numberSTR) << number << ".";
                    break;
                case 6:
                    if(numberSTR[numberSTR.size()-1] == ".") {
                        number = number * (-1);
                        numberSTR = "";
                        QTextStream(&numberSTR) << number << ".";
                    } else {
                        number = number * (-1);
                        numberSTR = "";
                        QTextStream(&numberSTR) << number;
                    }
                    break;
             /* case 3:
                case 4: 
                case 7:
                case 8:
                case 9:  */
            }
        real_number = number;
        dot_is_true = true;
        buttonNumber = 6;
    }
    //7
    void tri(int tri)
    {
            switch (buttonNumber) {
                case 0:
                    switchTri(tri);
                    calculate(tri+4);
                    QTextStream(&real_with_symbol) << real << symbol;
                    break;
                case 1:

                    break;
                case 2:

                    break;
                case 5:

                    break;
                case 6:

                    break;
             /* case 3:
                case 4:
                case 7:
                case 8:
                case 9:  */
            }
        buttonNumber = 7;
    }

    void switchSymbol(int sym)
    {
        double num = number;
        if (buttonNumber == 2)
            num = res;
        switch (sym) {
            case 1:
                symNumber = 1;
                symbol = "";
                QTextStream(&symbol) << num << " + ";
                real_with_symbol = "";
                last_number = false;
                break;
            case 2:
                symNumber = 2;
                symbol = "";
                QTextStream(&symbol) << num << " - ";
                real_with_symbol = "";
                last_number = false;
                break;
            case 3:
                symNumber = 3;
                symbol = "";
                QTextStream(&symbol) << num << " " << multiplicationSymbol << " ";
                real_with_symbol = "";
                last_number = false;
                break;
            case 4:
                symNumber = 4;
                symbol = "";
                QTextStream(&symbol) << num << " " << divisionSymbol << " ";
                real_with_symbol = "";
                last_number = false;
                break;
            case 0:
                real_with_symbol = "";
                symbol = "";
                break;
        }
    }
    void switchTri(int tri)
    {
        double num = number;
        if (buttonNumber == 2)
            num = res;
        switch (tri) {
            case 1:
                symNumber = 1;
                symbol = "";
                QTextStream(&symbol) << "sin(" << num << ") ";
                real_with_symbol = "";
                last_number = false;
                break;
            case 2:
                symNumber = 2;
                symbol = "";
                QTextStream(&symbol) << "cos(" << num << ") ";
                real_with_symbol = "";
                last_number = false;
                break;
            case 3:
                symNumber = 3;
                symbol = "";
                QTextStream(&symbol) << "tg(" << num << ") ";
                real_with_symbol = "";
                last_number = false;
                break;
            case 4:
                symNumber = 4;
                symbol = "";
                QTextStream(&symbol) << "ctg(" << num << ") ";
                real_with_symbol = "";
                last_number = false;
                break;
            case 0:
                real_with_symbol = "";
                symbol = "";
                break;
        }
    }

    void plus()
    {
        if(num_of_symbol == 1)
            is_symbol_repeated = true;
        else
            is_symbol_repeated = false;
        num_of_symbol = 1;
        add_symbol(num_of_symbol);
    }
    void subtraction()
    {
        if(num_of_symbol == 2)
            is_symbol_repeated = true;
        else
            is_symbol_repeated = false;
        num_of_symbol = 2;
        add_symbol(num_of_symbol);
    }
    void multiplication()
    {
        if(num_of_symbol == 3)
            is_symbol_repeated = true;
        else
            is_symbol_repeated = false;
        num_of_symbol = 3;
        add_symbol(num_of_symbol);
    }
    void division()
    {
        if(num_of_symbol == 4)
            is_symbol_repeated = true;
        else
            is_symbol_repeated = false;
        num_of_symbol = 4;
        add_symbol(num_of_symbol);
    }

    void calculate(int sym_Number)
    {
        if ((last_number == true) || ((last_number == true) && (is_symbol_repeated == false)) || (buttonNumber == 7))
        {
            if(sym_Number == 0)
                res = number;
       // } else {
            switch(sym_Number) {
                case 1:
                    res += number;
                    break;
                case 2:
                    res -= number;
                    break;
                case 3:
                    res *= number;
                    break;
                case 4:
                    res /= number;
                    break;
                case 5:
                    number = qSin(number);
                    calculate(symNumber);
                    break;
            }
        }
    }

    void clearAll()
    {
        last_number = false;

        is_symbol_repeated = false;

        real =""; real_with_symbol = ""; symbol = "";


        //TextInput2
        result = "";

        res = 0;
        number = 0;
        symNumber = 0;
        number = 0; numberSTR = "";
        num_of_symbol = 0;

        buttonNumber = 0;
    }

    bool show_real()
    {
        return last_number;
    }
    QString show_real_with_symbol()
    {
        return symbol;//real_with_symbol;
    }

    double show_res()
    {
        return res;
    }
    double show_sym()
    {
        return number;
    }

    void add_numberSTR(double num)
    {
        QTextStream(&numberSTR) << num;
        number = numberSTR.toDouble();
    }

    QString textInput2_1_number()
    {
        QString TextInput2;
        switch (buttonNumber) {
            case 0:
                QTextStream(&TextInput2) << number;
                break;
            case 1:
                QTextStream(&TextInput2) << res;
                break;
            case 2:
                QTextStream(&TextInput2) << res;
                break;
            case 5:
                QTextStream(&TextInput2) << numberSTR;
                break;
            case 6:
                QTextStream(&TextInput2) << numberSTR;
                break;
            case 7:
                sind(1125);
                QTextStream(&TextInput2) /*<< a << ' ' << b;*/<< sind(355);//*/qSin(361*PI/180);
                break;
         /* case 3:
            case 4:
            case 8:
            case 9:  */
        }
        /*if ((buttonNumber != 0) || (buttonNumber == 2))
            {
                QTextStream(&TextInput2) << res;
                return TextInput2;
            }
        else
            {
                if (buttonNumber == 5)
                    QTextStream(&TextInput2) << number << ",";
                else
                    QTextStream(&TextInput2) << number;
                return TextInput2;
            }*/
        return TextInput2;
    }    

    static double d2r(double d)
    {
      return (d / 180.0) * ((double) M_PI);
    }

    double sind(double x)
    {
      if (!isfinite(x))
      {
        return qSin(x);
      }
      if (x < 0.0)
      {
        return -sind(-x);
      }
      int quo;
      double x90 = remquo(fabs(x), 90.0, &quo);
      a = x90; b = quo;
      switch (quo % 4)
      {
        case 0:
          // Use * 1.0 to avoid -0.0
          return qCos(d2r(x90)* 1.0);
        case 1:
          return sin(d2r(x90));
        case 2:
          return qCos(d2r(-x90) * 1.0);
        case 3:
          return -sin(d2r(x90));
      }
      return 0.0;
    }


    QString textInput1_1_real()
    {
        switch (buttonNumber) {
            case 0:
                return real_with_symbol;
                break;
            case 1:
                return real_with_symbol;
                break;
            case 2:
                return real_with_symbol;
                break;
            case 5:
                return real_with_symbol;
                break;
            case 6:
                real = "";
                QTextStream(&real) << real_with_symbol << numberSTR;
                return real;
                break;
         /* case 3:
            case 4:
            case 7:
            case 8:
            case 9:  */
        }
        return real_with_symbol;
    }

    QChar str()
    {
        numberSTR = "";
        QTextStream(&numberSTR) << "-12739234722.";
        return numberSTR[numberSTR.size()-1];
    }
};

#endif // CALC_H







