package com.aos.requestorder;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.aos.handling.Handling;
import com.aos.handling.HandlingMapper;
import com.aos.ingredient.Ingredient;
import com.aos.ingredient.IngredientMapper;
import com.aos.supplier.Supplier;
import com.aos.supplier.SupplierMapper;
import com.aos.tray.Tray;
import com.aos.tray.TrayMapper;

@Service
public class RequestOrderServiceImpl implements RequestOrderService {
	@Autowired
	private TrayMapper trayMapper;
	
	@Autowired
	private HandlingMapper handlingMapper;
	
	@Autowired
	private IngredientMapper ingredientMapper;
	
	@Autowired
	private RequestOrderMapper requestOrderMapper;
	
	@Autowired
	private SupplierMapper supplierMapper;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Override
	public boolean registRequestOrderInfo(int trayNo, double weight) {
		boolean status = false;

		Properties pro = new Properties();
		try {
			File upperDir = new File("src\\main\\resources" + File.separator + "income.properties");
			pro.load(new FileInputStream(upperDir.getAbsoluteFile()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		pro.setProperty(trayNo+".tray.weight", String.valueOf(weight));
		try {
			Tray tray = new Tray();
			tray.setNo(String.valueOf(trayNo));
			tray = trayMapper.select(tray);
			

			Handling handling = new Handling();
			handling.setIngredientNo(tray.getIngredientNo());
			handling.setStatus("Y");

			handling = handlingMapper.select(handling);

			Ingredient ingredient = new Ingredient();
			ingredient.setNo(tray.getIngredientNo());

			ingredient = ingredientMapper.select(ingredient);

			RequestOrder requestOrder = new RequestOrder();
			requestOrder.setIngredientNo(tray.getIngredientNo());
			requestOrder.setSupplierNo(handling.getSupplierNo());
			requestOrder.setStatus("O");
			
			//weight(측정된 값)에서 tray.getZeroValue(영점값) 뺀 값을 tray.getOrderWeight(발주무게)와 비교
			
			if (weight < Double.parseDouble(tray.getOrderWeight())) {
				if (requestOrderMapper.select(requestOrder) == null) {
					requestOrder.setOrderAmount(tray.getOrderAmount());
					String orderPrice = String.valueOf(Integer.parseInt(tray.getOrderAmount()) * Integer.parseInt(ingredient.getUnitPrice()));
					requestOrder.setOrderPrice(orderPrice);

					requestOrderMapper.insert(requestOrder);
					requestOrder = requestOrderMapper.select(requestOrder);

					Supplier supplier = new Supplier();
					supplier.setNo(handling.getSupplierNo());

					supplier = supplierMapper.select(supplier);
					sendRequestOrderInfo(requestOrder, supplier, ingredient);
				}
				status = true;
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}

		pro.setProperty(trayNo+".tray.status", String.valueOf(status));
		
		try {
			File upperDir = new File("src\\main\\resources" + File.separator + "income.properties");
			pro.store(new FileOutputStream(upperDir.getAbsoluteFile()), "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	@Override
	public void editRequestOrderInfo(String date) {
		RequestOrder requestOrder = new RequestOrder();
		requestOrder.setOrderDate(date);
		try {
			requestOrder = requestOrderMapper.select(requestOrder);
			requestOrder.setStatus("C");
			requestOrderMapper.update(requestOrder);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public RequestOrderInfo viewRequestOrder(RequestOrder requestOrder) {
		RequestOrder result = null;
		RequestOrderInfo requestOrderInfo = null;
		try {
			result = requestOrderMapper.select(requestOrder);
			Supplier supplier = new Supplier();
			supplier.setNo(result.getSupplierNo());
			Supplier containSupplierName = supplierMapper.select(supplier);

			Ingredient ingredient = new Ingredient();
			ingredient.setNo(result.getIngredientNo());
			Ingredient containIngredientName = ingredientMapper.select(ingredient);
			
			requestOrderInfo = new RequestOrderInfo();
			requestOrderInfo.setOrderDate(result.getOrderDate());
			requestOrderInfo.setSupplierName(containSupplierName.getName());
			requestOrderInfo.setIngredientName(containIngredientName.getName());
			requestOrderInfo.setOrderAmount(result.getOrderAmount());
			requestOrderInfo.setOrderPrice(result.getOrderPrice());
			requestOrderInfo.setZipCode(containSupplierName.getZipCode());
			requestOrderInfo.setAddress(containSupplierName.getAddress());
			requestOrderInfo.setDetailAddress(containSupplierName.getDetailAddress());
			requestOrderInfo.setEmail(containSupplierName.getEmail());
			requestOrderInfo.setPhoneNo(containSupplierName.getPhoneNo());
			requestOrderInfo.setUnitPrice(containIngredientName.getUnitPrice());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestOrderInfo;
	}

	@Override
	public List<RequestOrderInfo> requestOrderList() {
		List<RequestOrder> requestOrderList = null;
		List<RequestOrderInfo> resultList = null;
		RequestOrderInfo requestOrderInfo = null;
		String ingredientNo = null;
		try {
			resultList = new ArrayList<RequestOrderInfo>();
			requestOrderList = requestOrderMapper.list(new RequestOrder());
			for (int i = 0; i < requestOrderList.size(); i++) {
				String supplierNo = requestOrderList.get(i).getSupplierNo();
				ingredientNo = requestOrderList.get(i).getIngredientNo();
				
				Supplier supplier = new Supplier();
				supplier.setNo(supplierNo);
				Supplier resultbySupplierNo = supplierMapper.select(supplier);
				
				Ingredient ingredient = new Ingredient();
				ingredient.setNo(ingredientNo);
				Ingredient resultbyIngredientNo = ingredientMapper.select(ingredient);
				
				requestOrderInfo = new RequestOrderInfo();
				requestOrderInfo.setOrderDate(requestOrderList.get(i).getOrderDate());
				requestOrderInfo.setStatus(requestOrderList.get(i).getStatus());
				requestOrderInfo.setSupplierName(resultbySupplierNo.getName());
				requestOrderInfo.setIngredientName(resultbyIngredientNo.getName());
				resultList.add(requestOrderInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	@Override
	public List<RequestOrderInfo> searchRequestOrder(String date) {
		RequestOrder requestOrder = new RequestOrder();
		requestOrder.setOrderDate(date);
		List<RequestOrder> result = null;
		List<RequestOrderInfo> resultList = new ArrayList<RequestOrderInfo>();
		RequestOrderInfo requestOrderInfo = null;
		
		try {
			
			if (date.trim().isEmpty()) {
				result = requestOrderMapper.list(new RequestOrder());
			} else {
				result = requestOrderMapper.searchByDate(requestOrder);
			}
			
			if (result != null) {
				for (int i = 0; i < result.size(); i++) {
					String supplierNo = result.get(i).getSupplierNo();
					String ingredientNo = result.get(i).getIngredientNo();
					
					Supplier supplier = new Supplier();
					supplier.setNo(supplierNo);
					Supplier resultbySupplierNo = supplierMapper.select(supplier);
					
					Ingredient ingredient = new Ingredient();
					ingredient.setNo(ingredientNo);
					Ingredient resultbyIngredientNo = ingredientMapper.select(ingredient);
					
					requestOrderInfo = new RequestOrderInfo();
					requestOrderInfo.setOrderDate(result.get(i).getOrderDate());
					requestOrderInfo.setSupplierName(resultbySupplierNo.getName());
					requestOrderInfo.setIngredientName(resultbyIngredientNo.getName());
					
					resultList.add(requestOrderInfo);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	@Override
	public void sendRequestOrderInfo(RequestOrder requestOrder, Supplier supplier, Ingredient ingredient) {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				StoreInfo store = new StoreInfo();
				Properties props = new Properties();
				File propsDir = new File("src\\main\\resources" + File.separator + "application.properties");
				try {
					props.load(new FileInputStream(propsDir.getAbsoluteFile()));
					store.setName(new String(props.getProperty("store.name").getBytes("ISO-8859-1"), "utf-8"));
					store.setEmail(new String(props.getProperty("store.email").getBytes("ISO-8859-1"), "utf-8"));
					store.setPhoneNo(new String(props.getProperty("store.phoneNo").getBytes("ISO-8859-1"), "utf-8"));
					store.setZipCode(new String(props.getProperty("store.zipCode").getBytes("ISO-8859-1"), "utf-8"));
					store.setAddress(new String(props.getProperty("store.address").getBytes("ISO-8859-1"), "utf-8"));
					store.setDetailAddress(new String(props.getProperty("store.detailAddress").getBytes("ISO-8859-1"), "utf-8"));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("restaurant");
				helper.setTo("qkrwngussample@gmail.com"); //원래는 supplier.getEmail() 
				helper.setSubject("This is a Order List");
				helper.setText("<table\r\n"
						+ "		style=\"border-collapse: collapse; border-spacing: 0; table-layout: fixed; width: 621px\"\r\n"
						+ "		class=\"tg\">\r\n"
						+ "		<thead>\r\n"
						+ "			<tr>\r\n"
						+ "				<th\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; font-weight: normal; overflow: hidden; padding: 10px 5px; text-align: center; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"8\">발주서</th>\r\n"
						+ "			</tr>\r\n"
						+ "		</thead>\r\n"
						+ "		<tbody>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: center; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"4\">거래처</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: center; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"4\">발주처</td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">상호</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">"+ supplier.getName() +"</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">상호</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">" + store.getName() + "</td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">주소</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">(" + supplier.getZipCode() + ")" + supplier.getAddress() + " " + supplier.getDetailAddress() +"</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">주소</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">(" + store.getZipCode() + ")" + store.getAddress() + " " + store.getDetailAddress() + "</td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">연락처</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">" + supplier.getPhoneNo() + "</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">연락처</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">" + store.getPhoneNo() + "</td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">이메일</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">" + supplier.getEmail() + "</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">이메일</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">" + store.getEmail() + "</td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: center; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"8\">※ 다음과 같이 발주합니다.</td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">No.</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"2\">품목</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">발주\r\n"
						+ "					수량(EA)</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"2\">단위 가격(원)</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"2\">합계(원)</td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">1</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"2\">" + ingredient.getName() + "</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">" + requestOrder.getOrderAmount() + "</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"2\">" + ingredient.getUnitPrice() + "</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"2\">" + requestOrder.getOrderPrice() + "</td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"8\"></td>\r\n"
						+ "			</tr>\r\n"
						+ "			<tr>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">발주 일시</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">" + requestOrder.getOrderDate() + "</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\">합계(원)</td>\r\n"
						+ "				<td\r\n"
						+ "					style=\"border-color: inherit; border-style: solid; border-width: 1px; font-family: Arial, sans-serif; font-size: 14px; overflow: hidden; padding: 10px 5px; text-align: left; vertical-align: top; word-break: normal\"\r\n"
						+ "					colspan=\"3\">" + requestOrder.getOrderPrice() + "</td>\r\n"
						+ "			</tr>\r\n"
						+ "		</tbody>\r\n"
						+ "	</table>", true);
			}
		};
		mailSender.send(preparator);
	}

	@Override
	public StoreInfo getStoreInfo() {
		StoreInfo store = new StoreInfo();
		Properties props = new Properties();
		File propsDir = new File("src\\main\\resources" + File.separator + "application.properties");
		try {
			props.load(new FileInputStream(propsDir.getAbsoluteFile()));
			store.setName(new String(props.getProperty("store.name").getBytes("ISO-8859-1"), "utf-8"));
			store.setEmail(new String(props.getProperty("store.email").getBytes("ISO-8859-1"), "utf-8"));
			store.setPhoneNo(new String(props.getProperty("store.phoneNo").getBytes("ISO-8859-1"), "utf-8"));
			store.setZipCode(new String(props.getProperty("store.zipCode").getBytes("ISO-8859-1"), "utf-8"));
			store.setAddress(new String(props.getProperty("store.address").getBytes("ISO-8859-1"), "utf-8"));
			store.setDetailAddress(new String(props.getProperty("store.detailAddress").getBytes("ISO-8859-1"), "utf-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return store;
	}
}
