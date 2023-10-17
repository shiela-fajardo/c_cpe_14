using RiskService from '../../srv/risk-service';

// Risk List Report Page
annotate RiskService.Risks with @(UI: {
    HeaderInfo     : {
        TypeName      : 'Risk',
        TypeNamePlural: 'Risks',
        Title         : {
            $Type: 'UI.DataField',
            Value: title
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: descr
        }
    },
    SelectionFields: [prio], //defines w/c properties are exposed as search fields in the hdr above the list
    Identification : [{Value: title}],
    // Define the table columns
    LineItem       : [ //all col & order of worklist are derived
        {Value: title},
        {Value: miti_ID},
        {Value: owner},
        {Value: bp_BusinessPartner},
        {
            Value      : prio,
            Criticality: criticality //adds diamond icon on the left of the fields
        },
        {
            Value      : impact,
            Criticality: criticality
        },
    ],
});

// Risk Object Page
annotate RiskService.Risks with @(UI: {
    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target: '@UI.FieldGroup#Main',
    }],
    //defines a single facet of fieldgrp #Main (shows as a form)
    FieldGroup #Main: {Data: [ //properties of data array w/in fieldgrp #Main determine the fields in the form
        {Value: miti_ID},
        {Value: owner},
        {Value: bp_BusinessPartner},
        {
            Value      : prio,
            Criticality: criticality
        },
        {
            Value      : impact,
            Criticality: criticality
        }
    ]},
});
