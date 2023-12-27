# functionsanderrors

## Online Store Smart Contract

This Solidity smart contract represents a basic online store on the Ethereum blockchain. Users can interact with the contract to add items to their cart, apply coupons for discounts, and complete the checkout process.

## Features

- **Add Item to Cart**: Users can add items to their cart by specifying the product ID and quantity.

- **Apply Coupon**: Users can apply a coupon code to receive a discount on their total purchase.

- **Checkout**: Users can complete the checkout process, ensuring that their shopping cart is not empty, and the order total is calculated correctly.

## Usage

1. **Initialize Contract**: Deploy the contract on the Ethereum blockchain. This can be done using tools like Remix or Truffle.

2. **Set Product Prices**: In the constructor, predefined items ("water," "juice," and "alcohol") are assigned prices. Customize these prices as needed.

3. **Interact with the Contract**:
   - Use the `addItemToCart` function to add items to the shopping cart.
   - Apply a coupon using the `applyCoupon` function.
   - Complete the checkout with the `checkout` function.

## Smart Contract Functions

- **addItemToCart(productId, quantity)**: Add items to the shopping cart.

- **applyCoupon(couponCode)**: Apply a coupon for a discount.

- **checkout()**: Complete the checkout process, ensuring a non-empty cart and correct order total.

## Error Handling

The contract uses `require`, `revert`, and `assert` for error handling:
- **`require`**: Validates the product and quantity in `addItemToCart` and ensures a non-empty cart in `checkout`.
- **`revert`**: Used in `applyCoupon` to revert the transaction if an invalid coupon code is provided.
- **`assert`**: Ensures that the order total is greater than 0 in `checkout` as an additional check for correct order calculation.

