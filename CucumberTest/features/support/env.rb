require 'rspec'
require 'selenium-webdriver'
require 'cucumber'
require 'parallel_tests'
require 'mysql2'

require_relative '../../Infrastructure/Browsers/browser_factory'
require_relative 'knows_the_domain/world_helper'


World(WorldHelper)

# World(PageObject::PageFactory)