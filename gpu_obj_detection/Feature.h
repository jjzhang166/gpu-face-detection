/*
 * Feature.h
 *
 *  Created on: Feb 24, 2013
 *      Author: olehp
 */

#ifndef FEATURE_H_
#define FEATURE_H_


#include "Rect.h"

#include <opencv2/opencv.hpp>

#define HAAR_MAX_RECTS 3

class Feature {
public:
	Feature();
	Feature(int offset, WeightedRectangle r1, WeightedRectangle r2, WeightedRectangle r3 = WeightedRectangle());
	Feature(int offset,
			int x0, int y0, int w0, int h0, int wg0,
			int x1, int y1, int w1, int h1, int wg1,
			int x2 = 0, int y2 = 0, int w2 = 0, int h2 = 0, int wg2 = 0);

	float Eval(const cv::Mat_<float> &ii) const;

	void PrintInfo();
//	void write( FileStorage &fs ) const;

	WeightedRectangle rects[HAAR_MAX_RECTS];

	struct {
		int p0, p1, p2, p3;
	} rects_coords[HAAR_MAX_RECTS];

private:
	void InitFeature(int offset, WeightedRectangle r1, WeightedRectangle r2, WeightedRectangle r3);

};



#endif /* FEATURE_H_ */
