var verifier = require('alexa-verifier')
var restify = require('restify');


// Setup Restify Server
var server = restify.createServer();
const port = process.env.PORT || 8080;
server.listen(port, function () {
    console.log('Verifier!', server.name, server.url);
});

//
// Verify incoming Alexa requests according to security requirements for certification
server.use(restify.bodyParser());
server.post('/verify',
    function(req, res, next) {

        //console.log('## headers '+JSON.stringify(req.headers));
        return next();
    },
    function(req, res, next) {
        var request = JSON.parse(req.body);
        certUrl = req.headers.signaturecertchainurl;
        signature = req.headers.signature;
        body = req.body;
        verifier(certUrl, signature, body, function(er) {
            if (er) {
                console.log('### RETURNING FALSE:'+JSON.stringify(er));
                res.send(false);
            } else {
                console.log('### RETURNING TRUE');
                res.send(true);
            }
        });

        return next();
    }
);



