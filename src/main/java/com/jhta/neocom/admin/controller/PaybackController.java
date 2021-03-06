package com.jhta.neocom.admin.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jhta.neocom.service.OrderCancelService;
import com.jhta.neocom.service.OrderMainService;
import com.jhta.neocom.service.PaymentService;

@RestController
public class PaybackController {
	 @Autowired
	    private OrderMainService service;
	 @Autowired
	    private PaymentService pservice;
	 @Autowired
	    private OrderCancelService odccservice;
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	public static final String KEY = "4587276137074224";
	public static final String SECRET = "be111e77389e311ded93023ebeff5996c5c9220069329b163e89a3f6a9727320c8e7648e0bddd55a";


	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} 
	
	// Map??? ???????????? Http?????? ??????????????? ????????? ?????? ?????? private

	List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	} 
	
	// ????????????: ????????????(??????)
	@RequestMapping(value ="/order/payback1", produces = { MediaType.APPLICATION_JSON_VALUE })
	public HashMap<String, Object> cancelPayment(@RequestParam Map<String, Object> param,String mid,
			int order_no,Date od_cc_complete_date) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		post.setHeader("Authorization", getImportToken());
		map.put("merchant_uid",mid);
		System.out.println(mid+ " ::???????????? ::" +order_no);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			System.out.println(enty+ "enty!!");
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
			System.out.println(rootNode.get("response")+" fffff");
		} catch (Exception e) {
			e.printStackTrace();
		}
		//order_main ????????? ????????????
		HashMap<String, Object> omUpdate = new HashMap<String, Object>();
		HashMap<String, Object> pmUpdate = new HashMap<String, Object>();
		HashMap<String, Object> odccUpdate = new HashMap<String, Object>();
		if (asd.equals("null")) {
			map2.put("code", "fail");
			System.out.println(od_cc_complete_date+"sss");
			System.err.println("????????????");
			return map2;
		} else {
			map2.put("code", "success");
			System.err.println("????????????");
			omUpdate.put("order_no", order_no);
			omUpdate.put("order_status","?????? ??????");
			omUpdate.put("payment_status","?????? ??????");
			omUpdate.put("od_cc_status","?????? ??????");
			pmUpdate.put("order_no", order_no);
			pmUpdate.put("payment_status","?????? ??????");
			odccUpdate.put("order_no", order_no);
			odccUpdate.put("od_cc_complete_date", od_cc_complete_date);
			System.out.println(od_cc_complete_date+"sss");
			odccUpdate.put("od_cc_status", "?????? ??????");
			service.update(omUpdate);
			pservice.update(pmUpdate);
			odccservice.updateODCC(odccUpdate);
			return map2;
		}
	} 
	
	// ????????????: ??????(??????)
		@RequestMapping(value ="/order/payback2", produces = { MediaType.APPLICATION_JSON_VALUE })
		public HashMap<String, Object> cancelPayment2(@RequestParam Map<String, Object> param,String mid,
				int order_no,Date od_cc_complete_date) {
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
			Map<String, String> map = new HashMap<String, String>();
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			post.setHeader("Authorization", getImportToken());
			map.put("merchant_uid",mid);
			System.out.println(mid+ " ::???????????? ::" +order_no);
			String asd = "";
			try {
				post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
				HttpResponse res = client.execute(post);
				ObjectMapper mapper = new ObjectMapper();
				String enty = EntityUtils.toString(res.getEntity());
				System.out.println(enty+ "enty!!");
				JsonNode rootNode = mapper.readTree(enty);
				asd = rootNode.get("response").asText();
				System.out.println(rootNode.get("response")+" fffff");
			} catch (Exception e) {
				e.printStackTrace();
			}
			//order_main ????????? ????????????
			HashMap<String, Object> omUpdate = new HashMap<String, Object>();
			HashMap<String, Object> pmUpdate = new HashMap<String, Object>();
			HashMap<String, Object> odccUpdate = new HashMap<String, Object>();
			if (asd.equals("null")) {
				map2.put("code", "fail");
				System.out.println(od_cc_complete_date+"sss");
				System.err.println("????????????");
				return map2;
			} else {
				map2.put("code", "success");
				System.err.println("????????????");
				omUpdate.put("order_no", order_no);
				omUpdate.put("order_status","?????? ??????");
				omUpdate.put("payment_status","?????? ??????");
				omUpdate.put("od_cc_status","?????? ??????");
				pmUpdate.put("order_no", order_no);
				pmUpdate.put("payment_status","?????? ??????");
				odccUpdate.put("order_no", order_no);
				odccUpdate.put("od_cc_complete_date", od_cc_complete_date);
				System.out.println(od_cc_complete_date+"sss");
				odccUpdate.put("od_cc_status", "?????? ??????");
				service.update(omUpdate);
				pservice.update(pmUpdate);
				odccservice.updateODCC(odccUpdate);
				return map2;
			}
		} 
	
	
	// ????????????

	public String getAmount(String token, String mId) {
		String amount = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mId + "/paid");
		get.setHeader("Authorization", token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			amount = resNode.get("amount").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return amount;
	} 
	
	// ????????????

	public void setHackCheck(String amount, String mId, String token) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String, String> m = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount);
		m.put("merchant_uid", mId);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
