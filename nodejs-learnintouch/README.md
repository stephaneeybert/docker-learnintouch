Specify the hostname and port number in the engine/setup/properties.php file

Use the same hostname as the one of the website
Include the protocol http://
Include the www prefix !
Omitting the www prefix will prevent the cookies to be sent as part of the socket request and the socket connexion will fail
define('NODEJS_SOCKET_LOCALHOST', 'http://www.thalasoft.com');

Specify the port number in the engine/api/js/socket/config.js file
There is no need to specify a hostname in the NodeJs server
config.socketio.port = 9001;

