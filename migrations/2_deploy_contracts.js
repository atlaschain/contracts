module.exports = function(deployer) {
  deployer.deploy(ArrayUtils);
  deployer.deploy(mortal);
  deployer.deploy(GeoJson);
  deployer.deploy(Profile);
  deployer.deploy(Department, "default");
  deployer.autolink();
  deployer.then(function(){
    var d = Department.deployed();
    d.set_profile_contract(Profile.address);
    console.log(Department.deployed())
  });
};
