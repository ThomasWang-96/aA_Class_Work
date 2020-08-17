
const partyHeader = document.getElementById('party');
const myh1 = document.getElementsByTagName('h1')

export const htmlGenerator = (string, htmlElement) => {
    const pTag = document.createElement('p');
    const textnode = document.createTextNode(string);
    const children = Array.from(htmlElement.children);
    if (children.length > 0){
        children.forEach(node => {
            node.remove()
        })
    }
    pTag.appendChild(textnode);
    htmlElement.appendChild(pTag);
};

htmlGenerator('Party Time.', partyHeader);
// htmlGenerator('I <3 Vanilla DOM manipulation.', myh1[0])


// 'Party Time' => input string;
//  <p>Party Time</p>

// index.html
//  <div id="party">

// </div >

// $p = $('<p></p>')
// $p.text('Party Time.')
// $party = $('#party')
// $party.append($p)

