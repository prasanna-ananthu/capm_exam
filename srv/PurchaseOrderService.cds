using { ust.prasanna.ananthu.db.master, ust.prasanna.ananthu.db.transaction} from '../db/dataModel';

service PurchaseOrderService @(path:'PurchaseOrderService') {
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    entity POs @(odata.draft.enabled:true) as projection on transaction.purchaseorder{
        *,
        Items,
        //names for the status
        case OVERALL_STATUS
            when 'P' then 'Pending'
            when 'N' then 'New'
            when 'A' then 'Approved'
            when 'X' then 'Rejected'
            end as OverallStatus : String(10),
        //colour coding for the status
        case OVERALL_STATUS
            when 'P' then 5 //blue
            when 'N' then 2 //orange
            when 'A' then 3 //green
            when 'X' then 1 //red
            end as Status : String(10),
    };
    entity POItems as projection on transaction.poitems;
}
