<?php

// autoload_psr4.php @generated by Composer

$vendorDir = dirname(dirname(__FILE__));
$baseDir = dirname($vendorDir);

return array(
    'Psr\\Log\\' => array($vendorDir . '/psr/log/Psr/Log'),
    'Application\\' => array($baseDir . '/Application'),
    'Alexya\\' => array($baseDir . '/Alexya', $vendorDir . '/alexya-framework/http/Alexya', $vendorDir . '/alexya-framework/filesystem/Alexya', $vendorDir . '/alexya-framework/tools/Alexya', $vendorDir . '/alexya-framework/database/Alexya', $vendorDir . '/alexya-framework/logger/Alexya', $vendorDir . '/alexya-framework/router/Alexya', $vendorDir . '/alexya-framework/localization/Alexya'),
);