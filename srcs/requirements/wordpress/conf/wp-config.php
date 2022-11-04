<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME', getenv('MYSQL_DATABASE'));
define( 'DB_USER', getenv('MYSQL_USER'));
define(	'DB_PASSWORD', getenv('MYSQL_PASSWORD'));
define(	'DB_HOST', 'mariadb');
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         '.`:gFQ~D&%+(Wu%k6F_ilk)ReM9VaRVU|w8w 7kV&!jsl9?gh;hxq+=`-LBKXMqy');
define('SECURE_AUTH_KEY',  'CkH`T:V.L[.u`F>ptDJn*Qkrr0.5<rERg6yisT{zl;3#+yV`vM,MwG!g9o?+fI;c');
define('LOGGED_IN_KEY',    '4H~hc1I^9<|*0!LPV(!e#ngIH`+%TXEcjO)ZnVw:(TL;7b}E[z^C2;guP}C{l)-C');
define('NONCE_KEY',        '=kQRVNgLlJ.P}b$[+_SB1I%u3m<*jmchw_12pFn6WlrXsOZXxD{#9MH>XTD,+9~G');
define('AUTH_SALT',        '+@W1H0JG@wa1X:g0k22!o~BgNIx{qkyf8f9T-dM(-<X+GG5Gh`]+b!aH@(^]klpE');
define('SECURE_AUTH_SALT', 'mKM><6t%rWqj.2%)PF{|Y}aFk/OhS-_^ELXt+)rCQHCDC<%@ye*s1={he[H(!SsY');
define('LOGGED_IN_SALT',   '+^F7m1Ip)[t?Y)8dX6+QGn~7#y*|5_|1@^}p0xRK;h-</({[JHRlFb[LP<mXZlkI');
define('NONCE_SALT',       'Xr-1?]G%1am|->0}{7e]zpzKyERRjwC;|LSButw3}~4$jdRSDYxsWD qW5<~Y-$T');


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
