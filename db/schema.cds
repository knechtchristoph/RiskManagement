namespace riskmanagement;

using {managed} from '@sap/cds/common';

entity Risks : managed {
    key ID          : UUID @(Core.Computed : true);
        title       : String(100);
        owner       : String;
        prio        : String(5);
        descr       : String;
        miti        : Association to Mitigations;
        impact      : Integer;
        bp : Association to BusinessPartners;
        criticality : Integer;
}

entity Mitigations : managed {
    key ID       : UUID @(Core.Computed : true);
        descr    : String;
        owner    : String;
        timeline : String;
        risks    : Association to many Risks
                       on risks.miti = $self;
}

// using an external service from S/4
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';

entity BusinessPartners as projection on external.A_BusinessPartner {
   key BusinessPartner,
   LastName, 
   FirstName 
} 


// using a service from S/4HANA on premise
using { cds_ux_ui_customer as onprem } from '../srv/external/cds_ux_ui_customer.csn';

entity Customers as projection on onprem.UX_Customer {
   key CustomerGuid,
   CustomerNumber, 
   CustomerName,
   Street,
   PostCode,
   City 
} 


