pragma solidity ^0.4.0;
contract GeoJson{
  address creator;

  string[] public geojson;
  function GeoJson(){
    creator = msg.sender;
  }
  function add_json_datum(string data)returns (uint){
    return geojson.push(data);
  }
  
  function geojson_count() returns(uint){
    return geojson.length;
  }
}
