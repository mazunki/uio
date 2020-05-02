import javafx.application.Application;
import javafx.scene.Scene;

import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.scene.text.Text;
import javafx.scene.text.TextFlow;
import javafx.scene.text.TextAlignment;
import javafx.geometry.Insets;
import javafx.geometry.HPos;
import javafx.geometry.VPos;
import javafx.geometry.Pos;
import javafx.scene.layout.Region;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.paint.Color;

import javafx.scene.input.KeyEvent;
import javafx.scene.input.KeyCode;

import javafx.scene.layout.GridPane;

import javafx.stage.Stage;
import javafx.stage.FileChooser;
import javafx.stage.StageStyle;

import javafx.event.EventHandler;
import javafx.stage.WindowEvent;
import javafx.event.ActionEvent;

import java.io.FileNotFoundException;
import java.io.File;
import java.util.LinkedList;
import java.util.ArrayList;
import java.time.Instant;
import java.time.Duration;

import javafx.application.Platform;
import javafx.concurrent.Task;
import javafx.concurrent.Service;



public class LabyrinthGUI extends Application {
    //LabyrinthGUI mygui;
    Map world;
    BFSSolver solver;
    Labyrinth labyrinth;

    Scene homeScene;
    GridPane table;
    Button quitButton;
    Stage stage;

    int openingCounter;
    int solutionCounter;
    int playerX=-1, playerY=-1;
    ArrayList<GridPane> solutions = new ArrayList<GridPane>();
    ArrayList<Scene> solutionScenes = new ArrayList<Scene>();

    EventHandler<KeyEvent> labKeys;

    @Override
    public void start(Stage stage) throws FileNotFoundException, Error {
        this.stage = stage;

        GridPane home = new GridPane();
        home.setBackground(new Background(new BackgroundFill(Color.rgb(30,60,90), null, null)));
        //home.setGridLinesVisible(true);
        home.setVgap(15.0);
        homeScene = new Scene(home, 600, 400);

        Text welcomeText = new Text("Welcome to the Labyrinth solver!");
        welcomeText.setFill(Color.WHITE);
        TextFlow textHolder = new TextFlow(welcomeText);
        textHolder.setPrefSize(600.0, 30.0);
        textHolder.setBackground(new Background(new BackgroundFill(Color.rgb(20,0,0), null, null)));
        textHolder.setTextAlignment(TextAlignment.CENTER);
        textHolder.setPadding(new Insets(30.0, 0, 30.0, 0));
        home.add(textHolder, 0, 0);

        Text tutorial = new Text("Once playing, press Q to return, \nS to solve, N to loop throuh solutions\n<TAB> to find openings.\n You can also click tiles with mouse. Press again to solve. Right click to return.");
        tutorial.setFill(Color.YELLOW);
        TextFlow tutorialHolder = new TextFlow(tutorial);
        tutorialHolder.setPrefSize(600.0, 30.0);
        tutorialHolder.setBackground(new Background(new BackgroundFill(Color.rgb(30,60,90), null, null)));
        tutorialHolder.setTextAlignment(TextAlignment.CENTER);
        tutorialHolder.setPadding(new Insets(30.0, 0, 30.0, 0));
        home.add(tutorialHolder, 0, 1);

        Button playLabyrinthButton = new Button("Press me to solve a labyrinth!");
        playLabyrinthButton.setPrefSize(250.0, 60.0);
        playLabyrinthButton.setOnAction( ev -> this.generateBoard() );
        home.add(playLabyrinthButton, 0, 2);
        GridPane.setHalignment(playLabyrinthButton, HPos.CENTER);

        quitButton = new Button("Quit!");
        quitButton.setPrefSize(250.0, 60.0);
        quitButton.setOnAction( ev -> stage.close() );
        home.add(quitButton, 0, 3);
        GridPane.setHalignment(quitButton, HPos.CENTER);


        homeScene.setOnKeyPressed(new EventHandler<KeyEvent>() {
            public void handle(KeyEvent ke) {
                System.out.println("Key Pressed: " + ke.getCode());
                if (ke.getCode() == KeyCode.Q) quitButton.fire();
            }
        });

        stage.setScene(homeScene);
        stage.show();
    }

    public static void main(String[] args) {
        System.out.println("Welcome.");
        LabyrinthGUI labyrinth = new LabyrinthGUI(); // 

        labyrinth.launch();
    }

    public void getWorld() throws FileNotFoundException {
        FileChooser fc = new FileChooser();
        fc.setInitialDirectory(new File("./maps/"));
        File labyrinthFile = fc.showOpenDialog(this.stage);
        this.world = new Map(labyrinthFile);

        solutionCounter = 0;
        Tile tile = this.world.findFirstOpening();
        playerX = tile.x;
        playerY = tile.y;
    }

