module Manager
  module Students
    class ProfilesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_student_profile

      def edit
      end

      def update
        user_attributes = user_params.reject { |k, v| v.blank? }
        student_profile_attributes = student_profile_params.reject { |k, v| v.blank? }

        if current_user.update(user_attributes) && @student_profile.update(student_profile_attributes)
          redirect_to edit_manager_students_profile_path, notice: 'Profile was successfully updated.'
        else
          render :edit
        end
      end

      private

      def set_student_profile
        @student_profile = current_user.student_profile
      end

      def user_params
        params.require(:user).permit(:name)
      end

      def student_profile_params
        params.require(:student_profile).permit(:language, :track, :github, :wakatime, :linkedin)
      end
    end
  end
end
