<h1>   <img width="200px" src="https://user-images.githubusercontent.com/54272339/216791287-9921585c-7f40-42bc-856d-d15087696182.png"></h1>

## Screens
<table>
  <tr>
   <td><img width="250px" src="https://user-images.githubusercontent.com/54272339/216791668-8d4f547d-4cec-4ec0-bcbe-b8c45a938e77.png"></td>
   <td><img width="250px" src="https://user-images.githubusercontent.com/54272339/216791415-56126a2b-5e5d-457b-8c5b-e428971aa1dc.png"></td>
   <td><img width="250px" src="https://user-images.githubusercontent.com/54272339/216791546-2bb5e688-f2e0-41e7-8aec-6870f3db7d6a.png"></td>
 </tr>
 <tr>
   <td><img width="250px" src="https://user-images.githubusercontent.com/54272339/216791411-61b6d9c9-1d44-4a81-aedf-70e6651574c5.png"></td>
   <td><img width="250px" src="https://user-images.githubusercontent.com/54272339/216791409-2f2b6679-2c8b-4bfb-ab2d-5091d22047b1.png"></td>
   <td><img width="250px" src="https://user-images.githubusercontent.com/54272339/216791406-dd4bc62b-30b8-45fc-b68b-2a586713025c.png"></td>
</tr>
</table>


## Architecture

<img width="400px" src="https://user-images.githubusercontent.com/54272339/216790531-eabf218a-18c5-4557-991e-874462152c85.png">

## Clean Architeture

<h3>Data</h3> The data layer is the outermost layer of the application and is responsible for communicating with the server-side or a local database and data management logic. It also contains repository implementations. 

<h3>Data Source</h3>  Explains the process of obtaining and updating data. It consists of Local Data Sources. SharedPreferences and Json will perform file requests. At the same time, local Data sources cache or persist data.

<h3>Models</h3> An entity will depend on the data acquired from the different data sources. Serialization of JSON structure into Dart maps Entity objects to Models.

<h3>Repository Impl</h3> The connection between the Data layer and the Domain layer is established through repositories, which serve as actual implementations in the Domain layer. These repositories are responsible for bringing data from various sources together.

<h3>Domain</h3> The domain layer is responsible for all the business logic. It is written purely in Dart without flutter elements because the domain should only be concerned with the business logic of the application, not with the implementation details.

<h3>Repositories</h3> Abstract classes that define the expected functionality of outer layers.

<h3>Entities</h3> Business objects of the application.

<h3>Use Cases</h3> Describes the logic processing required for the application. Communicates directly with the repositories.

<h3>BLoc</h3> Receive the events from the views and interact with use cases accordingly. Emit the state according to the data received from the use cases. Bloc does not know about the view at all. It communicates in the form of states and events only.

<h3>Presentation</h3> The presentation layer is the most framework-dependent layer. It is responsible for all the UI and handling the events in the UI. It does not contain any business logic.

<h3>Widget</h3>  Widgets notify the events and listen to the states emitted from the Bloc.

<hr>

<h2> What is used in this project?</h2>
<p><h5> BLoc for state managment</h5></p>
<p><h5>Freezed Code generation for data classes </h5></p>
<p><h5>Get it Package used as dependency injection</h5></p>
<p><h5>Dartz Functional Programming </h5></p>
<p><h5>GoRouter Navigation package for navigation</h5></p>
<p><h5>Shared Preferences for caching user data</h5></p>
<p><h5>Equtable to compare objects</h5> </p>

