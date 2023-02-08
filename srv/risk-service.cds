using {riskmanagement as rm} from '../db/schema';

@path : 'service/risk'
service RiskService {

    entity Risks @(restrict : [
        {
            grant : ['READ'],
            to    : ['RiskViewer']
        },
        {
            grant : ['*'],
            to    : ['RiskManager']
        }
    ])                      as projection on rm.Risks;

    annotate Risks with @odata.draft.enabled;


    entity Mitigations @(restrict : [
        {
            grant : ['READ'],
            to    : ['RiskViewer']
        },
        {
            grant : ['*'],
            to    : ['RiskManager']
        }
    ])                      as projection on rm.Mitigations;

    annotate Mitigations with @odata.draft.enabled;


    @readonly
    entity BusinessPartners as projection on rm.BusinessPartners;


    @readonly
    entity Customers        as projection on rm.Customers;

    @readonly
    entity V4_Customers     as projection on rm.V4_Customers;
}
