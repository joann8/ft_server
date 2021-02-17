<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'dyE;+srYXd1Gw+VeX=G)>5_g,&F*cHz51yV>Tk4AyvmA1n<J;bQmS%rcMLO8aXx5');
define('SECURE_AUTH_KEY',  '/J_~E%f@YE8@<T^2YVUI{Ny]Mr;&LoIf95sF;o>w#Z%NHlBM,s]cEGm4*=EB_ea$');
define('LOGGED_IN_KEY',    '0_D0wj&X>V3)(/7:jx**g4mqU8J6D7?6Y-e`p{M@TSjYFJfA c,`cvDeL#&9+Y<O');
define('NONCE_KEY',        'qq`ohKTv-W|99|K#W_}:*5oNtdZbS}r$?q85jlYuh78@`4^/Q#EpWx>Lh=N|c{SL');
define('AUTH_SALT',        '8,V]FhEr2<-dALBdhp)=6%mP8Gvqz,`:h[6 }35C7w0kJ0>?2m0jNm`ELi9dqsCq');
define('SECURE_AUTH_SALT', 'wqW]t] >P-I{e++?hQ-L@.n(N^ox=1ux22*dkaU3I&AQStpGS4]gU=PjgFeOQ/b*');
define('LOGGED_IN_SALT',   'GBt+-;IxGBE*lHz%cSEm.1)=rh-CUW`dVzX#S]{QKV3|Jk|T91GG|F9&ib?2;zV{');
define('NONCE_SALT',       'Oo6jvF-*Og^^A7F0!ezE-!2N(*@E_9|0]atk!nd[A%W>UEgtFItpLZ<Y04f!_hJ@');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
