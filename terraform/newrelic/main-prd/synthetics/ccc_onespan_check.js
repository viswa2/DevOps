const request = require('request');
const assert = require('assert');

console.log(arguments);
const failures = [];
const log = (msg) => {
    console.log(msg);
};

const assertTrue = (condition, message, failures) => {
    if (condition) {
        log("Success. " + message);
    } else {
        log("Failure. " + message);
       failures.push(failures);
    }
};

healthcheck("${url}");

function healthcheck(url) {
    log("--------------");
    log(`Target URL: $${url}`);
    var startTime = new Date();

    request(url, function (error, response, body) {
        var endTime = new Date();
        log(`Execution time: $${((endTime - startTime) / 1000.0).toFixed(2)}s`)
        log("*** response ***");
        log(body);
        log(" *** generic checks ***");
        assertTrue(error == null, "No errors expected in api call", failures);
        assertTrue(response != null, "Response should NOT be empty", failures);
        assertTrue(body != null, "Response body should NOT be empty", failures);
        assertTrue(response.statusCode === 200, `Response status code must be 200, actual is $${response.statusCode}`, failures);

        if (body != null && response.statusCode === 200) {
            log("*** body check ***");
            let health = JSON.parse(body);
            // log('Just checking '+JSON.parse(body));
            for (let key in health) {
              if(key==="onespan"){
                assertTrue(health[key].success===true, ""+ health[key].message, failures);
              }
             
        }
        }
        log("--------------");

        assert.ok(failures.length === 0, 'Failures detected');
    });
}
