# 🎬 CineMatch — Movie Recommendation System

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.8%2B-3776AB?style=for-the-badge&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/Streamlit-FF4B4B?style=for-the-badge&logo=streamlit&logoColor=white" />
  <img src="https://img.shields.io/badge/Scikit--Learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white" />
  <img src="https://img.shields.io/badge/TMDB_API-01B4E4?style=for-the-badge&logo=themoviedatabase&logoColor=white" />
  <img src="https://img.shields.io/badge/NLTK-154f3c?style=for-the-badge&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/License-MIT-22c55e?style=for-the-badge" />
</p>

<p align="center">
  <b>A content-based movie recommendation engine powered by Machine Learning and NLP.</b><br/>
  Pick a movie — get five handpicked matches in seconds, complete with live posters.
</p>

<p align="center">
  <a href="#-demo">Demo</a> •
  <a href="#-features">Features</a> •
  <a href="#-how-it-works">How It Works</a> •
  <a href="#-installation--setup">Installation</a> •
  <a href="#-api-setup-tmdb">API Setup</a> •
  <a href="#-future-improvements">Roadmap</a>
</p>

---

## 📸 Demo

> 📌 Run the app, take a screenshot, save it as `screenshot.png` in the root folder, then replace this block:
>
> ```markdown
> ![CineMatch Demo](screenshot.png)
> ```

---

## ✨ Features

| # | Feature | Detail |
|---|---------|--------|
| 🎯 | **Content-Based Filtering** | Recommends by metadata similarity — no user history needed |
| ⚡ | **Instant Results** | Precomputed 5000×5000 cosine similarity matrix, loaded at startup |
| 🎥 | **Live Movie Posters** | Fetched in real time from the TMDB API using each film's ID |
| 🧠 | **NLP-Powered Tags** | Genres, keywords, cast, director, and overview fused into one feature vector |
| 🖥️ | **Dark Cinema UI** | Streamlit frontend with a cinematic dark theme and 5-column poster grid |
| 📦 | **Pickle Persistence** | Trained artifacts loaded on startup — zero-latency inference |

---

## 🛠️ Tech Stack

| Technology | Version | Role |
|---|---|---|
| **Python** | 3.8+ | Core language |
| **Streamlit** | Latest | Browser-based frontend |
| **Pandas** | Latest | Data loading & DataFrame manipulation |
| **NumPy** | Latest | Numerical operations |
| **Scikit-learn** | Latest | CountVectorizer & Cosine Similarity |
| **NLTK** | Latest | Tokenization, stopword removal, stemming |
| **Requests** | Latest | HTTP calls to TMDB API |
| **Pickle** | Built-in | Serializing & loading model files |
| **TMDB API** | v3 | Live movie poster images |

---

## 📂 Project Structure

```
Movie_Recomended_System/
│
├── Development/
│   ├── app.py               # ← Streamlit frontend (UI + recommendation logic + poster fetching)
│   ├── requirements.txt     # Python dependencies
│   ├── setup.sh             # Streamlit server config (headless mode for deployment)
│   └── .gitignore           # Git ignore rules
│
├── movie_dict.pkl           # Pickled dict of processed movie data (loaded as DataFrame at runtime)
├── similarity.pkl           # Pickled cosine similarity matrix (5000 × 5000, precomputed)
├── procfile                 # Process config for cloud deployment (e.g., Heroku)
└── venv/                    # Python virtual environment (not tracked in git)
```

---

## 🧠 How It Works

The engine uses **content-based filtering** — it learns what a movie *is*, not what users *rated* it.

```
Raw TMDB Data  →  Preprocessing  →  NLP Pipeline  →  Vectorization  →  Cosine Similarity  →  .pkl Files
                                                                                                    ↓
                                                                               Streamlit App loads .pkl
                                                                                    ↓
                                                              User selects movie  →  Top 5 matches  →  TMDB posters
```

### Step-by-Step

**1 — Data Ingestion**
The TMDB 5000 Movie Dataset from Kaggle is loaded. It contains metadata for ~5,000 films including title, genres, keywords, cast, crew, and plot overview.

**2 — Feature Engineering**
Genres, keywords, top 3 cast members, director name, and the plot overview are extracted and merged into a single `tags` column — one rich text blob per movie.

**3 — NLP Pipeline**
Each `tags` string is processed with:
- **Tokenization** — split into individual words
- **Stopword Removal** — common low-value words are filtered out
- **Porter Stemming** — words reduced to root form (`"dancing"` → `"danc"`) for better matching across variations

