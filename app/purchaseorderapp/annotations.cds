using PurchaseOrderService as service from '../../srv/PurchaseOrderService';

annotate service.POs with @(

    UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMOUNT,
        OVERALL_STATUS
    ],
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.CITY,
        },
        // {
        //     $Type : 'UI.DataField',
        //     Value : OverallStatus,
        //     Criticality: Status //Color code for the status
        // },
    ],
    UI.HeaderInfo:{
        TypeName: 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title: {Value:PO_ID},
        Description:{Value:PARTNER_GUID.COMPANY_NAME}
    },
    UI.Facets:[
        {
            $Type: 'UI.CollectionFacet',
            Label: 'General Info',
            Facets : [
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'Order Details',
                    Target:'@UI.Identification',
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Label: 'PO Pricing',
                    Target:'@UI.FieldGroup',
                }
            ]
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'Purchase Order Items',
            Target : 'Items/@UI.LineItem',
        },
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
    ],
    UI.FieldGroup:{
        Label: '',
        Data: [
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ]
    }
);
annotate service.POItems with @(
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
    ],
    UI.HeaderInfo:{
        TypeName: 'Purchase Order Item',
        TypeNamePlural: 'Purchase Order Items',
        //For 3rd screen Header
        Title:{ Value: PO_ITEM_POS},
        Description:{ Value:PRODUCT_GUID.DESCRIPTION }
    },
    UI.Facets:[
        {
            $Type: 'UI.CollectionFacet',
            Label: 'More Info',
            Facets:[
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'Item Details',
            Target: '@UI.Identification',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'Pricing',
            Target: '@UI.FieldGroup',
        },
            ]
        }
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
    ],
    UI.FieldGroup:{
        Label : 'Pricing',
        Data:[
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ]
    }
);

//Value helps for partner id and prodcut id in the 2nd and 3rd screens
annotate service.POs with {
    PARTNER_GUID@(
        //Text with key for value help
        Common:{
            Text: PARTNER_GUID.COMPANY_NAME,
        },
        ValueList.entity: CatalogService.BusinessPartnerSet
    );
    //Set default value without editing we kept this annotate
    OVERALL_STATUS @(
        readonly,
    )
};
annotate service.POItems with {
    PRODUCT_GUID@(
        Common:{
            Text: PRODUCT_GUID.DESCRIPTION,
        },
        ValueList.entity: CatalogService.ProductSet
    )
};
//linking below are in the above annotations
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);
@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);


