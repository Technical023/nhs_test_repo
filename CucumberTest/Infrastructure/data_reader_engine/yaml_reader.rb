require_relative '../config/test_config'

class YamlReader



  def self.get_dev_data(key)
    yaml_path  = ENV['PROJECT_PATH'] + 'test_configs/testdata/yamlData/env_data.yml'
    data = YAML.load_file(yaml_path)
    value = data['dev'][key]
    return value
  end


  def self.get_browserstack_data(key)
    yaml_path  = ENV['PROJECT_PATH'] + 'test_configs/testdata/yamlData/env_data.yml'
    data = YAML.load_file(yaml_path)
    value = data['browserstack'][key]
    return value
  end

  def self.get_test_data(key)
    yaml_path  = ENV['PROJECT_PATH'] + 'test_configs/testdata/yamlData/env_data.yml'
    data = YAML.load_file(yaml_path)
    value = data['dev'][key]
    return value
  end


  def self.get_staging_data(key)
    yaml_path  = ENV['PROJECT_PATH'] + 'test_configs/testdata/yamlData/env_data.yml'
    data = YAML.load_file(yaml_path)
    value = data['dev'][key]
    return value
  end

  def self.get_live_data(key)
    yaml_path  = ENV['PROJECT_PATH'] + 'test_configs/testdata/yamlData/env_data.yml'
    data = YAML.load_file(yaml_path)
    value = data['dev'][key]
    return value
  end


end