<?PHP

// The website specific data

// The name of the web site
$gSetupWebsiteName = 'folkuniversitet';

// The domain name
$gSetupWebsiteDomain = 'folkuniversitet.thalasoft.com';

// The name of the web site url
$gSetupWebsiteUrl = 'http://' . $gSetupWebsiteDomain . ':' . $_SERVER['SERVER_PORT'];

// The root path
$gRootPath = '/usr/bin/learnintouch/www/folkuniversitet/';

// The database for one website
define('DB_HOST', "mysql");
define('DB_PORT', 3306);
define('DB_NAME', "db_folkuniversitet");
define('DB_USER', "folkuniversitet");
define('DB_PASS', getenv("WWW_FOLKUNIVERSITET_DB_PASSWORD"));

?>

