namespace :consultation_instruction_survey do
  desc 'Sends a follow up email to patrons who have visited the Library for a constultation or instruction event'
  task :send => :environment do

    # Load all of the rails models
    Rails.application.eager_load!

    # Loop through the consultation and instruction interactions
    Consultation::Interaction.all.each do |event|

      # Skip if no patron email is provided
      next if event.patron_email.nil?

      # Staff filter for testing
      next unless event.staff_pennkey == "kevinat"

      # Testing date filter
      next unless event.event_date == Date.iso8601("2020-01-23")

      # Skip unless the event occured ten days ago
      #next unless event.event_date == 10.days.ago

      # Find the staff member by pennkey and build a name
      staff_member = UpennAlma::Demographic.find_by(pennkey: event.staff_pennkey)
      staff_name = "a Library Staff Member"
      unless staff_member.nil?
        staff_name = staff_member.first_name + " " + staff_member.last_name
      end

      # Switch the email depending on consultation or instruction
      if event.consultation_or_instruction = 'Consultation'
        ConsultationInteractionMailer.with(
          event: event,
          staff_name: staff_name
        ).consultation_email.deliver
      else
        ConsultationInteractionMailer.with(
          event: event,
          staff_name: staff_name
        ).instruction_email.deliver
      end

    end # End consultation and instruction loop
  end # End task
end # End namespace
