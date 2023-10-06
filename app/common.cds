using riskmanagement as rm from '../db/schema';

//annotate Risk elements
/* refers to the definitions of schema.cds file
that defines the Risks & Mitigations entities.
annotates Risk entity with texts - used as labels
in form fields & col headers in SAP Fiori elements
*/
annotate rm.Risks with {
    ID     @title: 'Risk';
    title  @title: 'Title';
    owner  @title: 'Owner';
    prio   @title: 'Priority';
    descr  @title: 'Description';
    miti   @title: 'Mitigation';
    impact @title: 'Impact';
}

annotate rm.Mitigations with {
    ID    @(
        UI.Hidden,
        Common: {Text: descr}
    );
    owner @title: 'Owner';
    descr @title: 'Description';
}

annotate rm.Risks with {
    miti @(Common: {
        //show text, not id for mitigation in the context of risks
        /*UI shows description property*/
        Text           : miti.descr,
        TextArrangement: #TextOnly,
        /*ValueList introduces a value help for miti that you can see 
        on obj page in its edit mode. value help takes the ID as input param
        and displays the description parameter*/
        ValueList      : {
            Label         : 'Mitigations',
            CollectionPath: 'Mitigations',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: miti_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'descr'
                }
            ]
        },
    })
}
