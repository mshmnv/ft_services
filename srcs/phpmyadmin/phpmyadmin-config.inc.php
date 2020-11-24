<?php
/**
 * This is needed for cookie based authentication to encrypt password in
 * cookie.
 */
$cfg['blowfish_secret'] = '';

/**
 * Only one server
 */
$i = 1;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
/**
 * Variable definition
 */
$cfg['Servers'][$i]['host'] = "mysql";
$cfg['Servers'][$i]['port'] = "3306";
$cfg['Servers'][$i]['user'] = "user";
$cfg['Servers'][$i]['password'] = "password";
/**
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';