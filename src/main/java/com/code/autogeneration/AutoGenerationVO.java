package com.code.autogeneration;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by TianTianLi on 下午8:56 2018/5/21.
 */
public class AutoGenerationVO implements Serializable{
    private String packageName;
    private String className;
    private String fileDirectory;
    private List<Map<String,String >> reqAttributes;
    private List<Map<String,String >> resAttributes;
    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public List<Map<String, String>> getReqAttributes() {
        return reqAttributes;
    }

    public void setReqAttributes(List<Map<String, String>> reqAttributes) {
        this.reqAttributes = reqAttributes;
    }

    public List<Map<String, String>> getResAttributes() {
        return resAttributes;
    }

    public void setResAttributes(List<Map<String, String>> resAttributes) {
        this.resAttributes = resAttributes;
    }

    public String getFileDirectory() {
        return fileDirectory;
    }

    public void setFileDirectory(String fileDirectory) {
        this.fileDirectory = fileDirectory;
    }
}
