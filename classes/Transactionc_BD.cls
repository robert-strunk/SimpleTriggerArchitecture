/**
*
*   @description An example of a Before Delete implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_BD implements SimpleTriggerArchitecture.Executable {

    public void execute(SimpleTriggerArchitecture.TriggerContext context){

        Map<Id, Transaction__c> oldMap = (Map<Id, Transaction__c>)context.getOldMap();
    }
}
