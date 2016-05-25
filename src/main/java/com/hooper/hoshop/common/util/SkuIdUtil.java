package com.hooper.hoshop.common.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 47123 on 2016/5/16.
 */
public class SkuIdUtil {

    public static final String GOODS_ID_KEY = "goodsId";
    public static final String ATTR_ID_KEY = "attrId";
    public static final String ATTR_ID_SECOND_KEY = "attrId1";

    /**
     * 生成SKUID
     *
     * @param attrId
     * @param attrId2 形如A12AA133的属性I
     * @return
     */
    public static String getSkuId(int attrId, int attrId2) {
        if (attrId != 0 && attrId2 != 0) {
            return "A" + attrId + "AA" + attrId2;
        } else {
            return null;
        }
    }

    /**
     * 生成SKUID
     *
     * @param attrId 形如A12的属性I
     * @return
     */
    public static String getSkuId(int attrId) {
        if (attrId != 0) {
            return "A" + attrId;
        } else {
            return null;
        }
    }

    public static Map<String, Integer> skuIdToMap(String skuId) {
        skuId = skuId.toUpperCase();
        String[] result = skuId.split("A");
        Map<String, Integer> resultMap = new HashMap<>();
        for (String str : result) {
            if (str.contains("G")) {
                str = str.replace("G", "");
                resultMap.put(GOODS_ID_KEY, Integer.valueOf(str));
            } else {
                if (!str.equals("")) {
                    boolean hasAttrIdKey = false;
                    for (String key : resultMap.keySet()) {
                        if (ATTR_ID_KEY.equals(key)) {
                            hasAttrIdKey = true;
                        }
                    }
                    if (!hasAttrIdKey) {
                        resultMap.put(ATTR_ID_KEY, Integer.valueOf(str));
                    } else {
                        resultMap.put(ATTR_ID_SECOND_KEY, Integer.valueOf(str));
                    }
                }
            }
        }
        return resultMap;
    }

    public static void main(String[] args) {
//        String s = "g12222a12aa9";
//        Map<String,Integer> result = SkuIdUtil.skuIdToMap(s);
//        for(String str:result.keySet()){
//            System.out.println(str+" :"+result.get(str));
//        }
//        String attrId = "A4";
//        System.out.println(SkuIdUtil.getSkuId(5,"a4"));
    }

    //    public static String getSkuId(int goodsId,String skuId){
//        if(goodsId != 0 && skuId != null){
//            return "G"+goodsId+skuId.toUpperCase();
//        }else{
//            return null;
//        }
//    }
//
//    public static String getSkuId(int goodsId,int attrId,int attrId2){
//        if(goodsId != 0 && attrId != 0 && attrId2 != 0){
//            return "G"+goodsId+"A"+attrId+"AA"+attrId2;
//        }else{
//            return null;
//        }
//    }
}
