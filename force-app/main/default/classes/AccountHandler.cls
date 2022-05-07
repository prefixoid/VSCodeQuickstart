public without sharing class AccountHandler implements TriggerTemplate.Handler {
    private List<Account> newValues;
    private Map<Id, Account> oldValues;

    public void setValues(List<sObject> newValues, Map<Id, sObject> oldValues)
    {
        this.newValues = newValues;
        this.oldValues = (Map<Id, Account>) oldValues;
    }

    public void handle(TriggerTemplate.TriggerAction action)
    {
        if (action == TriggerTemplate.TriggerAction.beforeInsert)
        {
            AccountService.setFieldValuesBeforeInsert(newValues);
        }
    }
}
