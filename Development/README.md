# 🎬 Movie Recommendation System

A Machine Learning-based **content recommendation system** that suggests similar movies based on user selection using NLP and similarity algorithms.

---

## 🚀 Project Overview

This project is built using the **TMDB 5000 Movie Dataset** and implements a **content-based filtering approach** to recommend movies.

The system analyzes movie metadata such as:
- Genres
- Keywords
- Cast
- Crew
- Overview

It then transforms this data into vectors and computes similarity to recommend the most relevant movies.

---

## 🧠 Machine Learning Approach

- Data Cleaning & Preprocessing  
- Feature Engineering (tags creation)  
- NLP Techniques:
  - Tokenization  
  - Stopword Removal  
  - Stemming (Porter Stemmer)  
- Vectorization using **CountVectorizer (Bag of Words)**  
- Similarity Calculation using **Cosine Similarity**  

---

## ⚙️ Tech Stack

- Python  
- Pandas, NumPy  
- Scikit-learn  
- NLTK  
- Streamlit  
- TMDB API (for posters)

---

## 💡 Features

- 🎯 Content-based movie recommendations  
- ⚡ Fast response using precomputed similarity matrix  
- 🎥 Movie posters fetched via API  
- 🖥️ Interactive UI built with Streamlit  

---

## 📂 Project Structure
Movie_Recomended_System/
│
├── Development/
│ ├── app.py
│ ├── README.md
│ ├── requirements.txt
│ ├── setup.sh
│ └── .gitignore
│
├── venv/
├── movie_dict.pkl # (Not uploaded to GitHub)
├── similarity.pkl # (Not uploaded to GitHub)
└── Procfile
│
└── External Libraries/
└── (IDE/system generated files)


---

## ⚠️ Important Note

- The `.pkl` files are **not uploaded to GitHub** due to size limitations.
- These files must be generated locally.

---

## 🔧 Generate Required Files

Run the model pipeline on Colab (https://colab.research.google.com/drive/1_s8cX7jUWcaUyXBCNj9eo4OU6HN3oFpm?usp=sharing) to generate:

- `movie_dict.pkl`
- `similarity.pkl`

---

## ▶️ How to Run the Project

1. Clone the repository:
```bash
git clone https://github.com/your-username/movie-recommendation-system.git

Navigate to project:
cd Movie_Recomended_System/Development
Install dependencies:
pip install -r requirements.txt
Run the app:
streamlit run app.py
🔑 API Setup

This project uses TMDB API for fetching movie posters.

Create an account on TMDB
Get your API key
Replace it in app.py:
api_key = "your_api_key_here"
📊 Dataset
TMDB 5000 Movie Dataset (https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata)
🎯 Future Improvements
Add collaborative filtering
Use TF-IDF for better accuracy
Deploy on cloud (Streamlit Cloud / AWS)
Improve UI/UX
🙌 Acknowledgements
TMDB for API
Kaggle for dataset
📌 Author

Muhammad Akmal
Machine Learning Enthusiast | Open to Opportunities


---

# 📦 ✅ requirements.txt (Use This)

```txt
streamlit
pandas
numpy
scikit-learn
nltk
requests