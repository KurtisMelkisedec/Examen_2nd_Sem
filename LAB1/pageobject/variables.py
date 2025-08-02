PRODUCT_VALID = {
    "id": 1001,
    "title": "Valid Product",
    "price": 18.99,
    "description": "Test OK",
    "category": "test",
    "image": "https://image.url"
}

PRODUCT_MISSING = {
    "price": 19.99
}

PRODUCT_INVALID = {
    "id": 1002,
    "title": 123,
    "price": "abc"
}

PRODUCT_UPDATE_VALID = {"price": 29.50}
PRODUCT_UPDATE_INVALID = {"price": "badvalue"}

USER_VALID = {
    "id": 2001,
    "email": "mary@example.com",
    "username": "mary",
    "password": "secure123",
    "name": "Mary B",
    "address": "123 Main St",
    "phone": 123-456-7890
}

USER_MISSING = {"username": "missingpass"}
USER_INVALID = {"id": 2002, "username": 456, "password": True}
USER_UPDATE_VALID = {"username": "updateduser"}
USER_UPDATE_INVALID = {"username": 12345}

CART_VALID = {
    "id": 3001,
    "userId": 2001,
    "date": "2025-07-28",  # ← par exemple aujourd’hui
    "products": [{"productId": 1001, "quantity": 2}]
}
CART_MISSING = {"id": 3002, "products": [{"productId": 1001}]}
CART_INVALID = {"id": 3003, "userId": "bad", "products": "invalid"}
CART_UPDATE_VALID = {"products": [{"productId": 1002, "quantity": 5}]}
CART_UPDATE_INVALID = {"products": "notalist"}

AUTH_VALID = {"username": "johnd", "password": "m38rmF$"}
AUTH_MISSING = {"username": "johnd"}
AUTH_INVALID = {"username": 123, "password": True}
AUTH_UPDATE_VALID = {"password": "newpass"}
AUTH_UPDATE_INVALID = {"password": 1234}