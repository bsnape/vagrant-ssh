describe Vagrant::SSH::Shell do

  before(:all) do
    ENV['VAGRANT_CWD'] = File.expand_path('spec/support')
    `vagrant up`
  end

  after(:all) do
    `vagrant destroy -f`
  end

  it 'should interface with a Vagrant VM correctly' do
    @ssh = Vagrant::SSH::Shell.new('33.33.33.33', Logger.new(nil), {:user => 'vagrant', :password => 'vagrant'})
    @ssh.execute('whoami').strip.should == 'vagrant'
  end

end
