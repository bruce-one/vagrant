module Vagrant
  class Action
    module Box
      class Verify
        def initialize(app, env)
          @app = app
          @env = env
        end

        def call(env)
          begin
            env.ui.info "vagrant.actions.box.verify.verifying"
            VirtualBox::Appliance.new(env["box"].ovf_file)
          rescue Exception
            return env.error!(:box_verification_failed)
          end

          @app.call(env)
        end
      end
    end
  end
end
