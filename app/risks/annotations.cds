using RiskService as service from '../../srv/risk-service';
//UNIT2
//Risk List Report Page
annotate  RiskService.Risks with @
(
    UI : 
    {
        HeaderInfo  : {
            TypeName : 'Risks',
            TypeNamePlural : 'Risks',
            Title : {
                $Type : 'UI.DataField',
                Value : title
            },
            Description : {
                $Type : 'UI.DataField',
                Value : descr
            }
        },
        SelectionFields  : [prio],
        Identification  : [ {Value : title}],
        //define the table columns
        LineItem  : [
            {Value : title},
            {Value : miti_ID},
            {Value : owner},
            {
                Value : prio,
                Criticality : criticality
            },
        ],
    }
);

//Risk Object Page
annotate RiskService.Risks with @
(
    UI :
    {
        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Main',
                Target : '@UI.FieldGroup#Main',
            }
        ],
        FieldGroup #Main : 
        {
            Data: 
            [
                {Value : miti_ID},
                {Value : owner},
                {
                    Value : prio,
                    Criticality : criticality
                },
            ]
        },
    }
);

