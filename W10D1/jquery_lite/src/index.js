const DOMNodeCollection = require('./dom_node_collection')

window.$l = arg => {
    let res = [];
    if (typeof arg === 'string'){
        const nodes = document.querySelectorAll(arg)
        res = Array.from(nodes)
    } else if (arg instanceof HTMLElement) {
        res.push(arg)     
    }
    const final = new DOMNodeCollection(res)
    return final 
}
