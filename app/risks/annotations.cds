using RiskService as service from '../../srv/risk-service';

/* defines content of worklist page & object page*/
//Risk List Report Page
annotate RiskService.Risks with @(UI: {
    HeaderInfo     : {
        TypeName      : 'Risks',
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
    /*defines w/c of the properties are exposed as
    search fields in the header bar (above list)*/
    SelectionFields: [prio],
    Identification : [{Value: title}],
    //define the table columns
    /*derives all cols & order of the worklist*/
    LineItem       : [
        {Value: title},
        {Value: miti_ID},
        {Value: owner},
        {
            Value      : prio,
            /*adds diamond icon*/
            Criticality: criticality
        },
    ],
});

//Risk Object Page
/*defines content of object page*/
annotate RiskService.Risks with @(UI: {
    /*defines 1facet (ReferenceFacet) of fieldgrp FieldGroup#Main
    fieldgrp shows up as a form*/
    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Main',
        Target: '@UI.FieldGroup#Main',
    }],
    /*properties of the data array w/in fieldgrp
    determine the fields in the form*/
    FieldGroup #Main: {Data: [
        {Value: miti_ID},
        {Value: owner},
        {
            Value      : prio,
            Criticality: criticality
        },
    ]},
});
