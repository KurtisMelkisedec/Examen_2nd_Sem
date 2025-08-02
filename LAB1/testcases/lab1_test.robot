*** Settings ***
Library           ../resources/lab1.py
Variables         ../pageobject/variables.py

*** Test Cases ***

# ===========================
# PRODUCTS
# ===========================

Create Product - Valid
    ${id}=    Creer un produit    ${PRODUCT_VALID}
    Should Not Be Equal    ${id}    ${NONE}

Create Product - Missing Field
    ${id}=    Creer un produit    ${PRODUCT_MISSING}
    Should Be Equal    ${id}    ${NONE}

Create Product - Invalid Type
    ${id}=    Creer un produit    ${PRODUCT_INVALID}
    Should Be Equal    ${id}    ${NONE}

Read Product - Valid
    ${p}=    Lire un produit    1001
    Should Not Be Equal    ${p}    ${NONE}
    Should Be Equal    ${p}[title]    Valid Product


Read Product - Nonexistent
    ${p}=    Lire un produit    9999
    Should Be Equal    ${p}    ${NONE}

Read Product - Invalid ID
    ${p}=    Lire un produit    abc
    Should Be Equal    ${p}    ${NONE}

Update Product - Valid
    ${res}=    Maj un produit    1001    ${PRODUCT_UPDATE_VALID}
    Should Be Equal As Integers    ${res}    1

Update Product - Nonexistent
    ${res}=    Maj un produit    9999    ${PRODUCT_UPDATE_VALID}
    Should Be Equal As Integers    ${res}    0

Update Product - Invalid Data
    ${res}=    Maj un produit    1    ${PRODUCT_UPDATE_INVALID}
    Should Be Equal As Integers    ${res}    0

Delete Product - Valid
    ${res}=    Supprimer un produit    1002
    Should Be Equal As Integers    ${res}    1

Delete Product - Nonexistent
    ${res}=    Supprimer un produit    9999
    Should Be Equal As Integers    ${res}    0

Delete Product - Invalid ID
    ${res}=    Supprimer un produit    abc
    Should Be Equal As Integers    ${res}    0

# ===========================
# USERS
# ===========================

Create User - Valid
    ${id}=    Creer un user    ${USER_VALID}
    Should Not Be Equal    ${id}    ${NONE}

Create User - Missing Field
    ${id}=    Creer un user    ${USER_MISSING}
    Should Be Equal    ${id}    ${NONE}

Create User - Invalid Type
    ${id}=    Creer un user    ${USER_INVALID}
    Should Be Equal    ${id}    ${NONE}

Read User - Valid
    ${u}=    Lire un user    2001
    Should Not Be Equal    ${u}    ${NONE}
    Should Be Equal    ${u}[username]    mary

Read User - Nonexistent
    ${u}=    Lire un user    8888
    Should Be Equal    ${u}    ${NONE}

Read User - Invalid ID
    ${u}=    Lire un user    xyz
    Should Be Equal    ${u}    ${NONE}

Update User - Valid
    ${res}=    Maj un user    2001    ${USER_UPDATE_VALID}
    Should Be Equal As Integers    ${res}    1

Update User - Nonexistent
    ${res}=    Maj un user    8888    ${USER_UPDATE_VALID}
    Should Be Equal As Integers    ${res}    0

Update User - Invalid Data
    ${res}=    Maj un user    2001    ${USER_UPDATE_INVALID}
    Should Be Equal As Integers    ${res}    0

Delete User - Valid
    ${res}=    Supprimer un user    2002
    Should Be Equal As Integers    ${res}    1

Delete User - Nonexistent
    ${res}=    Supprimer un user    8888
    Should Be Equal As Integers    ${res}    0

Delete User - Invalid ID
    ${res}=    Supprimer un user    wrong
    Should Be Equal As Integers    ${res}    0

# ===========================
# CARTS
# ===========================

Create Cart - Valid
    ${id}=    Creer un cart    ${CART_VALID}
    Should Not Be Equal    ${id}    ${NONE}

Create Cart - Missing Field
    ${id}=    Creer un cart    ${CART_MISSING}
    Should Be Equal    ${id}    ${NONE}

Create Cart - Invalid Type
    ${id}=    Creer un cart    ${CART_INVALID}
    Should Be Equal    ${id}    ${NONE}

Read Cart - Valid
    ${c}=    Lire un cart    3001
    Should Not Be Equal    ${c}    ${NONE}
    Should Be Equal As Integers    ${c}[userId]    2001

Read Cart - Nonexistent
    ${c}=    Lire un cart    7777
    Should Be Equal    ${c}    ${NONE}

Read Cart - Invalid ID
    ${c}=    Lire un cart    hello
    Should Be Equal    ${c}    ${NONE}

Update Cart - Valid
    ${res}=    Maj un cart    3001    ${CART_UPDATE_VALID}
    Should Be Equal As Integers    ${res}    1

Update Cart - Nonexistent
    ${res}=    Maj un cart    7777    ${CART_UPDATE_VALID}
    Should Be Equal As Integers    ${res}    0

Update Cart - Invalid Data
    ${res}=    Maj un cart    3001    ${CART_UPDATE_INVALID}
    Should Be Equal As Integers    ${res}    0

Delete Cart - Valid
    ${res}=    Supprimer un cart    3004
    Should Be Equal As Integers    ${res}    1

Delete Cart - Nonexistent
    ${res}=    Supprimer un cart    7777
    Should Be Equal As Integers    ${res}    0

Delete Cart - Invalid ID
    ${res}=    Supprimer un cart    nope
    Should Be Equal As Integers    ${res}    0

# ===========================
# AUTH
# ===========================

Create Auth - Valid
    ${id}=    Creer auth    ${AUTH_VALID}
    Should Not Be Equal    ${id}    ${NONE}

Create Auth - Missing Field
    ${id}=    Creer auth    ${AUTH_MISSING}
    Should Be Equal    ${id}    ${NONE}

Create Auth - Invalid Type
    ${id}=    Creer auth    ${AUTH_INVALID}
    Should Be Equal    ${id}    ${NONE}

Read Auth - Valid
    ${a}=    Lire auth    johnd
    Should Not Be Equal    ${a}    ${NONE}
    Should Be Equal    ${a}[password]    m38rmF$

Read Auth - Nonexistent
    ${a}=    Lire auth    unknown
    Should Be Equal    ${a}    ${NONE}

Read Auth - Invalid
    ${a}=    Lire auth    12345
    Should Be Equal    ${a}    ${NONE}

Update Auth - Valid
    ${res}=    Maj auth    johnd    ${AUTH_UPDATE_VALID}
    Should Be Equal As Integers    ${res}    1

Update Auth - Nonexistent
    ${res}=    Maj auth    ghost    ${AUTH_UPDATE_VALID}
    Should Be Equal As Integers    ${res}    0

Update Auth - Invalid Data
    ${res}=    Maj auth    johnd    ${AUTH_UPDATE_INVALID}
    Should Be Equal As Integers    ${res}    0

Delete Auth - Valid
    ${res}=    Supprimer auth    janed
    Should Be Equal As Integers    ${res}    1

Delete Auth - Nonexistent
    ${res}=    Supprimer auth    ghost
    Should Be Equal As Integers    ${res}    0

Delete Auth - Invalid ID
    ${res}=    Supprimer auth    123
    Should Be Equal As Integers    ${res}    0
