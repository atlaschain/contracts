pragma solidity ^0.4.0;
import "ArrayUtils.sol";
contract Profile{
  struct Info{
    string name;
    string public_key;
    address[] subscriptions;
    address[] departments;
    address[] owned_departments;
  }
  mapping(address => Info) profiles;

  function add_my_info(string _name,
    string _public_key,
    address[] _subscriptions,
    address[] _departments,
    address[] _owned_departments){
      profiles[msg.sender] = Info({
        name: _name,
        public_key: _public_key,
        subscriptions: _subscriptions,
        departments: _departments,
        owned_departments: _owned_departments
        });
      }

      function add_subscription(address _user, address _subscription) returns(uint){
        return profiles[_user].subscriptions.push(_subscription);
      }

      function add_department(address _user, address _department) returns(uint){
        return profiles[_user].departments.push(_department);
      }
      function add_owned_department(address _user, address _department) returns(uint){
        return profiles[_user].owned_departments.push(_department);
      }

      function name(address _user) returns(string _name){
        return profiles[_user].name;
      }

      function public_key(address _user) returns (string _key){
        return profiles[_user].public_key;
      }

      function subscriptions(address _user) returns(address[] _subscriptions){
        return profiles[_user].subscriptions;
      }

      function departments(address _user) returns(address[] _departments){
        return profiles[_user].departments;
      }
      function owned_departments(address _user) returns(address[] _departments){
        return profiles[_user].owned_departments;
      }

      function indexOf(address[] values, address _x)returns (uint){
        for (uint i = 0; i < values.length; i++)
        if (values[i] == _x) return i;
        return uint(-1);
      }
      /*Doesnt work TODO*/
      function remove_subscription(address _subscription, address _user)returns(bool){
        uint index = indexOf(profiles[_user].subscriptions, _subscription);
        if(index == uint(-1))
        return false;
        delete profiles[_user].subscriptions[index];
        return true;
      }
    }