    public void generateBoard() {
        try {
            if ((playerX == -1) || (playerY==-1)){
                getWorld();
            }
        } catch (FileNotFoundException err) {
            System.out.println("File not found, try again.");
            this.stage.setScene(this.homeScene);
            return;
        }
        labKeys = new EventHandler<KeyEvent>() {
            public void handle(KeyEvent ke) {
                if (ke.getCode() == KeyCode.Q) returnHome();
                else if (ke.getCode() == KeyCode.S) showSolved();

                else if (ke.getCode() == KeyCode.UP) {
                    playerY--;
                    if (world.get(playerY, playerX) instanceof Wall) {
                        playerY++;
                    }

                    updateScene();
                }
                else if (ke.getCode() == KeyCode.DOWN) {
                    playerY++;
                    if (world.get(playerY, playerX) instanceof Wall) {
                        playerY--;
                    }
                    updateScene();
                }
                else if (ke.getCode() == KeyCode.LEFT) {
                    playerX--;
                    if (world.get(playerY, playerX) instanceof Wall) {
                        playerX++;
                    }
                    updateScene();
                }
                else if (ke.getCode() == KeyCode.RIGHT) {
                    playerX++;
                    if (world.get(playerY, playerX) instanceof Wall) {
                        playerX--;
                    }
                    updateScene();
                }
                else if (ke.getCode() == KeyCode.TAB) {
                    Tile tile = world.findOpening(openingCounter);
                    openingCounter = (openingCounter + 1) % (world.getOpenings().size());
                    playerX = tile.x;
                    playerY = tile.y;
                    updateScene();
                }
                System.out.printf("%d %d\n", playerX, playerY);
            }
        };

        generateBoard(true);
    }
    public void generateBoard(boolean withFile) {
        table = GraphicalEngine.makeTable(this, this.world);
        table = GraphicalEngine.fillTable(this, table, this.world, playerX, playerY);
        //table.setGridLinesVisible(true);

        Scene labScene = new Scene(table, this.world.getWidth()*30.0d, this.world.getHeight()*30.0d);

        labScene.setOnKeyPressed(labKeys);

        stage.setScene(labScene);
    }
    public void generateBoard(ArrayList<Tile> tiles) {
        table = GraphicalEngine.makeTable(this, this.world);
        table = GraphicalEngine.fillTable(this, table, this.world, tiles);
        //table.setGridLinesVisible(true);

        Scene labScene = new Scene(table, this.world.getWidth()*30.0d, this.world.getHeight()*30.0d);

        labScene.setOnKeyPressed(labKeys);

        stage.setScene(labScene);
    }

    public void returnHome() {
        playerX = -1;
        playerY = -1;
        solutionCounter = -1;
        this.stage.setScene(this.homeScene);
    }

    public void showSolved() {
        // for some reason I can't create the solver in main, as when I try to access it here, it returns null
        this.solver = new BFSSolver();
        this.solver.setStartTile(world.get(playerY, playerX));

        this.solver.attachWorld(this.world);
        // solve here
        System.out.println("A");
        final Thread solverThread = new Thread(this.solver);
        solverThread.start();
        System.out.println("B");

        solutions = new ArrayList<GridPane>();
        solutionScenes = new ArrayList<Scene>();

        LabyrinthGUI self = this;
        Task<Void> task = new Task<Void>() {
            GridPane table;
            Map w;
            BFSSolver solver;
            Stage stage;
            LabyrinthGUI self;
            @Override protected Void call() throws Exception {
                Instant lastUpdate = Instant.now();
                while (solverThread.isAlive()) {
                    if ((this.solver.alreadyHandledTiles != null) && (Duration.between(lastUpdate, Instant.now()).getSeconds() > 0.5 ) ) {
                            System.out.println("update");
                            GridPane griddedSolution = GraphicalEngine.fillTable(self, table, w, solver.alreadyHandledTiles);
                            solutions.add(griddedSolution);
                            Scene sc = new Scene(griddedSolution, w.getWidth()*30.0d, w.getHeight()*30.0d);
                            
                            Platform.runLater( () -> stage.setScene(sc) );

                            solutionScenes.add(sc);
                            lastUpdate = Instant.now();
                    }
                }
                return null;
            }
        };
        new Thread(task).start();

        while (solverThread.isAlive()) {}

        System.out.println(solutions.size());

        for (LinkedList<Tile> solution : this.solver.getWinnerPaths() ){
            GridPane griddedSolution = GraphicalEngine.fillTable(this, this.table, this.world, solution);
            solutions.add(griddedSolution);
            Scene sc = new Scene(griddedSolution, this.world.getWidth()*30.0d, this.world.getHeight()*30.0d);
            sc.setOnKeyPressed(new EventHandler<KeyEvent>() {
                public void handle(KeyEvent ke) {
                    if (ke.getCode() == KeyCode.N) nextSolution();
                    if (ke.getCode() == KeyCode.Q || ke.getCode().isArrowKey()) {
                        generateBoard(true);
                    }
                }}
            );

            solutionScenes.add(sc);
        }

        if (solutions.size() > 0){
            this.stage.setScene(solutionScenes.get(solutionCounter % solutions.size() ));
        } else {
            returnHome();
        }

    }

    public void nextSolution() {
        if (solutions.size() == 0) {
            System.out.println("No solutions");
            return;
        }
        this.solutionCounter = (this.solutionCounter + 1) % solutions.size();
        this.stage.setScene(solutionScenes.get(solutionCounter));
    }
    public void updateScene() {
        generateBoard(true);
    }
    public void updateScene(ArrayList<Tile> tiles) {
        generateBoard(tiles);
    }
}