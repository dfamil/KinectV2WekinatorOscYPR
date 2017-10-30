/**
 * oscP5message by andreas schlegel
 * example shows how to create osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float leftHandX, leftHandY, leftHandZ, leftHandState, prevLeftHandX, prevLeftHandY, prevLeftHandZ = 0;
float x, y, z;
void setup() {
  size(1000, 500, P3D);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 6448);
  leftHandX = 0;
  leftHandY = 0;
  leftHandZ = 0;
  prevLeftHandX = 0;
  prevLeftHandY = 0;
  prevLeftHandZ = 0;
  leftHandState = 0;
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   "192.168.1.222"
   */
  myRemoteLocation = new NetAddress("192.168.1.28", 5002);
}


void draw() {
  background(0); 
  //println(leftHandState);
  //println(" X =" + max(leftHandX, prevLeftHandX));
  // println(" Y =" + min(leftHandY, prevLeftHandY));
  //println(" Z =" + min(leftHandZ, prevLeftHandZ));


  x = map(leftHandX, .460, -0.5128, 500.0, 0.0);
  y= map(leftHandY, .440, -0.440, 0.0, 500.0);
  z= map(leftHandZ, .60, 1.4, 0.0, 40.0);


  println(" z =" +z);

  prevLeftHandX = leftHandX;
  prevLeftHandY = leftHandY;
  prevLeftHandZ = leftHandZ;

  if (leftHandState==0) {
    fill(255, 0, 0);
  } else if (leftHandState==1) {
    fill(0, 255, 0);
  } else if (leftHandState==2) {
    fill(0, 0, 255);
  }


  ellipse(x, y, z, z);
}
void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  println("mousePressed");
  OscMessage myMessage = new OscMessage("/test");

  myMessage.add(123); /* add an int to the osc message */
  myMessage.add(12.34); /* add a float to the osc message */
  myMessage.add("some text"); /* add a string to the osc message */
  myMessage.add(new byte[] {0x00, 0x01, 0x10, 0x20}); /* add a byte blob to the osc message */
  myMessage.add(new int[] {1, 2, 3, 4}); /* add an int array to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  // print(" addpattern: "+theOscMessage.addrPattern());
  // println(" typetag: "+theOscMessage.typetag());
  // print(" HandLeftX: "+theOscMessage.get(0).floatValue());
  // print(" HandLeftY: "+theOscMessage.get(1).floatValue());
  // print(" HandLeftZ: "+theOscMessage.get(2).floatValue());
  //print(" HandRightX: "+theOscMessage.get(3).floatValue());
  //print(" HandRightY: "+theOscMessage.get(4).floatValue());
  //print(" HandRightZ: "+theOscMessage.get(5).floatValue());
  //print(" NeckX: "+theOscMessage.get(6).floatValue());
  //print(" NeckY: "+theOscMessage.get(7).floatValue());
  //print(" NeckZ: "+theOscMessage.get(8).floatValue());
  //print(" HandLeftYaw: "+theOscMessage.get(9).floatValue());
  //print(" HandLeftPitch: "+theOscMessage.get(10).floatValue());
  //print(" HandLeftRoll: "+theOscMessage.get(11).floatValue());
  //print(" HandRightYaw: "+theOscMessage.get(12).floatValue());
  //print(" HandRightPitch: "+theOscMessage.get(13).floatValue());
  //print(" HandRightRoll: "+theOscMessage.get(14).floatValue());
  //print(" NeckYaw: "+theOscMessage.get(15).floatValue());
  //print(" NeckPitch: "+theOscMessage.get(16).floatValue());
  //print(" NeckRoll: "+theOscMessage.get(17).floatValue());
  //print(" HandRightState: "+theOscMessage.get(18).floatValue());
  //println(" HandLeftState: "+theOscMessage.get(19).floatValue());
  leftHandX = theOscMessage.get(0).floatValue();
  leftHandY = theOscMessage.get(1).floatValue();
  leftHandZ = theOscMessage.get(2).floatValue();
  leftHandState = theOscMessage.get(19).floatValue();
}