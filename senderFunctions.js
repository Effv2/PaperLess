
//This function sends and email.
function sendEmail(addressee, subjectText, bodyText){
  var nodemailer = require('nodemailer');

  var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'noxTeamHack@gmail.com',
      pass: 'gsChallengeNox'
    }
  });

  var mailOptions = {
    from: 'noxTeamHack@gmail.com',
    to: addressee,
    subject: subjectText,
    text: bodyText
  };

  transporter.sendMail(mailOptions, function(error, info){
    if (error) {
      console.log(error);
    } else {
      console.log('Email sent: ' + info.response);
    }
  });
};

//Example of how to use the function. All the parameters are strings.
//sendEmail('laz96@outlook.com', 'Prueba funcion', 'Prueba mail lograda');
//--------------------------------------------------------------------------------------------------------------


//This function sends a whats app message.
function sendWa (numAddressee, msj ){
	var request = require('request'); //bash: npm install request
	// URL for request POST /message
	var num = numAddressee;
	var url = 'https://eu61.chat-api.com/instance61267/sendMessage?token=yscxdncy9lvt5gwn';
	var data = {
	    "phone": "521" + num,
	    //"chatId": "5215561472960@c.us", // Receivers phone
	    "body": msj, // Message
	};
	// Send a request
	request({
	    url: url,
	    method: "POST",
	    json: data
	});
};
//Example of how to use the sendWa function. The first parameters is a 10 digit number while the second one is string type.
//sendWa(5512408521,'Prueba WA')
//--------------------------------------------------------------------------------------------------------------


//This function sends an SMS.
function smsSender(numAddressee, textBody){
  // Load the AWS SDK for Node.js
  const AWS = require('aws-sdk');
  // Set region
  AWS.config.update({region: 'us-east-1',
  //This keys belongs to the AWS account and are different for every account.
  accessKeyId : 'XXXXXXXXXXXXXXXXXXX',
  secretAccessKey : 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'});


  //Create publish parameters
  var params = {
    Message: textBody, /* required */
    PhoneNumber: '+521'+numAddressee,
    MessageStructure: 'string'
  };

  var sns = new AWS.SNS();

  sns.publish(params, function (err, data) {
      if (err) console.log(err, err.stack);
      else console.log(data);
  });
};

//Example of how to use the smsSender function.
//It takes two parameters: a number (addresssee) and the message. Both are STRING type.
//smsSender('5512408521','Prueba SMS!');
