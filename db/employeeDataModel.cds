namespace ust.prasanna.ananthu.db;

using { ust.prasanna.ananthu.reuse } from '../db/reuse.cds';
using { cuid, Currency } from '@sap/cds/common';

context masters{

    entity employee : cuid {
        nameFirst: String(40);
        nameMiddle: String(40);
        nameLast: String(40);
        nameInitials: String(40);
        Gender: reuse.Gender; // here I changed in csv, sex to Gender 
        language: String(1);
        phoneNumber: reuse.PhoneNumber;
        Email: reuse.Email;
        loginName: String(12);
        Currency: Currency;
        salaryAmount: Decimal(10,2);
        accountNumber: String(16);
        bankId: String(20); //here i changed to 40 because data is too long when adding hana
        bankName: String(64);
    }
}
