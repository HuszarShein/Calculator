//#include <stdio.h>
#include <math.h>
#include <QtMath>
//#include <calc.h>
#include "Trigonometry.h"

static double d2r(double d)
{
  return (d / 180.0) * ((double) M_PI);
}

double sind(double x)
{
    if (!isfinite(x))
      return sin(x);
    if (x < 0.0)
      return -sind(-x);
    int quo;
    double x90 = remquo(fabs(x), 90.0, &quo);
    //a = x90; b = quo;
    switch (quo % 4)
    {
      case 0:
        return sin(d2r(x90)* 1.0);
      case 1:
        return cos(d2r(x90));
      case 2:
        return sin(d2r(-x90) * 1.0);
      case 3:
        return -cos(d2r(x90));
    }
    return 0.0;
}

double cosd(double x)
{
    if (!isfinite(x))
      return sin(x);
    if (x < 0.0)
      return -sind(-x);
    int quo;
    double x90 = remquo(fabs(x), 90.0, &quo);
    //a = x90; b = quo;
    switch (quo % 4)
    {
      case 0:
        return cos(d2r(x90)* 1.0);
      case 1:
        return sin(d2r(x90));//-
      case 2:
        return cos(d2r(-x90) * 1.0);//-
      case 3:
        return -sin(d2r(x90));//+
    }
    return 0.0;
}

