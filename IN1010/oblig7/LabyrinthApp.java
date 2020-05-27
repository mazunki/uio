import javafx.application.Application;
import javafx.scene.*;
import javafx.scene.layout.*;
import javafx.scene.control.*;
import javafx.stage.*;
import javafx.fxml.FXMLLoader;

import java.net.*;
import java.net.*;
import java.io.*;

public class LabyrinthApp extends Application {
	Scene homeScene;
	Stage myWindow;
	
	Map world;
	BFSSolver solver;
	FXMLLoader loader;

	public static void main(String[] args) {
		LabyrinthApp lbApp = new LabyrinthApp();
		lbApp.solver = new BFSSolver();
		lbApp.loader = new FXMLLoader();

		lbApp.launch();
	}

	@Override
	public void start(Stage primaryStage) throws MalformedURLException, IOException {
		VBox homeLayout = loader.load(new File("layouts/home.fxml").toURI().toURL());
		this.homeScene = new Scene(homeLayout);

		primaryStage.setScene(this.homeScene);
		primaryStage.setTitle("LabyrinthApp! \u2014 mazunki");
		primaryStage.show();
	}


}