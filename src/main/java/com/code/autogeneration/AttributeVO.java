package com.code.autogeneration;

/**
 * Created by TianTianLi on 下午9:04 2018/5/21.
 */

public class AttributeVO {
    private String name;
    private String note;

    public AttributeVO(String name, String note) {
        this.name = name;
        this.note = note;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
