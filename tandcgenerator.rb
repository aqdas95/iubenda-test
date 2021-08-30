require 'json'
require_relative './transformation.rb'

class TAndCGenerator

  def generate(dataset_filename, template_filename)
      dataset = File.read(dataset_filename)
      template = File.read(template_filename)
      data = JSON.parse(dataset)
      transformation_helper = Transformation.new
      result = transformation_helper.perform(data, template)
      return result
  end
end