package com.code.autogeneration;

import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by TianTianLi on 下午7:14 2018/5/21.
 */

public class CodeGeneration {
    public static  void AutoCodeGenerate() {

//        String jsonFilePath = "/Users/litiantian/Documents/jieyue-workdoc/testJson2.txt";
        try {
            BufferedReader filePathBuf = new BufferedReader(new InputStreamReader(System.in));
            System.out.println("请输入JSON格式的文本路径");
            String jsonFilePath = filePathBuf.readLine();
            StringBuffer bufferFile= new StringBuffer();
            Files.lines(Paths.get(jsonFilePath), StandardCharsets.UTF_8).forEach(line ->bufferFile.append(line));
            System.out.println(bufferFile.toString());
            JSONObject jsonObject = JSONObject.parseObject(bufferFile.toString());
            List<AttributeVO>reqattributes= new ArrayList<>();
            List<AttributeVO>resAttList= new ArrayList<>();
            //RequestBean
            Map<String,String> reqAttributes =(Map<String,String>)JSONObject.parse(jsonObject.get("reqAttributes").toString());
            reqAttributes.forEach((k,v)->reqattributes.add(new AttributeVO(k,v)));
            Map<String,String> resAttributes =(Map<String,String>)JSONObject.parse(jsonObject.get("resAttributes").toString());
            resAttributes.forEach((k,v)->resAttList.add(new AttributeVO(k,v)));
            Map<String,Object>ftlShowMap = new HashMap<>();
            ftlShowMap.put("fileDirectory",jsonObject.get("fileDirectory"));
            ftlShowMap.put("packageName",jsonObject.get("packageName"));
            ftlShowMap.put("className",jsonObject.get("className"));
            ftlShowMap.put("className2",strLowerCase(jsonObject.get("className").toString()));
            ftlShowMap.put("methodName",jsonObject.get("methodName"));
            Map<String,Object>reqShowMap = new HashMap<>();
            reqShowMap.putAll(ftlShowMap);
            reqShowMap.put("attributes",reqattributes);
            Map<String,Object>resShowMap = new HashMap<>();
            resShowMap.putAll(ftlShowMap);
            resShowMap.put("resAttrs",resAttList);
            File dir = new File(jsonObject.get("fileDirectory").toString());
            if(!dir.exists()){
                dir.mkdirs();
            }
            new Thread(new GenerationCodeThread(reqShowMap,"requestObject.ftl","Request"+jsonObject.get("className")+"Param",dir)).start();
            new Thread(new GenerationCodeThread(resShowMap,"responseObject.ftl","Response"+jsonObject.get("className")+"Param",dir)).start();
            new Thread(new GenerationCodeThread(ftlShowMap,"interfaceObject.ftl",jsonObject.get("className")+"Interface",dir)).start();
            if ("2".equals(jsonObject.get("version"))){
                new Thread(new GenerationCodeThread(ftlShowMap,"controllerObject2.ftl",jsonObject.get("className")+"Controller",dir)).start();
                new Thread(new GenerationCodeThread(ftlShowMap,"serviceImplObject2.ftl",jsonObject.get("className")+"ServiceImpl",dir)).start();
            }else {
                new Thread(new GenerationCodeThread(ftlShowMap,"controllerObject.ftl",jsonObject.get("className")+"Controller",dir)).start();
                new Thread(new GenerationCodeThread(ftlShowMap,"serviceObject.ftl",jsonObject.get("className")+"Service",dir)).start();
                new Thread(new GenerationCodeThread(ftlShowMap,"serviceImplObject.ftl",jsonObject.get("className")+"ServiceImpl",dir)).start();
            }


        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static String strLowerCase(String str){
        if(str!=null){
            char[] charArray = str.toCharArray();
            for(int i=0;i<str.length();i++){
                if(Character.isUpperCase(str.charAt(i)))
                    charArray[i]+=32;
            }
            return String.valueOf(charArray);
        }
        return str;
    }
}
