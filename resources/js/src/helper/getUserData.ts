import { LoginResponseType } from "../pages/auth/actions/login";


export function getUserData():LoginResponseType|undefined{
try {

    const userData=localStorage.getItem("userData");
    if(typeof userData!=='object'){
        const connectedUser:LoginResponseType=JSON.parse(userData);
        return connectedUser
    }
    
} catch (error) {
    console.log((error as Error).message)
}
}