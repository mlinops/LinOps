<?php

require_once( dirname(__FILE__) . '/wp-load.php' );
require_once( dirname(__FILE__) . '/wp-admin/includes/admin.php' );

$post_data = array(
    'post_title'    => 'New test post with an additional field',
    'post_content'  => 'Content of the test post with an additional field',
    'post_status'   => 'publish',
    'post_author'   => 1,
    'post_category' => array(1)
);

// Create a post with required fields.
$post_id = wp_insert_post($post_data, true);
print_r($post_id);

?>