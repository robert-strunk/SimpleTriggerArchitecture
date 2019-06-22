/**
*
*   @author https://github.com/robert-strunk
*   @description Test class for SimpleTriggerArchitecture
*   @date 2019-06-22
*
* */
@IsTest
public with sharing class SimpleTriggerArchitecture_Test {

    static testMethod void inserts(){

        if(Type.forName('SimpleTriggerArchitecture') != null){
            insert(new Transaction__c());
        }
    }

    static testMethod void updates(){

        if(Type.forName('SimpleTriggerArchitecture') != null){
            insert(new Transaction__c());
            update [select Id from Transaction__c];
        }
    }

    static testMethod void deletes(){

        if(Type.forName('SimpleTriggerArchitecture') != null){
            insert(new Transaction__c());
            delete [select Id from Transaction__c];
        }
    }

    static testMethod void undeletes(){

        if(Type.forName('SimpleTriggerArchitecture') != null){
            insert(new Transaction__c());
            delete [select Id from Transaction__c];
            undelete [select id from Transaction__c Where isDeleted = true ALL ROWS];
        }
    }

    static testMethod void nonOverriddenVirtualExecute(){

        if(Type.forName('SimpleTriggerArchitecture') != null){
            SimpleTriggerArchitecture tmp = new SimpleTriggerArchitecture();
            tmp.execute(new SimpleTriggerArchitecture.TriggerContext(System.TriggerOperation.BEFORE_INSERT, new Account().getSobjectType()));
        }
    }
}