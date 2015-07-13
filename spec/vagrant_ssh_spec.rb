describe VagrantSsh::Shell do
  let(:credentials) { { :user => 'vagrant', :password => 'vagrant' } }
  let(:nil_logger) { Logger.new(nil) }
  let(:host) { '33.33.33.33' }

  it 'defaults to the standard Vagrant credentials' do
    expect(VagrantSsh::Shell.new(host, nil_logger).options).to eq credentials
  end

  it 'should interface with a Vagrant VM correctly' do
    @ssh = VagrantSsh::Shell.new(host, nil_logger, credentials)
    expect(@ssh.execute('whoami').strip).to eq 'vagrant'
  end
end
