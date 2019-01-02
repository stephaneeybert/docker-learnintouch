<?PHP

// The website specific data

// The name of the web site
$gSetupWebsiteName = getenv("WWW_THALASOFT_NAME");

// The domain name
$gSetupWebsiteDomain = getenv("WWW_THALASOFT_DOMAIN");

// The name of the web site url
$gSetupWebsiteUrl = 'http://' . $gSetupWebsiteDomain . ':' . $_SERVER['SERVER_PORT'];

// The root path
$gRootPath = '/usr/bin/learnintouch/www/thalasoft.com/';

// The database for one website
define('DB_HOST', getenv("DB_HOST"));
define('DB_PORT', getenv("DB_PORT"));
define('DB_NAME', getenv("WWW_THALASOFT_DB_NAME"));
define('DB_USER', getenv("WWW_THALASOFT_DB_USER"));
define('DB_PASS', getenv("WWW_THALASOFT_DB_PASSWORD"));

?>

