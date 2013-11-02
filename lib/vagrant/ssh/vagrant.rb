module Vagrant

  module SSH

    class Vagrant

      def initialize
        #ENV['VAGRANT_CWD'] = vagrant_directory
      end

      def up
        system 'vagrant up'
      end

      def halt
        system 'vagrant halt'
      end

      def destroy
        system 'vagrant destroy --force'
      end

      def status
        system 'vagrant status'
      end

    end

  end

end
