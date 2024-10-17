import Foundation

// Clase Producto
class Producto {
    var codigo: String
    var nombre: String
    var precio: Double
    
    init(codigo: String, nombre: String, precio: Double) {
        self.codigo = codigo
        self.nombre = nombre
        self.precio = precio
    }
}

// Clase Cliente
class Cliente {
    var dni: String
    var nombre: String
    var productosComprados: [Producto]
    
    init(dni: String, nombre: String, productosComprados: [Producto]) {
        self.dni = dni
        self.nombre = nombre
        self.productosComprados = productosComprados
    }
}

// Clase Tienda
class Tienda {
    var ruc: String
    var nombre: String
    var ganancia: Double
    var productos: [Producto]
    var clientes: [Cliente]
    
    init(ruc: String, nombre: String, ganancia: Double) {
        self.ruc = ruc
        self.nombre = nombre
        self.ganancia = ganancia
        self.productos = []
        self.clientes = []
    }
    
    func listarProductos() {
        for producto in productos {
            print("Código: \(producto.codigo), Nombre: \(producto.nombre), Precio: \(producto.precio)")
        }
    }
    
    func listarClientes() {
        for cliente in clientes {
            print("DNI: \(cliente.dni), Nombre: \(cliente.nombre)")
        }
    }
    
    func listarProductosCompradosPorCliente() {
        for cliente in clientes {
            var totalAPagar = 0.0
            print("Cliente: \(cliente.nombre)")
            for producto in cliente.productosComprados {
                totalAPagar += producto.precio
                print("Producto: \(producto.nombre), Precio: \(producto.precio)")
            }
            totalAPagar += totalAPagar * ganancia
            print("Total a pagar (incluyendo ganancia): \(totalAPagar)\n")
        }
    }
}
/*
// Instanciar la tienda
let tienda = Tienda(ruc: "123456789", nombre: "TecsupMarket", ganancia: 0.1)

// Agregar productos
let producto1 = Producto(codigo: "001", nombre: "Laptop", precio: 1000.0)
let producto2 = Producto(codigo: "002", nombre: "Monitor", precio: 500.0)
tienda.productos.append(producto1)
tienda.productos.append(producto2)

// Agregar clientes y productos comprados
let cliente1 = Cliente(dni: "76328888", nombre: "Abraha Nunez", productosComprados: [producto1, producto2])
let cliente2 = Cliente(dni: "75325888", nombre: "Santiago Garcia", productosComprados: [producto2])
tienda.clientes.append(cliente1)
tienda.clientes.append(cliente2)

// Mostrar información
tienda.listarProductos()
tienda.listarClientes()
tienda.listarProductosCompradosPorCliente()*/
