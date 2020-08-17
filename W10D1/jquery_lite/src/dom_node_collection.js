class DOMNodeCollection {
    constructor(nodesArr){
        this.nodesArr = nodesArr
    }

    html(str) {
        for(let i = 0; i < this.nodesArr.length; i ++) {
            let node = this.nodesArr[i];
            if(str) {
                node.innerHTML  = str; 
            } else {
                return node.innerHTML
            }
        }
    }

    empty() {
        this.nodesArr.forEach(node => {
            node.innerHTML = ""
        });
    }

    append(args){
        this.nodesArr.forEach((node) => {
            if (args instanceof DOMNodeCollection)
            {args.nodesArr.forEach((arg) => {
                node.append(arg.outerHTML)
            })}
            else {
                node.append(args)
            }
        })       
    }

    attr(key, val) {
        for (let i = 0; i < this.nodesArr.length; i++) {
            let node = this.nodesArr[i];
            if(val) {
                node.setAttribute(key, val);
            } else {
                return node.getAttribute(key);
            }
        }
    }


    addClass(str) {
        for (let i = 0; i < this.nodesArr.length; i++) {
            let node = this.nodesArr[i];
            node.className = str;  
        }
    }

    removeClass() {
        for (let i = 0; i < this.nodesArr.length; i++) {
            let node = this.nodesArr[i];
            node.className = "";
        }
    }


    children() {
        const arr = []; 
        let res;
        for (let i = 0; i < this.nodesArr.length; i++) {
          let node = this.nodesArr[i];
          let children = node.children;
          res = arr.concat(Array.from(children))
        }
        return new DOMNodeCollection(res);
    }

    parent() {
        const arr = [];
        for (let i = 0; i < this.nodesArr.length; i++) {
            let node = this.nodesArr[i];
            let parent = node.parentElement;
            arr.push(parent)
        }
        return new DOMNodeCollection(arr);
    }

    find(str){
        let res = [];
        this.nodesArr.forEach( node => {
            let selected = node.querySelectorAll(str)
            let arr = Array.from(selected)
            res = res.concat(arr)
        })
        
        return new DOMNodeCollection(res);
    }


     
    remove() {
        this.nodesArr.forEach((node) => {
            node.remove();
        })
    }
}



module.exports = DOMNodeCollection