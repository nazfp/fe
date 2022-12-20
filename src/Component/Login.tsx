import  React, {useState} from 'react'

export default function Login(){

    interface User{
        username: string
        password: string
    }

    const [existingUser, setExistingUser] = useState<User>({
        username: '',
        password: ''
    })

    // if user does not exist in database
    const[errorMsg, setErrorMsg] = useState('')

    const handleChange =(e:React.ChangeEvent<HTMLInputElement>)=>{
        setExistingUser({
            ...existingUser,
            [e.target.name]: e.target.value
        })
    }

    const handleLogin = () => {
        // check user in database
        // if username does not exist, password is wrong, set errormsg
        // if successful, then set session cookie
    }

    return (
        <>
            <input placeholder="username" name="username" value={existingUser.username} onChange={handleChange}/>
            <input placeholder="password" name="password" value={existingUser.password} onChange={handleChange}/>

            <button onClick={handleLogin}>Login</button> 

            {errorMsg && <div className="alert alert-danger">{errorMsg}</div>}
        </>
    )

} 