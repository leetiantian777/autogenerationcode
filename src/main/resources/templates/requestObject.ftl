package ${packageName};
public class Request${className} {

    <#list attributes as attribute>
         /***${attribute.note}**/
        private String ${attribute.name};
    </#list>

    <#list attributes as attribute>
        public void set${attribute.name?cap_first}(String ${attribute.name?cap_first}){
        this.${attribute.name} = ${attribute.name};
    }
        public String get${attribute.name?cap_first}(){
        return this.${attribute.name};
    }

</#list>
}