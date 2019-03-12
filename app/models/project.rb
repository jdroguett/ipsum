class Project < ApplicationRecord
	serialize :workingdays,Array

	has_many :tasks
	accepts_nested_attributes_for :tasks

	#FIXME esto por ahora, luego mejorar el ingreso de este datos en la interface
	def workingdays=(value)
	    super(value[1..-2].split(',').map(&:to_i))
  	end

end
