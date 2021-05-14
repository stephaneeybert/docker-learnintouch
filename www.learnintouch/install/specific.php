<?PHP

// The website specific data

// The name of the web site
$gSetupWebsiteName = getenv("WWW_LEARNINTOUCH_NAME");

// The domain name
$gSetupWebsiteDomain = getenv("WWW_LEARNINTOUCH_DOMAIN");
$gSetupWebsiteScheme = getenv("WWW_LEARNINTOUCH_SCHEME");

// The name of the web site url
$gSetupWebsiteUrl = $gSetupWebsiteScheme . '://' . $gSetupWebsiteDomain . ':' . $_SERVER['SERVER_PORT'];

// The root path
$gRootPath = '/usr/local/learnintouch/www/learnintouch.com/';

// The database for one website
define('DB_HOST', getenv("DB_HOST"));
define('DB_PORT', getenv("DB_PORT"));
define('DB_NAME', getenv("WWW_LEARNINTOUCH_DB_NAME"));
define('DB_USER', getenv("WWW_LEARNINTOUCH_DB_USER"));
define('DB_PASS', getenv("WWW_LEARNINTOUCH_DB_PASSWORD"));

?>
