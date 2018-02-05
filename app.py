#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys,os,click

#sys.path.insert(0, os.path.join( os.path.dirname(os.path.abspath(__file__)) ,'modelos'))
from flask import Flask, request
from flask_restful import Api
from config import app_config
from recursos.alumno import Alumno, Alumnos
from recursos.profesor import Profesor, Profesores
from recursos.curso import Curso, Cursos, AlumnosCurso

app = Flask(__name__)

#Se establece enviroment como argumento
enviroment = sys.argv[1]

#Se setean variables de configuracion segun ambiente(env)
app.config.from_object(app_config[enviroment])
api = Api(app)

# SE DEFINEN LOS ENDPOINTS Y LA CLASE QUE SE ENCARGARÁ DE PROCESAR CADA SOLICITUD
api.add_resource(Alumno, '/alumno/<int:_id>')
api.add_resource(Alumnos, '/alumnos')
api.add_resource(Profesor, '/profesor/<int:_id>')
api.add_resource(Profesores, '/profesores')
api.add_resource(Curso, '/curso/<int:_id>')
api.add_resource(Cursos, '/cursos')
api.add_resource(AlumnosCurso, '/curso/<int:_id>/alumnos')

if __name__ == '__main__':
    from db import db
    db.init_app(app)
    app.run(host='0.0.0.0',port=5005, debug=True)
