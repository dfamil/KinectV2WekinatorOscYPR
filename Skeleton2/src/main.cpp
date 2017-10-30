#include <iostream>
#include <sstream>
#include "OSCSendMessage.h"
#include "app.h"




#define OUTPUT_BUFFER_SIZE 1024

int main( int argc, char* argv[] )
{
	OSCSendMessage message1;
	string oscMessages = "/wekinator/control/setInputNames";
	message1.setMesseageToSendNames(oscMessages,
		"HandLeftX", "HandLeftY", "HandLeftZ",
		"HandRightX", "HandRightY","HandRightZ",
		"NeckX", "NeckY", "NeckZ",
		"HandLeftYaw", "HandLeftPitch", "HandLeftRoll",
		"HandRightYaw", "HandRightPitch", "HandRightRoll",
		"NeckYaw", "NeckPitch", "NeckRoll",
		"HandRightState", "HandLeftState");

    try{

        Kinect kinect;
        kinect.run();
    } catch( std::exception& ex ){
        std::cout << ex.what() << std::endl;
    }

    return 0;
}