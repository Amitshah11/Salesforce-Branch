public class Aura4Class {
@Auraenabled
    public static List<EntityDefinition> ObjectApiNames(){
        
        list<EntityDefinition> ApiName = [SELECT  QualifiedApiName FROM EntityDefinition order by QualifiedApiName];

        return ApiName;
    }
    @Auraenabled
    public static List<string> AllNameList(String ObjName){
        List<String> namelist= new List<String>();
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(ObjName);
Map<String, Schema.SObjectField> fieldMap = targetType.getDescribe().fields.getMap();
    for (Schema.SObjectField field : fieldMap.values()) {
                     namelist.add(field.getDescribe().getName());
     
        }
        return namelist;
    }
}