import { makeHttpReq } from "../../../../helper/makeHttpReq";
import { successMsg } from "../../../../helper/toast-notification";
import {  showErrorResponse } from "../../../../helper/util";
import { taskStore } from "../store/kabanStore";


export function useDragTask(fn:(slug:string)=>Promise<void>,slug:string) {


   async function fromNotStartedToPending(taskId: number,projectId: number) {
        const notStartedTask = document.querySelector(
            ".notStartedTask_" + taskId
        ) as HTMLElement;
        const pendingColumn = document.querySelector(
            ".pending_task"
        ) as HTMLElement;
        let isDragged = false;
     
        
        pendingColumn.addEventListener("dragstart", function () {
            console.log("dragstart");
        });
        //drag over event : this event fire many actions
        pendingColumn.addEventListener("dragover", function (event) {
            if (!isDragged) {
                event.preventDefault();
                pendingColumn.className += " hovered";
                isDragged = true;
            }
        });

        pendingColumn.addEventListener("dragleave", function () {
            console.log("dragstart");
            isDragged = false;
            pendingColumn.classList.remove("hovered");
        });

        // attention drop events fire many actions within console
        pendingColumn.addEventListener("drop", async function (event) {
            event.preventDefault();
            pendingColumn.append(notStartedTask);
            pendingColumn.classList.remove("hovered");
            isDragged = false;

            // console.log('make httpp...',taskId) sending many actions
            taskStore.currentTaskId=taskId
            if (!pendingColumn.getAttribute("data-listeners-added")) {
                pendingColumn.setAttribute("data-listeners-added", "true");
                
                setTimeout(async() => {
                 
                    await Promise.all([
                            changeTaskStatus(taskStore.currentTaskId, projectId,'tasks/not_started_to_pending'),
                            fn(slug)
                        ])
                        pendingColumn.removeAttribute("data-listeners-added");
                }, 200);
               
            }
    


        });

         
       
  
    }


    async function fromPendingToCompleted(taskId: number,projectId:number) {
        const pendingTask = document.querySelector(
            ".pendingTask_" + taskId
        ) as HTMLElement;
        const completedColumn = document.querySelector(
            ".completed_task"
        ) as HTMLElement;
        let isDragged = false;
   
        completedColumn.addEventListener("dragstart", function () {
            console.log("dragstart");
        });
        //drag over event : this event fire many actions
        completedColumn.addEventListener("dragover", function (event) {
            if (!isDragged) {
                event.preventDefault();
                completedColumn.className += " hovered";
                isDragged = true;
            }
        });

        completedColumn.addEventListener("dragleave", function () {
            console.log("dragstart");
            isDragged = false;
            completedColumn.classList.remove("hovered");
        });

        completedColumn.addEventListener("drop", function (event) {
            event.preventDefault();
            completedColumn.append(pendingTask);
            completedColumn.classList.remove("hovered");
            isDragged = false;
            taskStore.currentTaskId=taskId
            if (!completedColumn.getAttribute("data-listeners-added")) {
                completedColumn.setAttribute("data-listeners-added", "true");
                
                setTimeout(async() => {
                 
                    await Promise.all([
                            changeTaskStatus(taskStore.currentTaskId, projectId,'tasks/pending_to_completed'),
                            fn(slug)
                        ])
                        completedColumn.removeAttribute("data-listeners-added");
                }, 200);
               
            }
          
            
        });
  
    }

    function fromCompletedToPending(taskId: number,projectId:number) {
        const completedTask = document.querySelector(
            ".completedTask_" + taskId
        ) as HTMLElement;
        const pendingColumn = document.querySelector(
            ".pending_task"
        ) as HTMLElement;
        let isDragged = false;

        pendingColumn.addEventListener("dragstart", function () {
            console.log("dragstart");
        });
        //drag over event : this event fire many actions
        pendingColumn.addEventListener("dragover", function (event) {
            if (!isDragged) {
                event.preventDefault();
                pendingColumn.className += " hovered";
                isDragged = true;
            }
        });

        pendingColumn.addEventListener("dragleave", function () {
            console.log("dragstart");
            isDragged = false;
            pendingColumn.classList.remove("hovered");
        });

        pendingColumn.addEventListener("drop", function (event) {
            event.preventDefault();
            pendingColumn.append(completedTask);
            pendingColumn.classList.remove("hovered");
            isDragged = false;

            
            taskStore.currentTaskId=taskId
            if (!pendingColumn.getAttribute("data-listeners-added")) {
                pendingColumn.setAttribute("data-listeners-added", "true");
                
                setTimeout(async() => {
                 
                    await Promise.all([
                            changeTaskStatus(taskStore.currentTaskId, projectId,'tasks/completed_to_pending'),
                            fn(slug)
                        ])
                        pendingColumn.removeAttribute("data-listeners-added");
                }, 200);
               
            }
        });
    }

    return {
        fromNotStartedToPending,
        fromPendingToCompleted,
        fromCompletedToPending
    };
}


export type changeTaskInput= { 
    taskId: number; 
    projectId: number
 }

export async function changeTaskStatus(
    taskId: number,
    projectId: number,
    endPoint: string
) {
    try {
        const data = await makeHttpReq<changeTaskInput,
            { message: string;  }
        >(endPoint, "POST", { taskId: taskId, projectId: projectId });
      
        successMsg(data.message);
    } catch (error) {
        showErrorResponse(error);
    }
}

