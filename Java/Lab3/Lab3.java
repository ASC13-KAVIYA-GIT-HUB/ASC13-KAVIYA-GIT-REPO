
package lab3;

public class Lab3 {

//1. Movie Class ////////////////////////////////////////////////////

    static class Movie {
        private String movieId;
        private String movieName;
        private String producedBy;
        private String directedBy;
        private int duration;
        private int year;
        private String category;
        private static int moviesCount = 0;

        public Movie(String movieName, String producedBy) {
            this.movieName = movieName;
            this.producedBy = producedBy;
            moviesCount++;
            this.movieId = movieName + "_" + moviesCount;
        }

        public Movie(String movieName, String producedBy, String directedBy, int duration, int year, String category) {
            this(movieName, producedBy);
            this.directedBy = directedBy;
            this.duration = duration;
            this.year = year;
            this.category = category;
        }

        public String getMovieId() {
            return movieId;
        }

        public static int getMoviesCount() {
            return moviesCount;
        }

        public void acceptInfo(String directedBy, int duration, int year, String category) {
            this.directedBy = directedBy;
            this.duration = duration;
            this.year = year;
            this.category = category;
        }

        public String showDetails() {
            return "Movie ID: " + movieId +
                   ", Name: " + movieName +
                   ", Produced By: " + producedBy +
                   ", Directed By: " + directedBy +
                   ", Duration: " + duration +
                   ", Year: " + year +
                   ", Category: " + category;
        }
    }

//2. SpecialMovie (Inheritance Example) ////////////////////////////////////////////////////

    static class SpecialMovie extends Movie {
        private String soundEffectsTechnology;
        private String visualEffectsTechnology;

        public SpecialMovie(String movieName, String producedBy, String soundEffectsTechnology, String visualEffectsTechnology) {
            super(movieName, producedBy);
            this.soundEffectsTechnology = soundEffectsTechnology;
            this.visualEffectsTechnology = visualEffectsTechnology;
        }

        public String showDetails() {
            return super.showDetails() +
                   ", Sound Effects: " + soundEffectsTechnology +
                   ", Visual Effects: " + visualEffectsTechnology;
        }
    }

//3. InternationalMovie (Inheritance Example) ////////////////////////////////////////////////////

    static class InternationalMovie extends Movie {
        private String country;
        private String language;

        public InternationalMovie(String movieName, String producedBy, String country, String language) {
            super(movieName, producedBy);
            this.country = country;
            this.language = language;
        }

        public String showDetails() {
            return super.showDetails() +
                   ", Country: " + country +
                   ", Language: " + language;
        }
    }

//4. Main Method (Testing) ////////////////////////////////////////////////////

    public static void main(String[] args) {
        Movie m1 = new Movie("Hello", "XYZ Productions");
        m1.acceptInfo("John Doe", 120, 2023, "Action");
        System.out.println(m1.showDetails());
        System.out.println("Movie ID: " + m1.getMovieId());
        System.out.println("Movies Count: " + Movie.getMoviesCount());

        System.out.println("--------------------------------------------------");

        SpecialMovie sm = new SpecialMovie("Avengers", "Marvel Studios", "Dolby Atmos", "IMAX");
        System.out.println(sm.showDetails());
        System.out.println("Movie ID: " + sm.getMovieId());
        System.out.println("Movies Count: " + Movie.getMoviesCount());

        System.out.println("--------------------------------------------------");

        InternationalMovie im = new InternationalMovie("RRR", "DVV Entertainment", "India", "Telugu");
        System.out.println(im.showDetails());
        System.out.println("Movie ID: " + im.getMovieId());
        System.out.println("Movies Count: " + Movie.getMoviesCount());
    }
}
