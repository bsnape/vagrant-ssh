describe 'a single VM environment' do

  # pointless test right now
  it 'should interface with a Vagrant VM correctly' do
    ENV['VAGRANT_CWD'] = File.expand_path('spec/support')
    @vagrant = Vagrant::SSH::Vagrant.new
    @vagrant.up
    puts @vagrant.status
    #puts ENV['VAGRANT_CWD']
  end

end
