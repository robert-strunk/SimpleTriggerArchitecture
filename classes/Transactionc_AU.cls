/**
*
*   @description An example of an After Update implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_AU extends SimpleTriggerArchitecture {

    public override void execute(SimpleTriggerArchitecture.TriggerContext context){

        Map<Id, Transaction__c> newMap = (Map<Id, Transaction__c>)context.getNewMap();
    }
}