namespace riskmanagement; //prefix applied to all relevant names in a file automatically

using {managed} from '@sap/cds/common';

//creates 2 entities -- Risks & Mitigations
entity Risks : managed {
    key ID          : UUID @(Core.Computed: true); //Risks key
        title       : String(100);
        owner       : String;
        prio        : String(5);
        descr       : String;
        miti        : Association to Mitigations; //1:1 assoc w/ Mitigation
        impact      : Integer;
        bp : Association to BusinessPartners;
        // You will need this definition in a later step
        criticality : Integer;
}

entity Mitigations : managed {
    key ID       : UUID @(Core.Computed: true); //Mitigations key
        descr    : String;
        owner    : String;
        timeline : String;
        risks    : Association to many Risks //1:many assoc w/ Risks (1 Mitigation can be used to multiple Risks)
                       on risks.miti = $self;
}

//using an external service from S/4
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER';
entity BusinessPartners as projection on external.A_BusinessPartner {
    key BusinessPartner,
    LastName,
    FirstName
}