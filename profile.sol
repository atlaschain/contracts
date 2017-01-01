pragma solidity ^0.4.0;
contract Profile{
  struct Info{
    string name;
    string public_key;
    }
    mapping(address => Info) profiles;
    function add_my_info(string _name, string _public_key){
      profiles[msg.sender] = Info({name: _name, public_key: _public_key});
    }
    function name(address _user) returns(string _name){
      return profiles[_user].name;
    }
    function public_key(address _user) returns (string _key){
      return profiles[_user].public_key;
    }
}
