package ${packageName};

import com.fasterxml.jackson.core.type.TypeReference;
import com.jy.modules.app.rest.service.LCService;
import com.jy.modules.common.Constants;
import com.jy.modules.util.AESUtils;
import com.jy.modules.util.AppException;
import com.jy.modules.util.MapUtils;
import com.jy.platform.core.message.ResponseMsg;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ${className}Impl extends LCService implements ${className}Interface {

@Override
public Response${className}Param ${methodName}(Request${className}Param request${className}Param, String reqUniqueCode) throws AppException {
Map<String, Object> param = getHeaderMap(Constants.InterfaceNo.INTERFACE_NO_AC017,Constants.SysSource.SYS_SOURCE_XQ_WAP_V2);
Map<String, Object> stringObjectMap = MapUtils.beanToMap(request${className}Param);
param.putAll(stringObjectMap);
TypeReference<ResponseMsg<Response${className}Param>> typeReference = new TypeReference<ResponseMsg<Response${className}Param>>() {};
    ResponseMsg<ResponseBankAccountLimitTheQuery> regResultMsg = getLCServiceV2(Constants.InterfaceNo.INTERFACE_NO_AC017,typeReference, param, reqUniqueCode);
        Response${className}Paran response${className}Param = regResultMsg.getResponseBody();
        if (!Constants.RetCode.RET_CODE_SUCCESS.equals(regResultMsg.getRetCode())) {
        throw new AppException(AppException.MSG_DEAL_1, regResultMsg.getErrorDesc());
        }
        if (responseBankAccountLimitTheQuery==null) {
        throw new AppException(AppException.MSG_DEAL_1, regResultMsg.getErrorDesc());
        }
        if (!Constants.ReqStatus.CORE_SUCESS.equals(responseBankAccountLimitTheQuery.getRetCode())) {
        String errormsg = responseBankAccountLimitTheQuery.getRetMsg();

        throw new AppException(AppException.MSG_DEAL_1, errormsg);
        }
        return responseBankAccountLimitTheQuery;
        }