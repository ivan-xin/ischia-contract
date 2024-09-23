// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  0.8.2;

interface  IHetuNFT {
    
    function isOwnerOf(address, uint256) external view returns (bool);
    function getNftNumMinted() external view returns (uint256);


    // function mint(address account, uint256 powah) external returns (uint256);
    // function mintBatch(address account, uint256 amount, uint256[] calldata powahArr) external returns (uint256[] memory);
    // function burn(address account, uint256 id) external;
    // function burnBatch(address account, uint256[] calldata ids) external;
}