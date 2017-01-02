module.exports = function(deployer) {
  deployer.deploy(ArrayUtils);
  deployer.autolink();
  deployer.deploy(Profile);
  deployer.autolink();
  deployer.deploy(Department);
};
