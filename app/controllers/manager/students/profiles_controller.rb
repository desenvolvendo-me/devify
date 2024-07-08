module Manager
  module Students
    class ProfilesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_student_profile

      def show
        if profile_incomplete?(@student_profile)
          redirect_to edit_manager_students_profile_path, notice: 'Please complete your profile.'
        end

        survey_metrics_service = ::Students::StudentProfileMetricsService.new(@student_profile)
        @skills = survey_metrics_service.skills
        @language_mastery = survey_metrics_service.language_mastery
        @exposure = survey_metrics_service.exposure
        @survey_level = survey_metrics_service.calculate_survey_level

        profile_metrics_service = ::Students::ProfileMetricsService.new(@student_profile)
        @profile_level = profile_metrics_service.calculate_profile_level
      end

      def edit
      end

      def update
        user_attributes = user_params.reject { |k, v| v.blank? }
        student_profile_attributes = ::Students::StudentProfileService.process_params(student_profile_params.reject { |k, v| v.blank? })

        if current_user.update(user_attributes) && @student_profile.update(student_profile_attributes)
          redirect_to manager_students_profile_path, notice: 'Profile was successfully updated.'
        else
          render :edit
        end
      end

      def evaluate
      end

      def submit_evaluation
        student_profile_attributes = ::Students::StudentProfileService.process_params(student_profile_params.reject { |k, v| v.blank? })

        if @student_profile.update(student_profile_attributes)
          redirect_to manager_students_profile_path, notice: 'Evaluation was successfully submitted.'
        else
          render :evaluate
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
        params.require(:student_profile).permit(
          :instagram,
          :main_language,
          :main_framework,
          :track,
          :github,
          :wakatime,
          :linkedin,
          :technology_other_details,
          :most_studied_language_other_details,
          :study_duration,
          :study_duration_details,
          :web_framework_study_duration,
          :web_framework_study_duration_details,
          :communication_preference,
          :exposure_preference,
          technologies: [],
          most_studied_language: [],
          web_framework_studied: []
        )
      end

      def profile_incomplete?(profile)
        profile.main_language.blank? || profile.track.blank?
      end
    end
  end
end
