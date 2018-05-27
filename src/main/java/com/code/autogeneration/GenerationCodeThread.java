package com.code.autogeneration;

import freemarker.template.Template;

import java.io.*;
import java.util.Map;

/**
 * Created by TianTianLi on 下午2:32 2018/5/27.
 */

public class GenerationCodeThread implements Runnable {
    private Map<String,Object> reqMap;
    private String ftlName;
    private String fileName;
    private File fileDirectory;

    public GenerationCodeThread(Map<String, Object> reqMap, String ftlName, String fileName, File fileDirectory) {
        this.reqMap = reqMap;
        this.ftlName = ftlName;
        this.fileName = fileName;
        this.fileDirectory = fileDirectory;
    }

    @Override
    public void run() {
        Template definedTemplate = null;
        try {
            definedTemplate = FreeMarkerInit.getInstance().getDefinedTemplate(ftlName);
            OutputStream fos = new FileOutputStream( new File(fileDirectory, fileName+".java")); //java文件的生成目录
            Writer out = new OutputStreamWriter(fos);
            definedTemplate.process(reqMap, out);
            fos.flush();
            fos.close();
            System.out.println(">>>>>>"+fileName+">>>>>"+"gen code success!");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
