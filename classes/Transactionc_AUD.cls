/**
*
*   @description An example of an After Undelete implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_AUD implements SimpleTriggerArchitecture.Executable {

    public void execute(SimpleTriggerArchitecture.TriggerContext context){

        Map<Id, Transaction__c> newMap = (Map<Id, Transaction__c>)context.getNewMap();
    }
}
