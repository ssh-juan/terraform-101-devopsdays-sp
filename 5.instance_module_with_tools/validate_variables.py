# validate_variables.py
import os

required_vars = ["ENVIRONMENT", "INSTANCE_TYPE"]

for var in required_vars:
    if var not in os.environ:
        print(f"[WARN] {var} não configurada")
