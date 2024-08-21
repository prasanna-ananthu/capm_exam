sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'prasanna/ananthu/app/purchaseorderapp/test/integration/FirstJourney',
		'prasanna/ananthu/app/purchaseorderapp/test/integration/pages/POsList',
		'prasanna/ananthu/app/purchaseorderapp/test/integration/pages/POsObjectPage',
		'prasanna/ananthu/app/purchaseorderapp/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('prasanna/ananthu/app/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);