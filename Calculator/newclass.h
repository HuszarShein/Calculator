#ifndef NEWCLASS_H
#define NEWCLASS_H

#include <QObject>
#include <QTextStream>
#include <string>

class newClass : public QObject
{
     Q_OBJECT
public:
    newClass();
private:
    int num = 0, result = 0, sym = 0, last_sym = 0;
    bool is_num = true; bool is_sym = false; bool first = true;
    bool is_again = false;
    QString now, real, now_with_sym;
    //int sym;


    bool last_ravno = false;
    int r_num = 0;
public slots:
    void add_number(int a)
    {
        QString result;
        if (last_sym == 12)
        {
            result = "";
            QTextStream(&result) << num << ",e+";
            control_last_symbol();
        }
        else
        {
            num = (num * 10) + a;
            result = "";
            QTextStream(&result) << num;
        }
    }
    void control_last_symbol()
    {
        int last_symbol;
        QString real_with_lastSymbol;
        if (last_symbol == 0)
            exit(0);
        else if ((last_symbol == 1) || (last_symbol == 2) || (last_symbol == 3) || (last_symbol == 4))
        {
            QTextStream(&real) << num;
            switch (last_symbol){
            case 1:
                QTextStream(&real_with_lastSymbol) << " + ";
                break;
            case 2:
                QTextStream(&real_with_lastSymbol) << " - ";
                break;
            case 3:
                QTextStream(&real_with_lastSymbol) << " * ";
                break;
            case 4:
                QTextStream(&real_with_lastSymbol) << " / ";
                break;
            }
        }
    }
    void add(int a)
    {
        if((is_num == false) && (is_sym == true))
        {
            switch (sym) {
            case 1:
                QTextStream(&real) << " + ";
                first = false;
                break;
            case 2:
                QTextStream(&real) << " - ";
                first = false;
                break;
            case 3:
                QTextStream(&real) << " * ";
                first = false;
                break;
            case 4:
                QTextStream(&real) << " / ";
                first = false;
                break;
            }
            is_toched(true);
        }
        num = num * 10 + a;

        //QTextStream(&real) << num;
    }
    void is_toched(bool a)
    {
        if (a == true)
        {is_num = true; is_sym = false;}
        else
        {is_num = false; is_sym = true;}
    }
    int showTextInput2()
    {
        if (first == true)
        {
            result = num;
            //first = false;
            return num;
        }
            else
            return result;
    }
    int showReal_TextInput2()
    {
        return num;
    }
    QString add_sym(int a)
    {
//        if(last_ravno == true)
//        {
//            last_ravno = false;
//            num = r_num;
//            QTextStream(&real) << result << " +1 ";
//            switch (last_sym) {
//            case 1:
//                QTextStream(&real) << result << " + ";
//                break;
//            case 2:
//                QTextStream(&real) << result << " - ";
//                break;
//            case 3:
//                QTextStream(&real) << result << " * ";
//                break;
//            case 4:
//                QTextStream(&real) << result << " / ";
//                break;
//            }
//        }
        if ((is_num == true) && (is_sym == false) && (last_ravno == false))
        {
            now_with_sym = "";
        QTextStream(&real) << num;
        //is_toched(false);
        switch (a) {
            case 1:
                QTextStream(&now_with_sym) << real << " +2 ";
                r_num = num;
                num = 0;
                sym = 1;
                is_toched(false);
                return now_with_sym;
            case 2:
                QTextStream(&now_with_sym) << real << " - ";
                r_num = num;
                num = 0;
                sym = 2;
                is_toched(false);
                return now_with_sym;
            case 3:
                QTextStream(&now_with_sym) << real << " * ";
                r_num = num;
                num = 0;
                sym = 3;
                is_toched(false);
                return now_with_sym;
            case 4:
                QTextStream(&now_with_sym) << real << " / ";
                r_num = num;
                num = 0;
                sym = 4;
                is_toched(false);
                return now_with_sym;
            }
        }
        else if((is_num == false) && (is_sym == true) && (last_ravno == false))
        {
            now_with_sym = "";
            switch (a) {
                case 1:
                    QTextStream(&now_with_sym) << real << " +3 ";
                    sym = 1;
                    return now_with_sym;
                case 2:
                    QTextStream(&now_with_sym) << real << " - ";
                    sym = 2;
                    return now_with_sym;
                case 3:
                    QTextStream(&now_with_sym) << real << " * ";
                    sym = 3;
                    return now_with_sym;
                case 4:
                    QTextStream(&now_with_sym) << real << " / ";
                    sym = 4;
                    return now_with_sym;
            }
        }
        else if(last_ravno == true)
        {
            last_ravno = false;
            num = r_num;

            switch (last_sym) {
            case 1:
                QTextStream(&real) << result << " + ";
                return real;
            case 2:
                QTextStream(&real) << result << " - ";
                break;
            case 3:
                QTextStream(&real) << result << " * ";
                break;
            case 4:
                QTextStream(&real) << result << " / ";
                break;
            }
        }
    }
    void plus()
    {
        if (first == true)
        {
            first = false;
            result += num;
        }
        else
            result += num;
    }
    void minus()
    {
        if (first == true)
        {
            first = false;
            result += num;
        }
        else
            result -= num;
    }
    void umnozenie()
    {
        if (first == true)
        {
            first = false;
            result += num;
        }
        else if (num != 0)
            result *= num;
    }
    void delenie()
    {
        if (first == true)
        {
            first = false;
            result += num;
        }
        else if (num != 0)
            result /= num;
    }
    void set_last_symbol(int a)
    {
        last_sym = a;
    }
    void ravno()
    {
        last_ravno = true;
        switch (last_sym) {
        case 0:
        case 1:
            result += r_num;
            break;
        case 2:
            result -= r_num;
            break;
        case 3:
            result *= r_num;
            break;
        case 4:
            result /= r_num;
            break;
        }
    }
    void setData()
    {
        //r_num = num;
        sym = 0;
        is_num = true; is_sym = false; //first = true;
        is_again = false;
        now = ""; real = ""; now_with_sym = "";
    }
    int foo()
    {
        return result;
    }





    double sum(double a, double b)
    {
        return a + b;
    }
    QString plus1()
    {
        if (is_sym == false)
        {
            now_with_sym = "";
            sym = 1;
            QTextStream(&now_with_sym) << now << " + ";
            return now_with_sym;
        }
        else
        {

        }

    }
//    void equally()
//    {
//        s = "  ";
//    }
    QString show()
    {
        return now;
    }
//    QString sumer()
//    {
//        QTextStream(&s) << num1;
//        return s;
//    }
    };

#endif // NEWCLASS_H
