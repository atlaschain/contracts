pragma solidity ^0.4.0;
import "mortal.sol";

contract GeoJson is mortal{
  address creator;
  event new_json_added(uint _geojson_count, string _datum);
  string[] public geojson;
  function GeoJson(){
    creator = msg.sender;
  }
  function add_json_datum(string datum)returns (uint){
    uint count = geojson.push(datum);
    new_json_added(count, datum);
    return count;
  }

  function geojson_count() returns(uint){
    return geojson.length;
  }

}
