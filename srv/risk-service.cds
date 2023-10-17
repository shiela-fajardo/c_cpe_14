using {riskmanagement as rm} from '../db/schema';

@path: 'service/risk' //tells CAP framework to expose RiskService at URL "service/risk"

//creates new service called "RiskService"
service RiskService {
    //exposes 2 entities -- Risks & Mitigations
    entity Risks       as projection on rm.Risks;
    annotate Risks with @odata.draft.enabled; //enables edit session w/ draft states stored on the server for the UI
    entity Mitigations as projection on rm.Mitigations;
    annotate Mitigations with @odata.draft.enabled;
    @readonly entity BusinessPartners as projection on rm.BusinessPartners; //uncomment
}
