const DOMNodeCollection = require('./dom_node_collection')

window.$l = arg => {
    const myStatus = document.readyState === "complete" || (document.readyState !== "loading" && !document.documentElement.doScroll)
    let res = [];
    const myQue = [];

    if (typeof arg === 'function') {
        myQue.push(arg)
    }

    else { 
        if (typeof arg === 'string') {
            const nodes = document.querySelectorAll(arg)
            res = Array.from(nodes)
        } 
        else if (arg instanceof HTMLElement) {
            res.push(arg)
        }
        const final = new DOMNodeCollection(res)
        return final
    }


    for(let i = 0; i < myQue.length; i ++) {
        const callback  = myQue[i];
        if (myStatus) {
            callback();
            myQue.shift();
        } else {
            document.addEventListener("DOMContentLoaded", callback);
        }
    }

  

}
$l = {
    extend: function (base, ...otherObjs) {
        Object.assign(base, ...otherObjs)
        return base
    }
}
// $l.extend = (base, ...otherObjs) => {
//     Object.assign(base,...otherObjs)
// }

$l.ajax = (options) => {
    const xhr = new XMLHttpRequest();
    const defaults = {
        success: () => {},
        error:() => {},
        url:'',
        method:'get',
        data: {},
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8'
    }

    options = $l.extend(defaults, options)

    if (options.method === "GET") {
        // data is query string for get
        options.url += `?${toQueryString(options.data)}`;
    }

    xhr.open(options.method, options.url);

    xhr.onload = () => {
        if(xhr.status === 200){
            options.success(xhr.response)
        }
        else {
            options.error(xhr.response)
        }
    }
    xhr.send(JSON.stringify(options.data))
}   

toQueryString = (obj) => {
    let result = "";
    for (const prop in obj) {
        if (Object.prototype.hasOwnProperty.call(obj, prop)) {
            result += `${prop}=${obj[prop]}&`;
        }
    }
    return result.substring(0, result.length - 1);
};
