/**
*
*   @description An example of an After Delete implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_AD implements SimpleTriggerArchitecture.Executable {

    public void execute(SimpleTriggerArchitecture.TriggerContext context){

        Map<Id, Transaction__c> oldMap = (Map<Id, Transaction__c>)context.getOldMap();
    }
}
