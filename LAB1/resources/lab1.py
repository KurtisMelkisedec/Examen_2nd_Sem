from pymongo import MongoClient
from bson.objectid import ObjectId
from robot.api.deco import keyword
import pymongo.errors

MONGO_URI = "mongodb+srv://marieisidk:marielab1@clusterlab1.zelfuog.mongodb.net/"
DB_NAME = "Lab1"

def get_collection(name):
    client = MongoClient(MONGO_URI)
    return client[DB_NAME][name]

def safe_insert(collection, data, required_fields, field_types=None):
    try:
        for field in required_fields:
            if field not in data:
                return None
        if field_types:
            for field, expected_type in field_types.items():
                if not isinstance(data.get(field), expected_type):
                    return None
        return collection.insert_one(data).inserted_id
    except Exception:
        return None


def safe_find(collection, field, value):
    try:
        return collection.find_one({field: value})
    except Exception:
        return None

def safe_update(collection, field, value, data, allowed_fields_with_types):
    try:
        for k, v in data.items():
            if k not in allowed_fields_with_types:
                return 0
            expected_type = allowed_fields_with_types[k]
            if not isinstance(v, expected_type):
                return 0
        return collection.update_one({field: value}, {"$set": data}).modified_count
    except Exception:
        return 0


def safe_delete(collection, field, value):
    try:
        return collection.delete_one({field: value}).deleted_count
    except Exception:
        return 0

# =========================
# PRODUCTS
# =========================
@keyword("Creer un produit")
def creer_produit(data):
    return safe_insert(get_collection("products"), data, ["id", "title", "price", "description", "category", "image"])

@keyword("Lire un produit")
def lire_produit(pid):
    try:
        pid = int(pid)
    except:
        return None
    return safe_find(get_collection("products"), "id", pid)

@keyword("Maj un produit")
def maj_produit(pid, data):
    try:
        pid = int(pid)
    except:
        return 0

    allowed_fields = {
        "title": str,
        "price": (int, float),
        "description": str,
        "category": str,
        "image": str
    }

    return safe_update(get_collection("products"), "id", pid, data, allowed_fields)

@keyword("Supprimer un produit")
def supprimer_produit(pid):
    try:
        pid = int(pid)
    except:
        return 0
    return safe_delete(get_collection("products"), "id", pid)
# =========================
# USERS
# =========================
@keyword("Creer un user")
def creer_user(data):
    return safe_insert(get_collection("users"), data, ["id", "email", "username", "password", "name", "address", "phone"])

@keyword("Lire un user")
def lire_user(uid):
    try:
        uid = int(uid)
    except:
        return None
    return safe_find(get_collection("users"), "id", uid)

@keyword("Maj un user")
def maj_user(uid, data):
    try:
        uid = int(uid)
    except:
        return 0
    return safe_update(
        get_collection("users"),
        "id",
        uid,
        data,
        {
            "email": str,
            "username": str,
            "password": str,
            "name": str,
            "address": str,
            "phone": int
        }
    )

@keyword("Supprimer un user")
def supprimer_user(uid):
    try:
        uid = int(uid)
    except:
        return 0
    return safe_delete(get_collection("users"), "id", uid)


# =========================
# CARTS
# =========================
@keyword("Creer un cart")
def creer_cart(data):
    return safe_insert(get_collection("carts"), data, ["id", "userId", "date", "products"])

@keyword("Lire un cart")
def lire_cart(cid):
    try:
        cid = int(cid)
    except:
        return None
    return safe_find(get_collection("carts"), "id", cid)


@keyword("Maj un cart")
def maj_cart(cid, data):
    try:
        cid = int(cid)
    except:
        return 0
    return safe_update(
        get_collection("carts"),
        "id",
        cid,
        data,
        {
            "userId": int,
            "date": str,
            "products": list
        }
    )



@keyword("Supprimer un cart")
def supprimer_cart(cid):
    try:
        cid = int(cid)
    except:
        return 0
    return safe_delete(get_collection("carts"), "id", cid)

# =========================
# AUTH
# =========================
@keyword("Creer auth")
def creer_auth(data):
    return safe_insert(
        get_collection("auth"),
        data,
        ["username", "password"],
        {"username": str, "password": str}
    )

@keyword("Lire auth")
def lire_auth(username):
    return safe_find(get_collection("auth"), "username", username)

@keyword("Maj auth")
def maj_auth(username, data):
    if not isinstance(username, str):
        return 0
    if "password" in data and not isinstance(data["password"], str):
        return 0

    allowed_fields = {
        "password": str
    }

    return safe_update(
        get_collection("auth"),
        "username",
        username,
        data,
        allowed_fields
    )



@keyword("Supprimer auth")
def supprimer_auth(username):
    return safe_delete(get_collection("auth"), "username", username)
