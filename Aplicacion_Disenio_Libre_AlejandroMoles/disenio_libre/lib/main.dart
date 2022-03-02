import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Proyecto realizado por Alejandro Moles Hurtado
//En este proyecto he extraido widgets y los he creado como clases para que el codigo se vea mas "limpio" y se diferencie cada clase lo que hace
void main() {
  runApp(const Aplicacion());
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion Libre Disenio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Esta es la clase principal
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //en esta page view van todas las paginas que al deslizarlas se deslizan hacia abajo verticalmente
      body: PageView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: <Widget>[Pagina_inicio(), Pagina_Contenido()],
      ),
    );
  }
}

//Esta clase es la que se se encarga de hacer la pantalla de inicio con un Stack()
class Pagina_inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      //llamo a las clases FondoApli() que es la que hara el fondeo de  la aplicacion y a Contenido() que es la que tiene todo el contenido que va en la pantalla de iniciop
      children: [FondoApli(), Contenido()],
    ));
    ;
  }
}

//esta es la clase que contiene los datos de los lugares, es decir la pantalla que tiene contenido importante para el usuario
class Pagina_Contenido extends StatelessWidget {
  const Pagina_Contenido({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          //llamo unas cuantas veces a la clase de CotenidoFinal() y le paso los parametros indicados
          ContenidoFinal(
              Colors.red,
              'assets/fondo_espania.jpg',
              "Plaza España",
              "Sevilla, España",
              "La Plaza de España es un conjunto arquitectónico enclavado en el parque de María Luisa de la ciudad de Sevilla (España). Fue proyectada por el arquitecto Aníbal González. Se levantó entre 1914 y 1929 como una de las construcciones principales de la Exposición Iberoamericana de 1929."),
          ContenidoFinal(
              Colors.green,
              'assets/paris.jpg',
              "Louvre",
              "Paris, Francia",
              "El Museo del Louvre es el museo nacional de Francia consagrado tanto a las bellas artes como a la arqueología y las artes decorativas anteriores al Impresionismo. Está ubicado en París, la capital del país, en el antiguo palacio real del Louvre."),
          ContenidoFinal(
              Colors.green,
              'assets/china.jpg',
              "Muralla China",
              "China",
              "La Gran Muralla China es una antigua fortificación china,1​ construida y reconstruida entre el siglo v a. C. y el siglo xvi para proteger la frontera norte del Imperio chino durante las sucesivas dinastías imperiales de los ataques de los nómadas xiongnu de Mongolia y Manchuria"),
          ContenidoFinal(
              Colors.red,
              "assets/castillo.jpg",
              "Edimburgo",
              "Escocia",
              "El castillo de Edimburgo es una antigua fortaleza erigida sobre una roca de origen volcánico ubicada en el centro de la ciudad de Edimburgo. Ha sido utilizado con fines de tipo militar desde el siglo XII, siendo destinado a usos civiles solo en épocas muy recientes.")
        ],
      ),
    );
  }
}

//Esta clase se encarga de hacer el contenido final que se compone de una imagen, mas un texto del lugar y la localizacion mas un texto de descripcion del lugar
class ContenidoFinal extends StatelessWidget {
  final color;
  final texto;
  final lugar;
  final localizacion;
  final texto_contenido;
  const ContenidoFinal(this.color, this.texto, this.lugar, this.localizacion,
      this.texto_contenido);

  @override
  Widget build(BuildContext context) {
    //uso un Stack para que el contenido este encima del fondo que he puesto
    return Stack(
      children: [
        //llamo al metodo que le aplicara el fondo
        FondoContenido(),
        Column(
          children: [
            //en la columna pongo una imagen de primer elemnto
            Image(
              image: AssetImage(texto),
            ),
            //llamo a otra clase para colocar la cabecera del contenido
            Titulo(lugar: this.lugar, localizacion: this.localizacion),
            //esta clase muestra el contenido final del la pantalla
            ContenidoTexto(this.texto_contenido),
            //esta clase muestra tres iconos que se pondran al final de todo
            Botones_Perso()
          ],
        )
      ],
    );
  }
}

//esta clase se encarga de colocar la cabecera del contenido de mi pantalla
class Titulo extends StatelessWidget {
  //recojo los parametros que seran los que indicaran el nombre del lugar y su localizacion
  final String lugar;
  final String localizacion;

  const Titulo({
    Key? key,
    required this.lugar,
    required this.localizacion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //coloco lso textos que seran el lugar y la localizacion, que van en una columna dentro de una fila
              Text(
                this.lugar,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(this.localizacion,
                  style: TextStyle(color: Colors.black38, fontSize: 25)),
            ],
          ),
          //aqui vanm las estrellas que indican la puntuacion
          Expanded(child: Container()),
          Icon(
            Icons.star,
            color: Color(0xffbFFFF00),
          ),
          Icon(Icons.star, color: Color(0xffbFFFF00)),
          Icon(Icons.star, color: Color(0xffbFFFF00)),
          Icon(Icons.star_half, color: Color(0xffbFFFF00)),
          Icon(Icons.star_border_outlined, color: Color(0xffbFFFF00)),
        ],
      ),
    );
  }
}

//esta clase es la que contiene los Text e inconos de la pantalla principal
class Contenido extends StatelessWidget {
  const Contenido({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "17º",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Viernes",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Expanded(child: Container()),
          Icon(Icons.arrow_downward, size: 100, color: Colors.white),
        ],
      ),
    );
  }
}

//esta clase es la que crea el fondo de la pantalla principal
class FondoApli extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: Image.asset(
          'assets/montaña.jpg',
          fit: BoxFit.fitHeight,
        ));
  }
}

//esta clase es la que crea el fondo para la pantalla del contenido
class FondoContenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.blueAccent[100],
    );
  }
}

//esta es la clase la cual crea el contenido del texto, el que indica la descripcion del lugar
class ContenidoTexto extends StatelessWidget {
  final texto_contenido;

  const ContenidoTexto(this.texto_contenido);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Text(
            this.texto_contenido,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Times',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

//esta clase es la que gestiona los iconos que se muestran abajo del todo
class Botones_Perso extends StatelessWidget {
  const Botones_Perso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Boton_Personalizado(
            icon: Icons.call_outlined,
            text: "LLAMAR",
          ),
          Boton_Personalizado(
            icon: Icons.attach_email_sharp,
            text: "E-MAIL",
          ),
          Boton_Personalizado(
            icon: Icons.share_outlined,
            text: "COMPARTIR",
          ),
        ],
      ),
    );
  }
}

//esta es la clase que crea y da estilo a los iconos de abajo del todo
class Boton_Personalizado extends StatelessWidget {
  final IconData icon;
  final String text;

  const Boton_Personalizado({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          this.icon,
          color: Colors.white,
          size: 50,
        ),
        Text(
          this.text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
