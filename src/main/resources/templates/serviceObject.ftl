package ${packageName};

import com.jy.platform.core.message.ResponseMsg;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.modules.util.AppException;


@Service
public class ${className}Service {

private Log logger = LogFactory.getLog(${className}Service.class);

@Autowired
private ${className}Interface ${className}Interface;

public Response${className}Param ${methodName}(Request${className}Param tRequest${className}Param, String reqUniqueCode) throws AppException{
ResponseBind${className}Param tResponse${className}Param = ${className}Interface.${methodName}(tRequest${className}Param, reqUniqueCode);
return tResponse${className}Param;
}