require 'pathname'
require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

module Nimbleshop
  class InstallGenerator < Rails::Generators::Base

    source_root Pathname.new(File.expand_path('../templates', __FILE__))

    def generate
      copy_files!

      ensure_no_mass_protection

      copy_migration_files
      execute_db_create
      execute_db_migrate
      execute_db_test_prepare
      populate_sample_data

      mount
      delete_public_index_html
      delete_test_dir
    end


    protected

    def delete_test_dir
      FileUtils.rm_rf destination_path.join('test')
    end

    def delete_public_index_html
      remove_file "public/index.html"
    end

    def mount
      if (routes_file = destination_path.join('config', 'routes.rb')).file?
        mount = %Q{
          mount NimbleshopSimply::Engine,          at: '/', as: 'main_theme'

          mount NimbleshopAuthorizedotnet::Engine, at: '/nimbleshop_authorizedotnet'
          mount NimbleshopPaypalwp::Engine,        at: '/nimbleshop_paypalwp'
          mount NimbleshopSplitable::Engine,       at: '/nimbleshop_splitable'
          mount NimbleshopCod::Engine,             at: '/nimbleshop_cod'
          mount NimbleshopStripe::Engine,          at: '/nimbleshop_stripe'
        }

        inject_into_file 'config/routes.rb', mount, :after => "Application.routes.draw do\n"
      end
    end

    def ensure_no_mass_protection
      f = 'config/application.rb'
      current = 'config.active_record.whitelist_attributes = true'
      new = 'config.active_record.whitelist_attributes = false'
      gsub_file f, current, new, verbose: true
    end

    def copy_migration_files
      say_status :copying, "migration files"
      silence_stream(STDOUT) do
        silence_warnings { rake 'railties:install:migrations' }
      end
    end

    def execute_db_test_prepare
      say_status :running, "db:test:prepare"
      silence_stream(STDOUT) do
        silence_stream(STDERR) do
          silence_warnings { rake 'db:test:prepare' }
        end
      end
    end

    def execute_db_create
      say_status :running, "db:create"
      silence_stream(STDOUT) do
        silence_stream(STDERR) do
          silence_warnings { rake 'db:create' }
        end
      end
    end

    def execute_db_migrate
      say_status :running, "db:migrate"
      silence_stream(STDOUT) do
        silence_stream(STDERR) do
          silence_warnings { rake 'db:migrate' }
        end
      end
    end

    def populate_sample_data
      say_status :create, "sample data"
      silence_warnings { rake 'nimbleshop:setup:db' }
    end


    def bundle!
      run 'bundle install'
    end

    def copy_files!
      handle_nimbleshop_yml_file

      template "config/initializers/001_load_nimbleshop_config.rb", "#{destination_path}/config/initializers/001_load_nimbleshop_config.rb"
      template "config/initializers/cache_images.rb", "#{destination_path}/config/initializers/cache_images.rb"
      template "config/initializers/carrierwave.rb",  "#{destination_path}/config/initializers/carrierwave.rb"
      template "config/initializers/delayed_job.rb",  "#{destination_path}/config/initializers/delayed_job.rb"
      template "config/initializers/setup_email.rb",  "#{destination_path}/config/initializers/setup_email.rb"
    end

    # Helper method to quickly convert destination_root to a Pathname for easy file path manipulation
    def destination_path
      @destination_path ||= Pathname.new(self.destination_root)
    end

    # do not use template method to copy the file. template method actually executes the code
    #  <%= ENV['S3_ACCESS_KEY_ID'] %> inside nimbleshop.yml rather than copying that code
    def handle_nimbleshop_yml_file
      from = File.expand_path('../templates/config/nimbleshop.yml', __FILE__)
      FileUtils.cp from,  "#{destination_path}/config/nimbleshop.yml"
    end

  end
end
