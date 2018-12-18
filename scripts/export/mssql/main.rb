module Export
  module Mssql

    class Main
      attr_accessor :folder, :test_mode
      def initialize(folder, test_mode = false)
        @folder, @test_mode = folder, test_mode
        require 'dotenv'
        Dotenv.load(File.join(root_path, ".env"))

        raise "#{folder} config directory doesn't exist." unless Dir.exist?(File.join(root_path, "config", "data_sources", folder))
      end

      def root_path
        File.expand_path('../../..', File.dirname(__FILE__))
      end

      def execute(sequences_only = [])
        task_files(sequences_only).each do |task_file|
          t = Task.new(self, task_file, test_mode)
          next unless t.source_adapter == 'mssql'
          t.execute
        end
      end

      def task_files(sequences_only = [])
        sequences_only = [sequences_only] if sequences_only.present? && !sequences_only.is_a?(Array)

        full_paths = Dir[ File.join(root_path, "config", "data_sources", folder, "**", "*")]
        tasks = []
        full_paths.each do |full_path|
          next if File.basename(full_path) == "global.yml"

          table_params = YAML.load_file(full_path)
          seq = table_params["load_sequence"] || 0

          next if sequences_only.present? && !sequences_only.include?(seq)

          tasks << {load_sequence: seq, full_path: full_path}
        end

        tasks.sort_by{|t| t[:load_sequence]}.map{|t| t[:full_path]}
      end

      def global_config
        return @global_params unless @global_params.blank?

        global_params = {}

        yml_path = File.join(root_path, "config", "data_sources", folder, "global.yml")

        if File.exist?(yml_path)
          global_params = YAML.load(ERB.new(File.read(yml_path)).result)
        end

        @global_params = global_params
      end

      def db_opts
        opts = {    host:     global_config["host"],
                    port:     global_config["port"],
                    database: global_config["database"],
                    username: global_config["username"],
                    password: global_config["password"],
                    adapter:  'sqlserver',
                    pool:     5,
                    timeout:  120000 }
      end

    end

  end
end
