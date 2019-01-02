<?PHP

// The website specific data

// The name of the web site
$gSetupWebsiteName = getenv("WWW_FOLKUNIVERSITET_NAME");

// The domain name
$gSetupWebsiteDomain = getenv("WWW_FOLKUNIVERSITET_DOMAIN");

// The name of the web site url
$gSetupWebsiteUrl = 'http://' . $gSetupWebsiteDomain . ':' . $_SERVER['SERVER_PORT'];

// The root path
$gRootPath = '/usr/bin/learnintouch/www/folkuniversitet/';

// The database for one website
define('DB_HOST', getenv("DB_HOST"));
define('DB_PORT', getenv("DB_PORT"));
define('DB_NAME', getenv("WWW_FOLKUNIVERSITET_DB_NAME"));
define('DB_USER', getenv("WWW_FOLKUNIVERSITET_DB_USER"));
define('DB_PASS', getenv("WWW_FOLKUNIVERSITET_DB_PASSWORD"));

?>

