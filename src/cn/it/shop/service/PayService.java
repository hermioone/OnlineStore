package cn.it.shop.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import cn.it.shop.model.BackData;
import cn.it.shop.model.SendData;

public interface PayService {

	public abstract void saveDataToRequest(
			HttpServletRequest request, SendData sendData);
	
	public boolean checkBackData(BackData backData);

}