
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OnlineStore {
    mapping(address => uint256) public totalPrice;
    mapping(string => uint256) public productPrices;
    mapping(string => uint256) public discounts;

    constructor() {
        // Items
        productPrices["water"] = 10;
        productPrices["juice"] = 20;
        productPrices["alcohol"] = 30;
    }

    function addItemToCart(string memory productId, uint256 quantity) external {
        // Assuming product prices and discounts are predefined
        require(productPrices[productId] > 0, "Invalid product");
        require(quantity > 0, "Quantity must be greater than 0");

        totalPrice[msg.sender] += productPrices[productId] * quantity;
    }

    function applyCoupon(string memory couponCode) external {
        // Check if the coupon code is valid
        if (keccak256(abi.encodePacked(couponCode)) != keccak256(abi.encodePacked("VALIDCOUPON"))) {
            revert("Invalid coupon code");
        }

        // Apply discount
        totalPrice[msg.sender] -= (totalPrice[msg.sender] * discounts[couponCode]) / 100;
    }

    function checkout() external {
        // Ensure the shopping cart is not empty
        require(totalPrice[msg.sender] > 0, "Shopping cart is empty");

        // Calculate order total
        uint256 orderTotal = totalPrice[msg.sender];

        // Additional assertions for correct order calculation
        assert(orderTotal > 0);

        // Reset the shopping cart after successful checkout
        totalPrice[msg.sender] = 0;
    }
}
