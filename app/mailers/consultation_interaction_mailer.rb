class ConsultationInteractionMailer < ApplicationMailer
  # By default where the email comes from
  default from: 'The University of Pennsylvania Libraries'

  # Define the consultation email sender
  def consultation_email
    # Setup general parameters
    # All event information
    @event = params[:event]
    # The first and last name of the staff member
    @staff_name = params[:staff_name]
    # Construct the URL for the survey requested
    base_url = 'https://upenn.libwizard.com/id/edb3c0270fba7a6674a874809cba5a3d'
    # URL encode both the staff_pennkey and the patron_name
    # Turn the date into a UNIX timestamp in seconds then convert into milliseconds.
    @url = base_url + '?' +
      '4244862=' + ERB::Util.url_encode(@staff_name) + '&' +
      '4244863=' + ERB::Util.url_encode(@event.patron_name) + '&' +
      '4244864=' + @event.event_date.to_time.to_i.to_s + '000'

    # Send the email to the patron
    mail(to: @event.patron_email, subject:'Did you find everything you needed? Stay connected with expert research support')
  end

  def instruction_email
    @event = params[:event]
    @staff_name = params[:staff_name]
    @url = 'https://upenn.libwizard.instruction.survey.edu'
    mail(to: @event.patron_email, subject:'Library Instruction Survey Request')
  end

end
