/**
*
*   @description An example of an After Delete implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_AD extends SimpleTriggerArchitecture {

    public override void execute(SimpleTriggerArchitecture.TriggerContext context){

        Map<Id, Transaction__c> oldMap = (Map<Id, Transaction__c>)context.getOldMap();
        List<Transaction__c> oldList = (List<Transaction__c>)context.getOldList();
    }
}