**4 — Vectorization**
Processed tags are converted into numerical vectors using **CountVectorizer (Bag of Words)** from Scikit-learn, producing a sparse feature matrix of shape `(5000, vocab_size)`.

**5 — Cosine Similarity**
Cosine similarity is computed across all movie vectors, producing a `5000 × 5000` matrix. Each value represents the similarity score between two films.

**6 — Persistence**
- `movie_dict.pkl` — processed movie metadata
- `similarity.pkl` — the full similarity matrix

**7 — Runtime (app.py)**
1. Both `.pkl` files are loaded into memory
2. User picks a movie from the dropdown
3. On button click — the selected movie's row in the similarity matrix is retrieved
4. Top 5 most similar movies are identified (excluding the selected film itself)
5. Their posters are fetched live from TMDB using `movie_id`
6. Results rendered in a 5-column poster grid

---

## ⚙️ Installation & Setup

### Prerequisites
- Python 3.8 or higher
- pip
- A TMDB API key 
- The `.pkl` model files 

---

### 1 · Clone the Repository

```bash
git clone https://github.com/your-username/Movie_Recomended_System.git
cd Movie_Recomended_System
```

### 2 · Create & Activate a Virtual Environment

```bash
python -m venv venv
```

| OS | Command |
|----|---------|
| Windows | `venv\Scripts\activate` |
| macOS / Linux | `source venv/bin/activate` |

### 3 · Install Dependencies

```bash
pip install -r Development/requirements.txt
```

### 4 · Add Your TMDB API Key

Open `Development/app.py` and find the `fetch_poster` function. Replace the key:

```python
# Before
'https://api.themoviedb.org/3/movie/{}?api_key=YOUR_API_KEY_HERE'.format(movie_id)

# After
'https://api.themoviedb.org/3/movie/{}?api_key=abc123youractualkey'.format(movie_id)
```

### 5 · Run the App

```bash
cd Development
streamlit run app.py
```

App opens automatically at **http://localhost:8501**

---

## 📦 Requirements

**`requirements.txt`**

```txt
streamlit
pandas
numpy
scikit-learn
nltk
requests
```

Install with:

```bash
pip install -r requirements.txt
```

> 💡 For a fully pinned, reproducible environment run `pip freeze > requirements.txt` after setup.

---

## 🔑 API Setup (TMDB)

Movie posters are fetched live via the [TMDB API](https://www.themoviedb.org/documentation/api) — free to use.

1. Sign up at [https://www.themoviedb.org/signup](https://www.themoviedb.org/signup)
2. Go to **Settings → API** and request a Developer API key
3. Copy your **API Key (v3 auth)**
4. Paste it into `fetch_poster()` in `app.py` as shown above

> ⚠️ **Never commit your real API key to a public repo.** Use environment variables or a `.env` file for any deployment.

---

## 🧪 Generate Model Files

The `.pkl` files are **not included** in the repo due to file size. Generate them from the training notebook:

**Step 1** — Open the notebook in Google Colab:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1_s8cX7jUWcaUyXBCNj9eo4OU6HN3oFpm?usp=sharing)

**Step 2** — Run all cells. The notebook downloads the [TMDB 5000 Movie Dataset](https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata) from Kaggle and produces:
- `movie_dict.pkl`
- `similarity.pkl`

**Step 3** — Download both files and place them in the project root:

```
Movie_Recomended_System/
├── movie_dict.pkl     ✅ here
├── similarity.pkl     ✅ here
└── Development/
    └── app.py
```

---

## 🎮 Usage

1. Launch the app: `streamlit run app.py`
2. A dropdown lists all ~5,000 available movies
3. Select any title
4. Click **"✨ Discover Recommendations"**
5. Five similar movies appear with live posters in a row

---

## 🚀 Future Improvements

- **Hybrid Filtering** — combine content-based with collaborative filtering using user ratings for sharper, personalised picks
- **TF-IDF Vectorization** — replace CountVectorizer with TF-IDF to better weight rare, distinctive terms and reduce noise from common words
- **Search-as-you-type** — replace the static dropdown with a live fuzzy-search input for faster movie selection
- **Movie Detail Cards** — show IMDb rating, release year, runtime, and genre tags on hover without leaving the page
- **Cloud Deployment** — push to Streamlit Community Cloud or Railway for a public URL with zero local setup required
- **Expanded Features** — add release year, language, runtime, and user review sentiment as additional similarity signals

---

## 👤 Author

**Muhammad Akmal**
Machine Learning Enthusiast · Open to Opportunities

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/your-username)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-linkedin)

---

<p align="center">
  Made with ❤️ and 🎬 by <strong>Muhammad Akmal</strong>
</p>
