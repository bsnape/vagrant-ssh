describe VagrantSsh::Shell do
  subject(:vagrant_ssh) { VagrantSsh::Shell.new(host, nil_logger) }

  let(:credentials) { { :user => 'vagrant', :password => 'vagrant' } }
  let(:nil_logger) { Logger.new(nil) }
  let(:host) { '33.33.33.33' }

  it 'defaults to the standard Vagrant credentials' do
    expect(vagrant_ssh.options).to eq credentials
  end

  it 'should interface with a Vagrant VM correctly' do
    expect(vagrant_ssh.execute('whoami').strip).to eq 'vagrant'
  end
end
