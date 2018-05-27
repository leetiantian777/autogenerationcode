package ${packageName};
public class Response${className}Param extends ResponseCommonParam{

    <#list resAttrs as attribute>
         /***${attribute.note}**/
        private String ${attribute.name};
    </#list>

    <#list resAttrs as attribute>
        public void set${attribute.name?cap_first}(String ${attribute.name?cap_first}){
        this.${attribute.name} = ${attribute.name};
    }
        public String get${attribute.name?cap_first}(){
        return this.${attribute.name};
    }

</#list>
}