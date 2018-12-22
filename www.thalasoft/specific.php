<?PHP

// The website specific data

// The name of the web site
$gSetupWebsiteName = 'thalasoft';

// The domain name
$gSetupWebsiteDomain = 'www.thalasoft.com';

// The name of the web site url
$gSetupWebsiteUrl = 'http://' . $gSetupWebsiteDomain . ':' . $_SERVER['SERVER_PORT'];

// The root path
$gRootPath = '/usr/bin/learnintouch/www/thalasoft.com/';

// The database for one website
define('DB_HOST', "mysql");
define('DB_PORT', 3306);
define('DB_NAME', "db_thalasoft");
define('DB_USER', "thalasoft");
define('DB_PASS', getenv("WWW_THALASOFT_DB_PASSWORD"));

?>

