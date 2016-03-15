require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "Test cookbook" do

  it "is HTTPS listening on port 80" do
    expect(port(80)).to be_listening
  end

  it "is HTTPS listening on port 443" do
    expect(port(443)).to be_listening
  end

  it "is Tomcat listening on port 8080" do
    expect(port(8080)).to be_listening
  end
  
  it "has a running service of tomcat" do
    expect(service("tomcat")).to be_running
  end

  it "has a running service of nginx" do
    expect(service("nginx")).to be_running
  end

  it "has a running service of php-fpm" do
    expect(service("php-fpm")).to be_running
  end



end
