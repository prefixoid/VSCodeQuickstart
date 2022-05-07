trigger HelloWordTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    TriggerTemplate.TriggerManager triggerManager = new TriggerTemplate.TriggerManager();
    triggerManager.addHandler(
        new AccountHandler(), new List<TriggerTemplate.TriggerAction>
            {
                TriggerTemplate.TriggerAction.beforeInsert
            }
    );
    triggerManager.runHandlers();
    //comment for commit
    //branch-1 small change
}