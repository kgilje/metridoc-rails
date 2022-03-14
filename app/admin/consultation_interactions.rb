ActiveAdmin.register Consultation::Interaction do
  breadcrumb do
    # Custom breadcrumb links
    [link_to('Admin', admin_root_path), link_to('Consultation and Instruction', admin_consultation_path)]
  end

  menu false
  permit_params :submitted,
                :consultation_or_instruction,
                :staff_pennkey,
                :staff_expertise,
                :event_date,
                :mode_of_consultation,
                :session_type,
                :service_provided,
                :rtg,
                :outcome,
                :research_community,
                :total_attendance,
                :number_of_registrations,
                :location,
                :event_length,
                :prep_time,
                :number_of_interactions,
                :patron_type,
                :patron_name,
                :graduation_year,
                :undergraduate_student_type,
                :graduate_student_type,
                :mba_type,
                :campus,
                :school_affiliation,
                :department,
                :faculty_sponsor,
                :course_sponsor,
                :course_name,
                :course_number,
                :referral_method,
                :patron_question,
                :session_description,
                :notes,
                :upload_record,
                :patron_email

end
