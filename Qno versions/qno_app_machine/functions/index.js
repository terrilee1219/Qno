const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

const db = admin.firestore();
const request = require("request");
var EventEmitter = require("events").EventEmitter;
var eve = new EventEmitter();

//Options for acquiring toke
//Schedule Function - Sends token request at 00:00 CAT
exports.scheduledFunction =
functions.pubsub.schedule('0 0 * * *').timeZone('Africa/Harare').onRun((context) =>{
    request(options, function (error, response, data) {
    if (error) throw new Error(error);

    var obj = JSON.parse(data)
    var latestToken = obj.token;
    var dateTime = new Date().toString();

	    //add token to DB
    let addDoc = db.collection('tokens').add({
        tokenID: latestToken,
        date: dateTime
    }).then(ref => {
        console.log('Added new token document with ID: ', ref.id);
        return null;
    })

    });
    return null;
});



//SMSRequest Function - Sends SMS to most recent database entry
exports.newSMSRequest = functions.firestore
    .document('requests/{documentId}')
    .onWrite((change, context) => {

    const options = {
        method: 'GET',
        url: 'https://rest.mymobileapi.com/v1/Authentication',
        headers: {accept: 'application/json', authorization: 'Basic MDA2NGZiYjItYzdjZi00Nzc1LWFiZmYtMzE0Y2Q1YzA0Mzc2OlcvMXFpS1FhMTNOVGpnYm5vOWpPUzVLdGdTZHFaQ05x'}
        };

      const newOrder = change.after.exists ? change.after.data() : null;
      const userPhoneNumber = newOrder.phoneNo;
      console.log("The phone number: " + userPhoneNumber);

//Request to obtain Token
request(options, function (error, response, data) {
    if (error) throw new Error(error);
    var obj  = JSON.parse(data);
    var token = obj.token;
	//Options for posting message
	var options2 = {
        method: 'POST',
        url: 'https://rest.mymobileapi.com/v1/BulkMessages',
        headers: {
            accept: 'application/json',
            authorization: 'Bearer ' + token,
            'content-type': 'text/json'
        }, body: '{"messages":[{"content":"Please proceed for testing","destination":"' + userPhoneNumber + '"}]}'
        };

request(options2, function (error, response, data) {
        if (error) throw new Error(error);
        console.log(data);
});
});

return null;
});


