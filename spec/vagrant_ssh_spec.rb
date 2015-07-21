describe VagrantSsh::Shell do
  subject(:vagrant_ssh) { VagrantSsh::Shell.new(host, logger: nil_logger) }

  let(:credentials) { { user: 'vagrant', password: 'vagrant' } }
  let(:nil_logger) { Logger.new(nil) }
  let(:host) { '33.33.33.33' }

  it 'defaults to the standard Vagrant credentials' do
    expect(vagrant_ssh.options).to eq credentials
  end

  it 'should interface with a Vagrant VM correctly' do
    expect(vagrant_ssh.execute('whoami').strip).to eq 'vagrant'
  end

  context 'when modifying the defaults' do
    let(:non_default_credentials) { { user: 'foo', password: 'bar' } }

    it 'uses the provided credentials' do
      vagrant_ssh = VagrantSsh::Shell.new(host, logger: nil_logger, options: non_default_credentials)
      expect(vagrant_ssh.options[:user]).to eq 'foo'
      expect(vagrant_ssh.options[:password]).to eq 'bar'
    end
  end

  it 'provides the last exit code' do
    vagrant_ssh.execute('exit 1')
    expect(vagrant_ssh.exit_code).to eq 1
  end
end
