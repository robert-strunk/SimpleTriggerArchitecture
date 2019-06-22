/**
*
*   @description An example of an Before Insert implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_BI extends SimpleTriggerArchitecture {

    public override void execute(SimpleTriggerArchitecture.TriggerContext context){

        List<Transaction__c> newList = (List<Transaction__c>)context.getNewList();
    }
}