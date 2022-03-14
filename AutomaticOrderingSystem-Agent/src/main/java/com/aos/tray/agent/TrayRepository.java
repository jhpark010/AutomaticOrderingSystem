package com.aos.tray.agent;

public interface TrayRepository {
	public long getWeight(int trayNo, int sck, int dt, long zeroing) throws Exception;
	public String postWeight(int trayNo, double weight) throws Exception;
	public void setLight(int trayNo, boolean status) throws Exception;
}
