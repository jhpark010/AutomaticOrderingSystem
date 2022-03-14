package com.aos.tray.agent;

import com.pi4j.wiringpi.Gpio;

public class LoadCell {
	private int sck;// = 16;
	private int dt;// = 20;
	private int gain;// = 24;
	private long zeroing;

	public LoadCell(int sck, int dt, int gain, long zeroing) {
		this.sck = sck;
		this.dt = dt;
		this.gain = gain;
		this.zeroing = zeroing;
	}
	
	public long getValue() {
		long value;
		long weight;
		
		Gpio.wiringPiSetupGpio();
		Gpio.pinMode(sck, Gpio.OUTPUT);
		Gpio.pinMode(dt, Gpio.INPUT);
		Gpio.digitalWrite(sck, Gpio.LOW);
		Gpio.digitalWrite(dt, Gpio.HIGH);

		while (Gpio.digitalRead(dt) == 1) {
		}
		
		long count = 0;
		for (int i = 0; i < gain; i++) {
			Gpio.digitalWrite(sck, Gpio.HIGH);
			count = count << 1;
			Gpio.digitalWrite(sck, Gpio.LOW);
			if (Gpio.digitalRead(dt) == 0) {
				count++;
			}
		}

		Gpio.digitalWrite(sck, Gpio.HIGH);
		count = count ^ 0x800000;
		Gpio.digitalWrite(sck, Gpio.LOW);
		value = count;
		
		weight = (long)((zeroing - value) * 0.0027);
		
		System.out.println("weight : " + weight);
		
		return weight;
	}
}
