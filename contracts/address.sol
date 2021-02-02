pragma solidity ^0.8.0;

contract AddressBook {
    // Storage
    mapping(address => address[]) private _addresses;
    mapping(address => mapping(address => string)) private _aliases;

    //getting the msg.sender address from storage
    function getAddresses() public view returns (address[] memory) {
        return _addresses[msg.sender];
    }

        // adding adress and name of the address owner into the storage
    function addAddress(address addr, string memory _alias) public {
        _addresses[msg.sender].push(addr);
        _aliases[msg.sender][addr] = _alias;
    }

    // removing a particualar address from storage
    // later on we will set an admin to have the license to remove a particular address from this contract
    // if need for this is urgent and it not forth coming kindly request
    function removeAddress(address addr) public {
        uint length = _addresses[msg.sender].length;
        for(uint i = 0; i < length; i++) {
            if (addr == _addresses[msg.sender][i]) {
                if (1 < _addresses[msg.sender].length && i < length-1) {
                    _addresses[msg.sender][i] = _addresses[msg.sender][length-1];
                }
                delete _addresses[msg.sender][length-1];
                delete _aliases[msg.sender][addr];
                break;
            }
        }
    }

    // getting an address by name from storage.
    function getAlias(address addr) public view returns (string memory) {
        return _aliases[msg.sender][addr];
    }
}