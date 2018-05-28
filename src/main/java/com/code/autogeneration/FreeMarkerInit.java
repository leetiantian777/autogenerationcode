package com.code.autogeneration;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

import java.io.File;
import java.net.URL;

/**
 * Created by TianTianLi on 下午9:14 2018/5/21.
 */

public class FreeMarkerInit {
    private static FreeMarkerInit single= new FreeMarkerInit();;
    private FreeMarkerInit() {}
    //静态工厂方法
    public static FreeMarkerInit getInstance() {
        return single;
    }

    public Template getDefinedTemplate(String templateName) throws Exception{
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_22);
        String classpath = this.getClass().getResource("/").getPath().replaceFirst("/", "");
        String docRoot = classpath+ "templates";
        cfg.setDirectoryForTemplateLoading(new File(docRoot));
//        cfg.setDirectoryForTemplateLoading(new File("D:\\StuyWorkSpace\\autogenerationcode\autogenerationcode\src\\main\\resources\\templates"));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        return cfg.getTemplate(templateName);
    }
}
