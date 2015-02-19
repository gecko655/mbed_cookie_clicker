/*
 * tippy.h
 *
 *  Created on: 2015/02/19
 *      Author: akihiro
 */

#include "C12832.h"

#ifndef TIPPY_H_
#define TIPPY_H_




static char TippyArray[] = {
        0b00000111,0b11111011,0b00000000,
        0b00011101,0b00011111,0b00000000,
        0b00110110,0b10000111,0b00000000,
        0b01100110,0b00000011,0b00000000,
        0b01000000,0b00000001,0b10000000,
        0b10000000,0b01001001,0b10000000,
        0b10000000,0b00000000,0b10000000,
        0b10000000,0b00010000,0b10000000,
        0b11000000,0b00101000,0b10000000,
        0b11100000,0b00000001,0b10000000,
        0b01111111,0b11111111,0b00000000,
        0b00111111,0b11111110,0b00000000,
};

Bitmap tippyBmp = {
  17, // XSize
  12, // YSize
  3, // Bytes in Line
  TippyArray,  // Pointer to picture data
};

#endif /* TIPPY_H_ */
