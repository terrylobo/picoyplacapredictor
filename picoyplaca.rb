#Traemos un par de librerias para trabajar comodamente con las fechas y las horas
require 'date'
require 'time'
#Declaramos nuestra clase
class PicoYPlaca
	def initialize()
	end
	#creamos el método
	def predice()
		puts "---------Bienvenido al 'Pico&Placa' Predictor---------\n\n"
		puts "Este programa le ayudará a verificar de forma sencilla, si su vehículo tiene alguna restricción para circular segun la normativa de pico y placa en la fecha que usted especifique a continuación\n\n"
		#Pedimos al usuario que introduzca los inputs (La placa, La fecha y La hora)
		puts "Por favor, ingrese la placa del vehículo que desea verificar:"
		STDOUT.flush  
		placa = gets.chomp
		placa = placa.slice(placa.length-1,1)
		puts "Por favor, ingrese la fecha en la que planea circular con su vehículo en formato 'dd/mm/aaaa':"
		STDOUT.flush  
		fecha = gets.chomp
		fecha = Date.parse fecha
  		puts "Por favor, ingrese la Hora en la que planea circular con su vehículo en formato 'HH:MM':"
		STDOUT.flush  
		hora = gets.chomp
		hora = Time.parse hora
		switch = 1
		#primero comprobamos que el horario sea el restringido por normativa pico y placa de ser asi, entra dentro del condicional
		if (hora >= Time.parse("7:00") and hora <= Time.parse("9:30")) or (hora >= Time.parse("16:00") and hora <= Time.parse("19:30"))
			#Luego una forma de terminar este ejercicio es verificando para cada dia si la placa termina en un digto que corresponda a la restriccion del dia
			if fecha.monday?
				if placa=="1" or placa =="2"
					switch = 0
				end
			end
			if fecha.tuesday?
				if placa=="3" or placa =="4"
					switch = 0
				end
			end
			if fecha.wednesday?
				if placa=="5" or placa =="6"
					switch = 0
				end
			end
			if fecha.thursday?
				if placa=="7" or placa =="8"
					switch = 0
				end
			end
			if fecha.friday?
				if placa=="9" or placa =="0"
					switch = 0
				end
			end
		end
		#finalmente si el horario y el dia coinciden con las restricciones para la placa del vehiculo el switch auxiliar abra cambiado a cero, de lo contrario seguira siendo uno y e esta forma podemos mostrar la respuesta al usuario.
		puts case switch
		when 1 then "Su vehículo no tiene ninguna restricción para circular en el día y la hora indicadas"
		when 0 then "Su vehículo posee restricciones para circular en el día y la hora indicadas"
		end
	end
end
#declaramos el objeto y llamamos al método que nos entrega si tiene o no restricciones el vehiculo para circular
objeto = PicoYPlaca.new() 
objeto.predice
gets()
#se podría mejorar este código, verificando el formato de los inputs.