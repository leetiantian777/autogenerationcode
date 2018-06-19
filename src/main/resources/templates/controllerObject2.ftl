package ${packageName};

import com.alibaba.fastjson.JSONObject;
import com.fintech.modules.base.message.ResponseMsg;
import com.fintech.modules.base.util.AppException;
import com.fintech.modules.base.web.BaseController;
import com.fintech.modules.base.web.BaseResponse;
import com.fintech.modules.sysconfig.controller.SysConfigController;
import com.fintech.modules.user.dto.UserDTO;
import com.fintech.modules.user.service.UserOperationInterface;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/")
public class ${className}Controller extends BaseController{
private static final Logger logger = LoggerFactory.getLogger(${className}Controller.class);
@Autowired
${className}Interface ${className2}Interface;


@ResponseBody
@RequestMapping(value="/${methodName}/v1", method= RequestMethod.POST)
@ApiOperation(value = "", notes = "",response=ResponseEntity.class)
public ResponseEntity<ResponseMsg<BaseResponse>> ${methodName}(@RequestBody Request${className} ${className2}Request) throws Exception {
    Map<String, Object> reqParams = checkURLSafe(JSONObject.toJSONString(${className}Request),${methodName}, AES_ENCRYPT_YES);
    Response${className} ${className2}Response=null;
    if ((Boolean) reqParams.get("flag")) {
    ResponseMsg<BaseResponse> responseMsg = checkParamIsNotNull(${className2}Request);
        if (null != responseMsg) {
        new ResponseEntity<ResponseMsg<Void>>((MultiValueMap<String, String>) responseMsg, HttpStatus.OK);
            }
            try {
                ${className2}Response = ${className2}Interface.createUser(${className2}Request, REQ_UNIQUE_CODE.get());
            } catch (AppException e) {
            throw new Exception(e);

            }
            }
            ResponseMsg<Response${className}> responseMsg = new ResponseMsg<Response${className}>();
                responseMsg.setResponseBody(baseResponse);
                ResponseEntity<ResponseMsg<Response${className}>> responseEntity=new ResponseEntity<ResponseMsg<Response${className}>>(responseMsg, HttpStatus.OK);
                    return responseEntity;
    }

}