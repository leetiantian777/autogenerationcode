package ${packageName};
import com.jy.modules.common.Constants;
import com.jy.modules.common.interceptor.Authority;
import com.jy.modules.util.AppException;
import com.jy.platform.core.message.ResponseMsg;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;


@Controller
@RequestMapping(value = "")
@Api(description = "")
public class ${className}Controller extends BusinessController{
@Autowired
private ${className}Service ${className}Service;
@ResponseBody
@RequestMapping(value = "", method = {RequestMethod.POST})
@ApiOperation(value = "")
public Object ${methodName}( @ApiParam @RequestBody String reqJSON) throws Exception {
        Map<String, Object> reqParams = checkURLSafe(reqJSON, "queryCustomerBank/v2", AES_ENCRYPT_YES);
        boolean flag = (Boolean) reqParams.get("flag");
        String strJson = (String) reqParams.get("strJson");
        logger.info("queryCustomerBank/V2.requestJson:"+strJson);
        Object resObject;
        if (flag) {
        Request${className}Param request${className}Param = JSONObject.parseObject(strJson, Request${className}Param.class);
        ResponseMsg responseMsg  = checkParamIsNotNull(request${className}Param);
        if (null != responseMsg){
        makeupRetMsg(responseMsg, AES_ENCRYPT_YES);
        }
        try {
        resObject = ${className}Service.${methodName}(requestQueryCustomerBankCardParam, REQ_UNIQUE_CODE.get());
        }
        catch (AppException e) {
        resObject = dealAppException(e);
        }
        } else {
        resObject = JSONObject.parse(strJson);
        }
        Object resultObject = makeupRetMsg(resObject, AES_ENCRYPT_YES);
        return resultObject;

        }


}