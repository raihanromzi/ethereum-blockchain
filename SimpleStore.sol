// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SimpleStore {

  struct Product {
    uint productID;
    string productName;
    uint productStock;
    uint productPrice;
  }
  Product[] products;
  address private ownerAddress;
  event Log (string status);
  string private status;
  event ProductPurchased(uint productId, string productName, uint productPrice, uint quantity, bool statusOrder);
  uint totalBalance;

  constructor() {
    ownerAddress = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == ownerAddress, "Only Owner!");
    _;
  }

  Product product;

  function addProduct(uint _productID, string memory _productName, uint _productStock, uint weiAmount ) onlyOwner public {
    if (_productStock <= 0) {
      emit Log("Product Stock Must Be Greater Than 0");
    }
    product = Product(uint(_productID), _productName, uint(_productStock), uint(weiAmount));
    products.push(product);
  }

  function buyProduct(uint _productID, uint _productStock) public payable {
    bool statusOrder;

    for (uint256 i = 0; i < products.length; i++) {
        product = products[i];

        if (product.productID == _productID) {
            if (product.productStock < _productStock) {
                revert("Stock is Insufficient!");
            }

            uint totalCost = product.productPrice * _productStock;
            if (msg.value < totalCost) {
                revert("Insufficient Balance!");
            }

            product.productStock -= _productStock;
            statusOrder = true;

            emit ProductPurchased(
                product.productID,
                product.productName,
                product.productPrice,
                _productStock,
                statusOrder
            );

            totalBalance += totalCost;

            if (msg.value > totalCost) {
              payable(msg.sender).transfer(msg.value - totalCost);
            }

            products[i] = product;

            return;
        }
    }

    revert("Product Not Found!");
}


  function checkBalance() public view returns (uint) {
    return totalBalance;
  }

  function showProducts() public view returns (Product[] memory) {
    return products;
  }

  function senderAddress() public view returns (address) {
    return msg.sender;
  }

}
