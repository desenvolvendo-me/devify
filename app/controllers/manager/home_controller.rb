module Manager
  class HomeController < InternalController
    def index
      @student_progress_data = StudentProgress
                                 .group_by_week(:date, format: "%d/%b/%Y")
                                 .sum(:value)
    end
  end
end
