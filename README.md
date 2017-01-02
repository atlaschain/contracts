# Atlaschain Smart Contracts
> Solidity Smart Contracts for managing the permissions of users.

This repository consists on individual contracts to manage the permissions and admin rights of the users and departments.

Code is distributed into multiple contracts.

1. [atlaschain.sol](atlaschain.sol)
2. [GeoJson.sol](GeoJson.sol)   
3. [Profile.sol](Profile.sol)
4. [ArrayUtils.sol](ArrayUtils.sol)   

Profile.sol
Every user has a profile which has his name and public key.
An User has many subscriptions which are listed in his profile.

Department.sol
Users are added to a department via add_member function.
This will add the user to the department and subscribes to a new geojson contract.

GeoJson.sol
A separate GeoJson contract exists for each user which has encrypted data that only he can decrypt.
