import { APP } from "./../App/APP";
import { getUserData } from "./getUserData";

type HttpVerbType = "GET" | "POST" | "PUT" | "DELETE";

export function makeHttpReq<TInput, TResponse>(
    endpoint: string,
    verb: HttpVerbType,
    input?: TInput
) {
    return new Promise<TResponse>(async (resolve, reject) => {
        try {
            const userData=getUserData()
            const res = await fetch(`${APP.apiBaseURL}/${endpoint}`,{
                method:verb,
                headers:{
                    "content-type": "application/json",
                    Authorization: "Bearer "+userData?.token
                },
                body: JSON.stringify(input)
            });

            const data:TResponse = await res.json();

            if(!res.ok){
                reject(data)
            }
            resolve(data)
       
        } catch (error) {
            reject(error);
        }
    });
}
