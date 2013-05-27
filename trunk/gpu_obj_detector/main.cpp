/*
 * main.cpp
 *
 *  Created on: Feb 15, 2013
 *      Author: olehp
 */

#include "Application.h"
#include "ImgMedia.h"
#include "WebCamMedia.h"


int main(int argv, char **args)
{
	ImgMedia media("../../data/judybats.jpg");
//	WebCamMedia media(640, 480);

	Application app(media, "../../data/haarcascade_frontalface_alt.xml");
	app.Run();

	return 0;

}
