using { sap.ui.riskmanagement as my } from '../db/schema';

@path: 'service/risk'
service RiskService {
  entity Risks @(restrict : [
            {
                grant : [ 'READ', 'CREATE' ],
                where: 'createdBy = $user',
                to : [ 'RiskCreator' ]
            },
            {
                grant : [ 'READ' ],
                to : [ 'RiskViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'RiskManager' ]
            }
        ]) as projection on my.Risks;
    annotate Risks with @odata.draft.enabled;
  entity Mitigations @(restrict : [
            {
                grant : [ 'UPDATE' ],
                where: 'assignedTo = $user',
                to : [ 'MitiProcessor' ]
            },
            {
                grant : [ 'READ' ],
                to : [ 'MitiViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'MitiManager' ]
            }
        ]) as projection on my.Mitigations;
    annotate Mitigations with @odata.draft.enabled;
}