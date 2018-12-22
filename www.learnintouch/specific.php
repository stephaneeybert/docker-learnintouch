<?PHP

// The website specific data

// The name of the web site
$gSetupWebsiteName = 'learnintouch';

// The domain name
$gSetupWebsiteDomain = 'dev.learnintouch.com';

// The name of the web site url
$gSetupWebsiteUrl = 'http://' . $gSetupWebsiteDomain . ':' . $_SERVER['SERVER_PORT'];

// The root path
$gRootPath = '/usr/bin/learnintouch/www/learnintouch.com/';

// The database for one website
define('DB_HOST', "mysql");
define('DB_PORT', 3306);
define('DB_NAME', "db_learnintouch");
define('DB_USER', "learnintouch");
define('DB_PASS', getenv("WWW_LEARNINTOUCH_DB_PASSWORD"));

?>

