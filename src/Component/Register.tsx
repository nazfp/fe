import  React, {useState} from 'react'


export default function Register (){

    interface User{
        username:string
        password:string
        passwordConfirm:string
        email:string
    }

    const [newUser, setNewUser] = useState<User>({
        username:'',
        password:'',
        passwordConfirm:'',
        email:''
        
    })

    const[errorMsg, setErrorMsg] = useState('')

    const handleNewUser = (e:React.ChangeEvent<HTMLInputElement>)=>{
        setNewUser({
            ...newUser,
            [e.target.name]: e.target.value
        })
    }
    
    const handleSubmit =()=>{
       
        if(newUser.password !== newUser.passwordConfirm){
            setErrorMsg(`password does not match`)
            return
        }

        // sent newUser to database
        // implement dynamic password checking when the user types
        // implement an error message box that can display specific error msgs
        // if database result have username and email, if username exist, then throw error
        // if username and email is unique, success 
        // once success, there will be page animation

        console.log(newUser)
        
    }
    
    return(
        <>
        <h3>Register your account</h3>

        <input placeholder='Username' name='username' value={newUser.username} onChange={handleNewUser}/>
        <input placeholder='Email' name='email' type='email' value={newUser.email} onChange={handleNewUser}/>
        <input placeholder='Password' name='password' type='password' value={newUser.password} onChange={handleNewUser}/>
        <input placeholder='Confirm' name='passwordConfirm' type='password' value={newUser.passwordConfirm} onChange={handleNewUser}/>

        <button onClick={handleSubmit}>submit</button>

        {errorMsg && <div className="alert alert-danger">{errorMsg}</div>}
        </>

    )
}