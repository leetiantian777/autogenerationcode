package ${packageName};

import com.fintech.modules.base.Contants.InterfacNoConstant;
import com.fintech.modules.base.Contants.ReqStatusConstant;
import com.fintech.modules.base.Contants.RetCodeConstant;
import com.fintech.modules.base.message.ResponseMsg;
import com.fintech.modules.base.util.AppException;
import com.fintech.modules.base.util.MapUtils;
import com.fintech.modules.base.web.BaseResponse;
import com.fintech.modules.base.web.BaseService;
import com.fintech.modules.user.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
public class ${className}Impl extends BaseService implements ${className}Interface {

@Autowired
private RestTemplate restTemplate;

@Override
public Response${className} ${methodName}(Request${className} ${className2}Request, String reqUniqueCode) throws AppException {
Map<String, Object> stringObjectMap = MapUtils.beanToMap(${className2}DTO);
ParameterizedTypeReference<ResponseMsg<Response${className}>> typeReference
    = new ParameterizedTypeReference<ResponseMsg<Response${className}>>() {  };
        ResponseMsg<Response${className}> resultMsg = callOtherService(InterfacNoConstant.CR011, typeReference,stringObjectMap, reqUniqueCode);
            Response${className} responseParam = resultMsg.getResponseBody();
            if (responseParam==null) {
            throw new AppException(AppException.MSG_DEAL_1, resultMsg.getErrorDesc());
            }
            if (!RetCodeConstant.RET_CODE_SUCCESS.equals(resultMsg.getRetCode())) {
            throw new AppException(AppException.MSG_DEAL_1, resultMsg.getErrorDesc());
            }
            if (!ReqStatusConstant.CORE_SUCESS.equals(responseParam.getRspBizCode())) {
            String errormsg = responseParam.getRspBizMsg();
            throw new AppException(AppException.MSG_DEAL_1, errormsg);
            }
            return responseParam;
            }


            }
