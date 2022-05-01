// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// TODO : Extract minting to a seperate contract
//				i.e. ERC721Minting is ERC721 { ... }
contract ERC721 {
	event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

	mapping(uint256 => address) private _tokenOwner;
	mapping(address => uint256) private _ownedTokensCount;

	function balanceOf(address owner) public view returns(uint256) {
		require(owner != address(0), 'ERC721: owner does not exist');
		return _ownedTokensCount[owner];
	}

	function ownerOf(uint256 tokenId) public view returns(address) {
		address owner = _tokenOwner[tokenId];
		require(owner != address(0), 'ERC721: owner does not exist');
		return owner;
	}

	function _exists(uint256 tokenId) internal view returns(bool) {
		address owner = _tokenOwner[tokenId];
		return owner != address(0);
	}

	function _mint(address to, uint256 tokenId) internal {
		require(to != address(0), 'ERC721: minting to the zero address');
		require(!_exists(tokenId), 'ERC721: token already minted');
		_tokenOwner[tokenId] = to;
		_ownedTokensCount[to] += 1;

		emit Transfer(address(0), to, tokenId);
	}

}