describe package('default-jre') do
  it { should be_installed }
end

describe package('docker.io') do
  it { should be_installed }
end

describe package('rkt') do
  it { should be_installed }
end

describe package('qemu-system-x86') do
  it { should be_installed }
end
