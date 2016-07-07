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

control 'cis-fs-1.1.2' do
  impact 1.0
  title 'Filesystem: Set nodev option for /tmp'
  desc "Since the /tmp filesystem is not intended to support devices, set this option to ensure that
        users cannot attempt to create block or character special devices in /tmp."
  tag filesystem: 'tmp'

  describe file('/etc/fstab') do
    its('content') { should match %r(.*/tmp.*nodev.*) }
  end
  describe mount('/tmp') do
    its('options') { should eq 'nodev' }
  end
end

control 'cis-fs-1.1.3' do
  impact 1.0
  title 'Filesystem: Set nosuid option for /tmp'
  desc "Since the /tmp filesystem is only intended for temporary file storage, set this option to
        ensure that users cannot create set userid files in /tmp."
  tag filesystem: 'tmp'

  describe file('/etc/fstab') do
    its('content') { should match %r(.*/tmp.*nosuid.*) }
  end
  describe mount('/tmp') do
    its('options') { should eq 'nosuid' }
  end
end

control 'cis-fs-1.1.4' do
  impact 1.0
  title 'Filesystem: Set noexec option for /tmp'
  desc "Since the /tmp filesystem is only intended for temporary file storage, set this option to
        ensure that users cannot run executable binaries from /tmp."
  tag filesystem: 'tmp'

  describe file('/etc/fstab') do
    its('content') { should match %r(.*/tmp.*noexec.*) }
  end
  describe mount('/tmp') do
    its('options') { should eq 'noexec' }
  end
end
