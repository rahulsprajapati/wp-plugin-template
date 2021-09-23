<?php
/**
 * Test for Plugin.
 *
 * @package wp-plugin-template
 */

namespace WP_Plugin_Template\Tests;

use WP_UnitTestCase;

/**
 * WP_Plugin_Template test case.
 */
class WP_Plugin_Template extends WP_UnitTestCase {
	
	/**
	 * Test bootstrap.
	 */
	public function test_bootstrap() {
		$this->assertEquals( 10, has_action( 'plugins_loaded', 'WP_Plugin_Template\\load_textdomain' ) );
		$this->assertEquals( 10, has_action( 'plugins_loaded', 'WP_Plugin_Template\\activate_plugin' ) );
	}

}
