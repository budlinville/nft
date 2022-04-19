// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Connector.sol';

contract Kryptobird is ERC721Connector {
	string[] public kryptoBirdz;

	mapping(string => bool) _kyrptoBirdzExists;

	function mint(string memory _kryptoBird) public {
		require(!_kyrptoBirdzExists[_kryptoBird], 'Error - kryptoBird already exists');

		kryptoBirdz.push(_kryptoBird);
		uint _id = kryptoBirdz.length - 1;
		_mint(msg.sender, _id);

		_kyrptoBirdzExists[_kryptoBird] = true;
	}

	constructor() ERC721Connector('KryptoBird', 'KBIRDZ') {}
}