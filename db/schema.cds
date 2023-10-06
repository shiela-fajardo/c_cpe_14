namespace riskmanagement; 
/*  
using namespace riskmanagement
this is optional & acts like a prefix that is applied to
relevant names in a file automatically 
*/
    using { managed } from '@sap/cds/common';

    //creates 2 entities - Risks & Mitigations
    entity Risks: managed 
    {
        //key autofilled by CAP w/c is exposed to user of service
        //w/ annotation @Core.Computed: true
        key ID: UUID @(Core.Computed: true); //is the key
        //these are the properties
        title: String(100);
        owner: String;
        prio:  String(5);
        descr: String;
        miti:  Association to Mitigations;
        //a risk has a mitigation, so miti has 1:1 association with Mitigation entity
        impact: Integer;
        //bp: Association to BusinessPartners;
        //You will need this definition in a later step
        criticality: Integer;
    }

    entity Mitigations: managed
    {
        key ID:     UUID @(Core.Computed: true); //is the key
        //these are properties
        descr: String;
        owner: String;
        timeline: String;
        risks: Association to many Risks on risks.miti = $self;
        //a mitigation can be used for many risks, so it has a 1:many association with Risk entity
    }