control 'cis-fs-1.1.1' do
  impact 1.0
  title 'Filesystem: Use separate partition for /tmp'
  desc "Since the /tmp directory is intended to be world-writable, there is a risk of resource
        exhaustion if it is not bound to a separate partition. In addition, making /tmp its own file
        system allows an administrator to set the noexec option on the mount, making /tmp
        useless for an attacker to install executable code. It would also prevent an attacker from
        establishing a hardlink to a system setuid program and wait for it to be updated. Once the
        program was updated, the hardlink would be broken and the attacker would have his own 
        copy of the program. If the program happened to have a security vulnerability, the attacker
        could continue to exploit the known flaw."
  tag filesystem: 'tmp'

  describe file('/tmp') do
    it { should be_mounted }
  end
end
