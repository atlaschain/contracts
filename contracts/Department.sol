pragma solidity ^0.4.0;
import "Profile.sol";
import "GeoJson.sol";
import "ArrayUtils.sol";
contract Department{
  using ArrayUtils for address[];
  address creator;
  address[] members;
  mapping(address => uint)  admins;
  mapping(address => address) geojson_contracts;
  Profile profiles;
  function Department( ){
    creator = msg.sender;
    admins[creator] = 1;
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

  /*doesnt work TODO*/
  function remove_member(address _member) returns (bool){
    if (admins[msg.sender] == 1){
      admins[_member] = 0;
      uint index =0;// members.IndexOf( _member);
      if(index == uint(-1))
      return false;
      delete members[index];
      return true;
      /*members.length--;*/
    }
    else{
      return false;
    }
  }

}
