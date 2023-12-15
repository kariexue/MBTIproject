MBTI and Spotify project:

The aim of this project is to investigate associations between Myers–Briggs Type Indicator (MBTI) types and music taste according to personalized spotify playlists. We are interested to see if a particular MBTI or any of the four personality categories are more likely to appreciate a specific music attribute, such as acousticness, speechiness, and danceability. We will generate various tables and figures to aid our investigations.


Getting Started
===============

Clone the github repository to a local directory.

```
git clone https://github.com/kariexue/MBTIproject.git
```

Build the docker image by typing:
```
docker build . -t mbtiproj
```

And then start an RStudio by typing:

```
docker run -v $(pwd):/home/rstudio/work -e PASSWORD=<some-password> --rm -p 8787:8787 mbtiproj
```

Once the Rstudio is running connect to it by visiting
https://localhost:8787 in your browser. 

To build the final report, visit the terminal in RStudio and type

```
cd work
make clean
make mbtiproject.pdf
```
