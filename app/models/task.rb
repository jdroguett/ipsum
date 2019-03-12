class Task < ApplicationRecord
  belongs_to :project
  has_many :subtasks


  def split
    split_process.each{|s|
      self.subtasks << s
    }
  end


  def split_process
  	days = project.workingdays.select{|d| d <= 5}
  	subtasks = []

  	(0..4).each{|t|
			subtasks << Subtask.new(day: days[t % days.length])
  	}

    day_subtasks = []
    days.each{|d|
      day_subtasks+= subtasks.select{|s| s.day == d}
    }

  	
  	i = 0
  	day_subtasks.each{|s|
  		i += 1
  		s.name = "ST #{i}"
  	}
  end
end
