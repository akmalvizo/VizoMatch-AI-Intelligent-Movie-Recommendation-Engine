mkdir -q ~/.streamlit/

echo "\
[server]\n\
enableCORS = false\n\
headless = true\n\
\n\
" > ~/.streamlit/config.toml