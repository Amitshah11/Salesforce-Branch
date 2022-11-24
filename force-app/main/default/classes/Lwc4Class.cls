public with sharing class Lwc4Class {


    @Auraenabled(cacheable=true)
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

    @Auraenabled
    public static string AllNameType(String objtype){
        string fielddataType;
    Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    Schema.SObjectType leadSchema = schemaMap.get(objType);
    Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
    
    for (String fieldName: fieldMap.keySet()) {
       fielddataType = string.valueOf(fieldMap.get(fieldName).getDescribe().getType());
    }
    return fielddataType;
    }
}