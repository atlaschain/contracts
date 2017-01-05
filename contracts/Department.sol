pragma solidity ^0.4.0;
import "Profile.sol";
import "GeoJson.sol";
import "ArrayUtils.sol";
contract Department{
  using ArrayUtils for address[];
  address creator;
  address[] members;
  string name;
  mapping(address => uint)  admins;
  mapping(address => address) geojson_contracts;
  Profile profiles;
  function Department(string _name ){
    creator = msg.sender;
    admins[creator] = 1;
    name = _name;
  }
  function get_name() returns(string){
    return name;
  }
  function profile_contract_address() returns(address){
    return profiles;
  }

  function set_profile_contract(address _profile_contract_address){
    profiles = Profile(_profile_contract_address);
  }

  function add_member(address _member)returns (uint){
    if (admins[msg.sender] == 1){
      address geo_contract = new GeoJson();
      geojson_contracts[_member] = geo_contract;
      uint members_count = members.push(_member);
      uint subscription_count =  profiles.add_subscription(_member, geo_contract);
      uint dept_count = profiles.add_department(_member, this);
      return members_count;
    }
    else{
      return 0;
    }
  }
  function get_membership_count() returns(uint){
    return members.length;
  }

  function get_members()returns (address[]){
    return members;
  }

  function get_subscription_for_user(address _user) returns(address){
    return   geojson_contracts[_user];
  }

  function set_admin_status(address _member,uint _admin_status)returns(bool _success){
    if (admins[msg.sender] == 1){
      admins[_member] = _admin_status;
      return true;
    }
    else{
      return false;
    }
  }
  function indexOf(address _x)returns (uint){
    for (uint i = 0; i < members.length; i++)
    if (members[i] == _x) return i;
    return uint(-1);
  }

  function remove_member(address _member) returns (bool){

    if (admins[msg.sender] == 1){
      admins[_member] = 0;
      uint index =indexOf( _member);
      if(index == uint(-1))
      return false;
      profiles.remove_subscription(geojson_contracts[_member], _member);
      GeoJson(geojson_contracts[_member]).kill();
      delete geojson_contracts[_member];
      admins[_member] = 0;
      delete members[index];
      return true;
    }
    else{
      return false;
    }
  }

}
