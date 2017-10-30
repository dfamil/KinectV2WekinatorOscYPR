#pragma once

#include <iostream>
#include<string>
using namespace std;

class OSCSendMessage
{
public:
	OSCSendMessage();
	string jointMessage;
	float jointPosition;
	float jointPosition1;
	float jointPosition2;
	float jointPosition3;
	float jointPosition4;
	float jointPosition5;
	float jointPosition6;
	float jointPosition7;
	float jointPosition8;
	float jointPosition9;
	float jointPosition10;
	float jointPosition11;
	float jointPosition12;
	float jointPosition13;
	float jointPosition14;
	float jointPosition15;
	float jointPosition16;
	float jointPosition17;
	float currentLeftHandState;
	float currentRightHandState;
	
	string jointName;
	string jointName1;
	string jointName2;
	string jointName3;
	string jointName4;
	string jointName5;
	string jointName6;
	string jointName7;
	string jointName8;
	string jointName9;
	string jointName10;
	string jointName11;
	string jointName12;
	string jointName13;
	string jointName14;
	string jointName15;
	string jointName16;
	string jointName17;
	string rightStateName;
	string leftStateName;


	void setMesseageToSendData(string  jointMessage_, float jointPosition_, float jointPosition1_, float jointPosition2_,
		float jointPosition3_, float jointPosition4_, float jointPosition5_, float jointPosition6_, float jointPosition7_,
		float jointPosition8_, float jointPosition9_, float jointPosition10_, float jointPosition11_, float jointPosition12_,
		float jointPosition13_, float jointPosition14_, float jointPosition15_, float jointPosition16_, float jointPosition17_,
		float currentLeftHandState_, float currentRightHandState_);
	void setMesseageToSendNames(string  jointMessage_, string jointName_, string jointName1_, string jointName2_,
		string jointName3_, string jointName4_, string jointName5_, string jointName6_, string jointName7_,
		string jointName8_, string jointName9_, string jointName10_, string jointName11_, string jointName12_, 
		string jointName13_, string jointName14_, string jointName15_, string jointName16_, string jointName17_
		, string leftStateName_, string rightStateName_);
	string theMessage;
	string getMesseageToSendData();
	string getMesseageToSendNames();
	~OSCSendMessage();
	float Remap(float value, float from1, float to1, float from2, float to2) {
		return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
	}
private:
};