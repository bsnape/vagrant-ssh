module VagrantSsh
  class Shell
    attr_reader :options, :exit_code, :exit_signal

    def initialize(hostname, logger: Logger.new(STDOUT), options: {})
      @options  = { user:     'vagrant',
                    password: 'vagrant' }.merge(options)
      @user     = @options[:user]
      @hostname = hostname
      @logger   = logger # left out of options so it does not conflict with Net::SSH own options hash
    end

    def execute(command)
      ssh = Net::SSH.start(@hostname, @user, @options)
      @logger.info "Executing SSH command: #{command}"
      stdout      = ''
      stderr      = ''
      @exit_code   = nil
      @exit_signal = nil
      ssh.open_channel do |channel|
        channel.exec(command) do |_ch, success|
          abort "FAILED: couldn't execute command: (#{command})" unless success
          channel.on_data { |_ch, data| stdout += data }
          channel.on_extended_data { |_ch, _type, data| stderr += data }
          channel.on_request('exit-status') { |_ch, data| @exit_code = data.read_long }
          channel.on_request('exit-signal') { |_ch, data| @exit_signal = data.read_long }
        end
      end
      ssh.loop

      if stderr.size > 0
        @logger.error "#{@exit_code} #{stderr}"
      elsif @exit_code != 0
        @logger.info "SSH Completed with non-zero exit code '#{@exit_code}'"
      end
      if stdout.size > 0
        @logger.info "#{stdout}"
      end

      stdout # TODO: return everything instead of just stdout
    end
  end
end
