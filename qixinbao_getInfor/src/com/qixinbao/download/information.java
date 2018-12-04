package com.qixinbao.download;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.qixinbao_getinfor.Moreinfor;
import com.qixinbao.network.SendNearbyftoservlet;

public class information {

	public static boolean ifhasNext(String resp) {
		boolean hasNextPage = true;
		JSONObject json = JSONObject.parseObject(resp);		
		if (json.containsKey("message") && json.getString("message").equals("操作成功") && json.containsKey("status")
				&& json.getString("status").equals("1")) {
			if (json.containsKey("data")) {
				JSONObject data = json.getJSONObject("data");
				if (!data.isEmpty()) {
					if (data.containsKey("hasNextPage")) {
						hasNextPage = data.getBoolean("hasNextPage");
					}
				}
			}
		}
		
		return hasNextPage;

	}

	public static String getinformation(String resp,String rlon,String rlat,String city,String province) {
		Nearbybean n = new Nearbybean();
		String str = "null";
		JSONObject json = JSONObject.parseObject(resp);
		if (json.containsKey("message") && json.getString("message").equals("操作成功") && json.containsKey("status")
				&& json.getString("status").equals("1")) {

			if (json.containsKey("data")) {
				JSONObject data = json.getJSONObject("data");
				if (!data.isEmpty()) {
					if (data.containsKey("items")) {
						JSONArray items = data.getJSONArray("items");
						if (!items.isEmpty()) {

							for (int i = 0; i < items.size(); i++) {
								JSONObject ite = items.getJSONObject(i);
								if (ite.containsKey("address")) {
									n.setAddress(ite.getString("address").trim());
								}
								if (ite.containsKey("credit_no")) {
									n.setCredit_no(ite.getString("credit_no").trim());
								}
								if (ite.containsKey("distance")) {
									n.setDistance(ite.getString("distance").trim());
								}
								if (ite.containsKey("domain")) {
									n.setDomain(ite.getString("domain").trim());
								}
								if (ite.containsKey("id")) {
									n.setId(ite.getString("id").trim());
								}
								if (ite.containsKey("latitude")) {
									n.setLatitude(ite.getString("latitude").trim());
								}
								if (ite.containsKey("longitude")) {
									n.setLongitude(ite.getString("longitude").trim());
								}
								if (ite.containsKey("name")) {
									n.setName(ite.getString("name").trim());
								}
								if (ite.containsKey("oper_name")) {
									n.setOper_name(ite.getString("oper_name").trim());
								}
								if (ite.containsKey("org_no")) {
									n.setOrg_no(ite.getString("org_no").trim());
								}
								if (ite.containsKey("reg_capi")) {
									n.setReg_capi(ite.getString("reg_capi").trim());
								}
								if (ite.containsKey("reg_no")) {
									n.setReg_no(ite.getString("reg_no").trim());
								}
								if (ite.containsKey("start_date")) {
									n.setStart_date(ite.getString("start_date").trim());
								}
								if (ite.containsKey("status")) {
									n.setStatus(ite.getString("status").trim());
								}
								if (ite.containsKey("tags")) {
									JSONArray tags = ite.getJSONArray("tags");
									if (!tags.isEmpty()) {
										for (int j = 0; j < tags.size(); j++) {
											JSONObject ta = tags.getJSONObject(j);
											if (ta.containsKey("tag")) {
												n.setTag(ta.getString("tag").trim());
											}
										}
									}

								}
								//获取详细信息
								Moreinfor.getDta(n.getId(),rlon,rlat,city,province);
								
//								JSONObject tjo = new JSONObject();
//								tjo.put("address", n.getAddress());
//								tjo.put("credit_no", n.getCredit_no());
//								tjo.put("distance", n.getDistance());
//								tjo.put("domain", n.getDomain());
//								tjo.put("id", n.getId());
//								tjo.put("latitude", n.getLatitude());
//								tjo.put("longitude", n.getLongitude());
//								tjo.put("name", n.getName());
//								tjo.put("oper_name", n.getOper_name());
//								tjo.put("org_no", n.getOrg_no());
//								tjo.put("reg_capi", n.getReg_capi());
//								tjo.put("reg_no", n.getReg_no());
//								tjo.put("start_date", n.getStart_date());
//								tjo.put("status", n.getStatus());
//								tjo.put("tag", n.getTag());
//								tjo.put("rlon", rlon);
//								tjo.put("rlat", rlat);
//								tjo.put("city", city);
//								tjo.put("province", province);
//								SendNearbyftoservlet.sendPost(tjo.toString());
								str = n.toString();
							}

						}
					}
				}
				
			}

		}

		return str;
	}

}
