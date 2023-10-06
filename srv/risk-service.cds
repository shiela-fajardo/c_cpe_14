//created a new service RiskService in the namespace riskmanagement
using { riskmanagement as rm } from '../db/schema';

    @path: 'service/risk' //tells CAP framework to expose RiskService at URL path service/risk
    service RiskService //creates service
    {   
        //exposes 2 entities - Risks & Mitigations of the database schema
        //@odata.draft.enabled - enables edit sessions w/ draft states
        entity Risks as projection on rm.Risks;
            annotate Risks with @odata.draft.enabled;
        entity Mitigations as projection on rm.Mitigations;
            annotate Mitigations with @odata.draft.enabled;
        //@readonly entity BusinessPartners as projection on rm.BusinessPartners;
    }