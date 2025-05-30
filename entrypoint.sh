#!/bin/bash
exec ./llama-server --host 0.0.0.0 -m /models/mistral-7b-instruct-v0.1.Q4_K_M.gguf --port 8001
