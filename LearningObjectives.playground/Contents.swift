import UIKit

/*
    Swift  |  Switch conditional
 */
    // O uso do switch case em um menu
    if let command = readLine(){
        switch command{
            case "1": print("Deu bom irmao")
            case "5": break
            default : print("N deu irmao, tente dnv")
        }
    }

/*
 Swift |  For loop
*/
    var count = 1...5
    var number = 1
    for number in count{
        (number*number)  //printando o valor ao quadrado do number a cada iteração
    }
    
/*
 Swift |  Repeat while loop / If else condition
*/
    var count1 :Int = 1
    repeat{                     //Laço de repeat-while é determinado pela condição de repetição antes da instância de até quando ele será repetido
        if(count1 % 2 == 0){ // condição que permite só os numeros dividos por 2 com resto 0 (pares)
            print(count1)   //printando somente os numeros pares do conjunto até 10
            count1 += 1
        }else{
            count1 += 1
        }
    }while(count1 <= 10)

/*
 Swift |  While loop / Bolean Values / Operators ( Assignment , Arithmetic , Comparison , Ternary , Nil Coalescing )
*/

var num :Int = 1
    var cond = true
while true {
    num = (cond ? num+2 : num+1) // operador ternários se a condição for true soma o numero 2 , se não soma 1
    let comp = 3
    if(num == comp){
        var str : String? // operador nil Colescing para indicar que str pode ser nil
        let complement = "null"
        print("\(str ?? complement) sempre vai ser nil") // é possivel definir o valor default com o operador ?? e assim assumindo o valor complement
        break // através do break é possivel parar o loop naquela iteração
    }
}

/*
  Closure | Syntax , Shorthand , Trailing , Value from context, Reference type, Escaping, Autoclosures
 */

let writing = { (thing: String) in //sintaxe basica usando clousure recebendo um valor
    print("\(thing)")
}
// mas tambem pode ser expressa assim
let writingReturn = {(thing:String)->String in
    return "\(thing)"
}
writingReturn("Apple bota a Xiaomi p mama")
let myCarIs = {
    print("Celtao rebaixado")
}
func car(model: () -> Void){
    model()
}
car(model: myCarIs) // passando a closure MyCarIs como parametro referenciando a mesma na função car
//Mas tbm pode ser passado escrevendo a propria clousure , usando Trailing clousure
car{
    print("menti rs, o meu carro é um fusca")
}
//Para fazer uma shorthand basta definir na função o tipo do parametro da closure e seu retorno
func training(action: (Bool) -> String){
    action(true) //definindo a condition
}
training{ condition in // forma 'reduzida' de representar uma closure recebendo um parametro e fazendo um retorno do tipo String
    if condition {
        return "To treinando"
    }else{
        return "n to treinando"
    }
}

/*
    Structs and Classes | Inheritance
 */

struct Stop{
    var plate: String
}
var point = Stop(plate: "Yameru")

struct Thing{
    var isAThing : Bool
    var whatIs : String{
        if isAThing {
            return "this is a thing"
        }else{
            return "this isn't a thing"
        }
    }
}
var dale = Thing(isAThing: true)
//print(dale.whatIs) //referenciando a variavel que contem a string

struct Progress{
    var task: String
    var amount: Int{
        didSet{ //existem duas formas de aplicar property, com willSet e didSet
            print("O processo \(task) está em \(amount)%")
        }
    }
}
var prop = Progress(task:"comendo",amount: 0)
prop.amount = 10
prop.amount = 12

//Funções dentro de structs são chamadas de métodos, mas tendo a mesma escrita de uma função
struct Translate{
    var traveledInMeters : Int
    func traveledInKilometers() -> Int { //Você tbm pode utilizar metodos mutating, com a opção de mudar os argumentos da função ao instanciar-la
        return traveledInMeters / 1000
    }
}
let fortalezaMaranguape = Translate(traveledInMeters: 20000)
fortalezaMaranguape.traveledInKilometers()

//uso do init
struct User{
    var username: String
    init(){
        username = "Anonymous"
        print("creating user")
    }
}
var child = User()
child.username = "Junin"


//uso do self and lazy
struct Group{
    init(){
        print("seu grupo foi criado")
    }
}
struct Person {
    var name: String
    lazy var group = Group()//ao usar o lazy, o swift so vai criar a struct Group qnd for acessada pela primeira vez
    init(nome: String) {
        print("\(nome) was born!")
        self.name = nome //self.name vai referenciar o name dado na struct (property), e nome vai referenciar o parametro
    }
}

//------ Classes
class Dog{
    var name : String
    var raca : String
    init(name: String, raca: String){     //Uma das diferenças de classe pra struct, é que vc precisa criar inicializadores pra cada properties
        self.name = name
        self.raca = raca
    }
}
class Husky: Dog{ //Para aplicar o sistema de subclasse (herança), é preciso referenciar a classe Pai,
    //tendo por padrão as properties e inicializadores da classe herdada
    init(name: String){
        super.init(name: name, raca: "Husky Siberiano") //a chamada super.init na classe herdeira que permite utilizar o init da classe pai
    }
}


