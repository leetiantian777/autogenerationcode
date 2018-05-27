package com.code.autogeneration;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

import java.io.File;

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
        cfg.setDirectoryForTemplateLoading(new File("/Users/litiantian/Documents/study/study_workspace/autogeneration/src/main/resources/templates"));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        return cfg.getTemplate(templateName);
    }
}
