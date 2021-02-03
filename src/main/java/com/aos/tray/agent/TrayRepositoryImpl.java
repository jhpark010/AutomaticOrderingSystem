package com.aos.tray.agent;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.pi4j.io.gpio.GpioController;
import com.pi4j.io.gpio.GpioFactory;
import com.pi4j.io.gpio.GpioPinDigitalOutput;
import com.pi4j.io.gpio.RaspiPin;

import okhttp3.FormBody;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Repository
public class TrayRepositoryImpl implements TrayRepository {
	public static final MediaType MEDIA_TYPE_HTML = MediaType.get("tex/html; charset=utf-8");
	
	@Value("${server.url}")
	String url;

	@Override
	public long getWeight(int trayNo, int sck, int dt, long zeroing) {
		LoadCell cell = new LoadCell(sck, dt, 24, zeroing);
		
		long weight = cell.getValue();
		
		if (weight <= 0) {
			weight = 0;
		}
		
		return weight;
	}

	@Override
	public String postWeight(int trayNo, double weight) throws Exception {
		RequestBody body = new FormBody.Builder()
				.add("trayNo", trayNo + "")
				.add("weight", weight + "")
				.build();

		Request request = new Request.Builder().url(url).post(body).build();
		try (Response response = new OkHttpClient()
				.newCall(request)
				.execute()) {
			return response.body().string();
		}
	}

	@Override
	public void setLight(int trayNo, boolean status) throws InterruptedException {
		LedControl control = new LedControl();
		
		if (status) {
			control.ledOn();
		} else {
			control.ledOff();
		}
	}
}
