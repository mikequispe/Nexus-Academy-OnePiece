#include <iostream>
#include <mysql.h>
#include <iomanip>
#include <string>

using namespace std;

struct Alumno {
    string id, nombre, apellido, celular, nota;
};

void mostrarMenu() {
    cout << "\n--- SISTEMA NEXUS ACADEMY ---" << endl;
    cout << "1. Ver todos los alumnos" << endl;
    cout << "2. Buscar alumno por ID (3.A)" << endl;
    cout << "3. Cuadro de Honor (Top 5) (3.B)" << endl;
    cout << "4. Alumnos en Riesgo (Nota < 4) (3.B)" << endl;
    cout << "5. Modificar Nota de Alumno (3.C)" << endl;
    cout << "6. Salir" << endl;
    cout << "Seleccione una opcion: ";
}

void ejecutarConsulta(MYSQL* conectar, string sql) {
    mysql_query(conectar, sql.c_str());
    MYSQL_RES* res = mysql_store_result(conectar);
    MYSQL_ROW fila;
    
    cout << "\n------------------------------------------------------------" << endl;
    cout << left << setw(5) << "ID" << setw(12) << "NOMBRE" << setw(12) << "APELLIDO" << setw(12) << "CEL" << "NOTA" << endl;
    cout << "------------------------------------------------------------" << endl;
    
    while ((fila = mysql_fetch_row(res))) {
        cout << left << setw(5) << fila[0] << setw(12) << fila[1] << setw(12) << fila[2] << setw(12) << fila[3] << fila[4] << endl;
    }
}

int main() {
    MYSQL* conectar = mysql_init(0);
    conectar = mysql_real_connect(conectar, "localhost", "root", "", "nexus_academy", 3306, NULL, 0);

    if (!conectar) {
        cout << "Error de conexion." << endl;
        return 1;
    }

    int opcion;
    do {
        mostrarMenu();
        cin >> opcion;
        string id_buscado, nueva_nota;

        switch (opcion) {
            case 1:
                ejecutarConsulta(conectar, "SELECT * FROM alumnos");
                break;
            case 2:
                cout << "Ingrese ID del alumno: "; cin >> id_buscado;
                ejecutarConsulta(conectar, "SELECT * FROM alumnos WHERE id = " + id_buscado);
                break;
            case 3:
                cout << "\n*** CUADRO DE HONOR ***";
                ejecutarConsulta(conectar, "SELECT * FROM alumnos ORDER BY nota_final DESC LIMIT 5");
                break;
            case 4:
                cout << "\n*** ALUMNOS EN RIESGO ***";
                ejecutarConsulta(conectar, "SELECT * FROM alumnos WHERE nota_final < 4");
                break;
            case 5:
                cout << "ID del alumno a modificar: "; cin >> id_buscado;
                cout << "Nueva nota: "; cin >> nueva_nota;
                if (mysql_query(conectar, ("UPDATE alumnos SET nota_final = " + nueva_nota + " WHERE id = " + id_buscado).c_str()) == 0)
                    cout << "¡Nota actualizada con exito!" << endl;
                break;
        }
    } while (opcion != 6);

    mysql_close(conectar);
    return 0;
}