pragma solidity ^0.4.0;
import "ArrayUtils.sol";
contract Profile{
  struct Info{
    string name;
    string public_key;
    address[] subscriptions;
  }
  mapping(address => Info) profiles;

  function add_my_info(string _name, string _public_key,address[] _subscriptions){
    profiles[msg.sender] = Info({name: _name, public_key: _public_key, subscriptions: _subscriptions});
  }

  function add_subscription(address _user, address _subscription) returns(uint){
    return profiles[_user].subscriptions.push(_subscription);
  }

  function name(address _user) returns(string _name){
    return profiles[_user].name;
  }

  function public_key(address _user) returns (string _key){
    return profiles[_user].public_key;
  }

  function subscriptions(address _user) returns(address[] subscriptions){
    return profiles[_user].subscriptions;
  }

  /*Doesnt work TODO*/
  function remove_subscription(address _subscription, address _user){
    /*uint index = ArrayUtils.IndexOf(profiles[_user].subscriptions, _subscription);
    while (index < profiles[_user].subscriptions.length-1) {
      profiles[_user].subscriptions[index] = profiles[_user].subscriptions[index + 1];
      index++;
    }
    profiles[_user].subscriptions.length-- ;*/
  }
}
