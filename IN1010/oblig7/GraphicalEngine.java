import javafx.scene.layout.GridPane;

import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.RowConstraints;
import javafx.scene.layout.Priority;

import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.Region;
import javafx.scene.paint.Color;

import javafx.scene.shape.Rectangle;
import java.util.LinkedList;
import java.util.ArrayList;

import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.event.EventHandler;


public class GraphicalEngine {
    public GraphicalEngine() {}

    public static GridPane makeTable(LabyrinthGUI lb, Map world) {
        int nWidth = world.getWidth();
        int nHeight = world.getHeight();
        double cWidth = 30.0d;
        double cHeight = 30.0d;

        final LabyrinthGUI lbGUI = lb;

        final GridPane table = new GridPane();//GraphicalEngine.getTable();
        for (int i=0; i<nWidth; i++) {
            ColumnConstraints cc = new ColumnConstraints(cWidth);
            //cc.setFillWidth(true);
            cc.setHgrow(Priority.ALWAYS);
            table.getColumnConstraints().add(cc);
        }

        for (int j=0; j<nHeight; j++) {
            RowConstraints rc = new RowConstraints(cHeight);
            //rc.setFillHeight(true);
            rc.setVgrow(Priority.ALWAYS);
            table.getRowConstraints().add(rc);
        }

        table.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                if(mouseEvent.getButton().equals(MouseButton.PRIMARY)){
                    Region regionClicked = (Region) mouseEvent.getPickResult().getIntersectedNode();
                    boolean solutionPath = false;
                    if (regionClicked.getBackground().getFills().get(0).getFill() == Color.CYAN || 
                        regionClicked.getBackground().getFills().get(0).getFill() == Color.YELLOW) {
                        solutionPath = true;
                    }
                    int j = table.getRowIndex(regionClicked);
                    int i = table.getColumnIndex(regionClicked);
                    

                    if ((lbGUI.playerX == i) && (lbGUI.playerY == j)) {
                        lbGUI.playerY = j;
                        lbGUI.playerX = i;
                        if (solutionPath) {
                            lbGUI.nextSolution();
                        } else {
                            lbGUI.showSolved();
                        }
                    } else {
                        if (lbGUI.world.get(j,i) instanceof Wall) {
                            System.out.println("boink!");
                        } else {
                            lbGUI.playerY = j;
                            lbGUI.playerX = i;
                            lbGUI.updateScene();
                        }
                    }
                } else {
                    lbGUI.returnHome();
                }
            }
        });

        return table;
    }

    public static GridPane fillTable(LabyrinthGUI lbGUI, GridPane table, Map world, int startX, int startY) {
        int nWidth = world.getWidth();
        int nHeight = world.getHeight();
        double cWidth = 30.0d;
        double cHeight = 30.0d;

        for (int i=0; i<nWidth; i++){
            for (int j=0; j<nHeight; j++){
                
                Region cell = new Region();
                Tile tile = world.get(j, i);
                if ((i == startX) && (j == startY)) {
                    cell.setBackground(new Background(new BackgroundFill(Color.GREEN, null, null)));
                }
                else if (tile instanceof Wall) {
                    cell.setBackground(new Background(new BackgroundFill(Color.BLACK, null, null)));
                }
                else if (tile instanceof Opening) {
                    cell.setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
                }
                else if (tile instanceof Path) {
                    cell.setBackground(new Background(new BackgroundFill(Color.BROWN, null, null)));
                }


                cell.setPrefSize(cWidth, cHeight);


                table.add(cell, i, j);
            }
        }
        return table;
    }

    public static GridPane fillTable(LabyrinthGUI lbGUI, GridPane table, Map world, ArrayList<Tile> marked) {
        int nWidth = world.getWidth();
        int nHeight = world.getHeight();
        double cWidth = 30.0d;
        double cHeight = 30.0d;

        GridPane filledTable = makeTable(lbGUI, world);

        for (int i=0; i<nWidth; i++){
            for (int j=0; j<nHeight; j++){
                Region cell = new Region();
                Tile tile = world.get(j, i);

                if (tile instanceof Wall) {
                    cell.setBackground(new Background(new BackgroundFill(Color.BLACK, null, null)));
                }
                else if (tile instanceof Opening) {
                    cell.setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
                } 
                else if ((tile instanceof Path) && marked.contains(tile) ) {
                    cell.setBackground(new Background(new BackgroundFill(Color.RED, null, null)));
                }
                else if (tile instanceof Path) {
                    cell.setBackground(new Background(new BackgroundFill(Color.BROWN, null, null)));
                }


                cell.setPrefSize(cWidth, cHeight);


                filledTable.add(cell, i, j);
            }
        }
        return filledTable;
    }

    public static GridPane fillTable(LabyrinthGUI lbGUI, GridPane table, Map world, LinkedList<Tile> solution) {
        int nWidth = world.getWidth();
        int nHeight = world.getHeight();
        double cWidth = 30.0d;
        double cHeight = 30.0d;

        GridPane filledTable = makeTable(lbGUI, world);

        for (int i=0; i<nWidth; i++){
            for (int j=0; j<nHeight; j++){
                Region cell = new Region();
                Tile tile = world.get(j, i);

                if (tile instanceof Wall) {
                    cell.setBackground(new Background(new BackgroundFill(Color.BLACK, null, null)));
                }
                else if (tile instanceof Opening) {
                    cell.setBackground(new Background(new BackgroundFill(Color.YELLOW, null, null)));
                } 
                else if ((tile instanceof Path) && solution.contains(tile) ) {
                    cell.setBackground(new Background(new BackgroundFill(Color.CYAN, null, null)));
                }
                else if (tile instanceof Path) {
                    cell.setBackground(new Background(new BackgroundFill(Color.BROWN, null, null)));
                }


                cell.setPrefSize(cWidth, cHeight);


                filledTable.add(cell, i, j);
            }
        }
        return filledTable;
    }

    public static void updateTile(GridPane table, int i, int j) {
        Region cell = new Region();
        cell.setBackground(new Background(new BackgroundFill(Color.rgb(32,60,120), null, null)));
        System.out.println("update");
        table.setRowIndex(cell, i);
        table.setColumnIndex(cell, j);
    }
}