/*
 * BaseTest.h
 *
 *  Created on: Apr 20, 2013
 *      Author: olehp
 */

#ifndef BASETEST_H_
#define BASETEST_H_

#include <gtest/gtest.h>
#include <opencv2/opencv.hpp>


class MatTest: public ::testing::Test {
public:
	virtual void SetUp() {
		mat1x1 = cv::Mat_<int>(1, 1);
		mat3x3 = cv::Mat_<int>(3, 3);

		mat1x1(0, 0) = 3;

		int i = 0;
		for (int &iter : mat3x3)
			iter = (++i) * 2;
	}

	cv::Mat_<int> mat1x1;
	cv::Mat_<int> mat3x3;
};


#endif /* BASETEST_H_ */
