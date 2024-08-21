using { ust.prasanna.ananthu.db.master, ust.prasanna.ananthu.db.transaction} from '../db/dataModel';

service PurchaseOrderService @(path:'PurchaseOrderService') {
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product;
    entity POs @(odata.draft.enabled:true) as projection on transaction.purchaseorder;
    entity POItems as projection on transaction.poitems;
}
