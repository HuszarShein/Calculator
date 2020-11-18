#include <math.h>
#include <QtMath>
#include "Trigonometry.h"

/*static*/ double d2r(double d)
{
  return (d / 180.0) * ((double) M_PI);
}

static double ctg(double x)
{
    return cosd(x)/sind(x);
}

double sind(double x)
{
    if (!isfinite(x))
      return sin(x);
    if (x < 0.0)
      return -sind(-x);
    int quo;
    double x90 = remquo(fabs(x), 90.0, &quo);
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
      return cos(x);
    if (x < 0.0)
      return -cosd(-x);
    int quo;
    double x90 = remquo(fabs(x), 90.0, &quo);
    switch (quo % 4)
    {
      case 0:
        return cos(d2r(x90)* 1.0);
      case 1:
        return -sin(d2r(x90));
      case 2:
        return cos(d2r(x90) * 1.0);
      case 3:
        return sin(d2r(x90));
    }
    return 0.0;
}

double tand(double x)
{
    if (!isfinite(x))
      return tan(x);
    if (x < 0.0)
      return -tand(-x);
    int quo;
    double x90 = remquo(fabs(x), 90.0, &quo);
    switch (quo % 4)
    {
      case 0:
        return tan(d2r(x90)* 1.0);
      case 1:
        if (x90 < 0)
            return ctg(-x90);
        else if (x90 > 0)
            return -ctg(x90);
        else
            return ctg(x90);
      case 2:
        if (x90 < 0)
            return tan(d2r(x90) * 1.0);
        else if (x90 > 0)
            return tan(d2r(x90) * 1.0);
        else
            return tan(d2r(x90) * 1.0);
      case 3:
        if (x90 < 0)
            return ctg(-x90);
        else if (x90 > 0)
            return -ctg(x90);
        else
            return ctg(x90);
    }
    return 0.0;
}

