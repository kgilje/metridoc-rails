ActiveAdmin.register Keyserver::Computer do
  menu false
  permit_params :computer_id, :computer_server_id, :computer_name, :computer_user_name, :computer_platform, :computer_protocol, :computer_address, :computer_domain, :computer_description, :computer_virtual_host, :computer_gmt_offset, :computer_os_family, :computer_os_type, :computer_os_version, :computer_os_release, :computer_os_install_date, :computer_os64_bit, :computer_cpu_type, :computer_cpu_count, :computer_cpu_clock, :computer_cpu64_bit, :computer_hyper_threading, :computer_multicore, :computer_capabilities, :computer_ram_size, :computer_ram_type, :computer_ram_array, :computer_disk_size, :computer_free_space, :computer_disk_manufacturer, :computer_disk_model, :computer_display_width, :computer_display_height, :computer_display_depth, :computer_display_manufacturer, :computer_display_model, :computer_display_serial, :computer_video_manufacturer, :computer_video_model, :computer_vram_size, :computer_mac_address, :computer_mac_manufacturer, :computer_mac_model, :computer_wireless_address, :computer_wireless_manufacturer, :computer_wireless_model, :computer_mac_array, :computer_site, :computer_oem_serial, :computer_os_serial, :computer_baseboard_serial, :computer_system_serial, :computer_manufacturer, :computer_model, :computer_bios_serial, :computer_bios_model, :computer_bios_version, :computer_cdrom_present, :computer_cdrom_writable, :computer_cdrom_manufacturer, :computer_cdrom_model, :computer_dvd_present, :computer_dvd_writable, :computer_sound_manufacturer, :computer_sound_model, :computer_lease_expiration, :computer_last_login, :computer_last_audit, :computer_base_audit, :computer_client_version, :computer_user_session, :computer_acknowledged, :computer_allowed, :computer_audit, :computer_division_id, :computer_asset_id, :computer_location, :computer_owner, :computer_confirmed, :computer_confirmed_by, :computer_notes, :computer_flags
  actions :all, :except => [:new, :edit, :update, :destroy]
end
