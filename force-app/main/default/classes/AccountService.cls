public without sharing class AccountService {
    public static void setFieldValuesBeforeInsert(List<Account> newRecords) {
        for(Account a : newRecords){
            a.Description = 'New description';
        }
    }
}
