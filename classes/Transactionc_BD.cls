/**
*
*   @description An example of an Before Delete implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_BD extends SimpleTriggerArchitecture {

    public override void execute(SimpleTriggerArchitecture.TriggerContext context){

        Map<Id, Transaction__c> oldMap = (Map<Id, Transaction__c>)context.getOldMap();
    }
}