pragma solidity ^0.4.0;
contract GeoJson{
  address creator;

  string[] geojson;
  function GeoJson(){
    creator = msg.sender;
  }
  function add_json_datum(string data)returns (uint){
    return geojson.push(data);
  }
}

contract Department{
  address creator;
  address[] members;
  mapping(address => uint)  admins;
  mapping(address => address) geojson_contracts;
  function Department(){
    creator = msg.sender;
    admins[creator] = 1;
  }
  function add_member(address _member)returns (uint){
    if (admins[msg.sender] == 1){
      address geo_contract = new GeoJson();
      geojson_contracts[_member] = geo_contract;
      return members.push(_member);
    }
    else{
      return 0;
    }
  }

  function get_members()returns (address[]){
    return members;
  }
  function get_my_subscription() returns(address){
    return   geojson_contracts[msg.sender];
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

}
