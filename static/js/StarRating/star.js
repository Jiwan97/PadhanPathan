
$( document ).ready(function() {

    const one = document.getElementById('first')
    const two = document.getElementById('second')
    const three = document.getElementById('third')
    const four = document.getElementById('fourth')
    const five = document.getElementById('fifth')


    const form = document.querySelector('.rate-form')
    const rateValue = document.getElementById('rate_value')

    const handleStarSelect = (size) => {
        const children = form.children
        console.log(children[0])
        for (let i=0; i < children.length; i++) {
            if(i <= size) {
                children[i].classList.add('checked')
            } else {
                children[i].classList.remove('checked')
            }
        }
    }

    const handleSelect = (selection) => {
        switch(selection){
            case 'first': {
                one.classList.add('checked','bigStar')
                two.classList.remove('checked')
                three.classList.remove('checked')
                four.classList.remove('checked')
                five.classList.remove('checked')

                return
            }
            case 'second': {
                one.classList.add('checked')
                two.classList.add('checked','bigStar')
                three.classList.remove('checked')
                four.classList.remove('checked')
                five.classList.remove('checked')
                return
            }
            case 'third': {
                one.classList.add('checked')
                two.classList.add('checked')
                three.classList.add('checked','bigStar')
                four.classList.remove('checked')
                five.classList.remove('checked')
                return
            }
            case 'fourth': {
                one.classList.add('checked')
                two.classList.add('checked')
                three.classList.add('checked')
                four.classList.add('checked','bigStar')
                five.classList.remove('checked')
                return
            }
            case 'fifth': {
                one.classList.add('checked')
                two.classList.add('checked')
                three.classList.add('checked')
                four.classList.add('checked')
                five.classList.add('checked','bigStar')
                return
            }
            default: {
                handleStarSelect(0)
            }
        }

    }

    const getNumericValue = (stringValue) =>{
        let numericValue;
        if (stringValue === 'first') {
            numericValue = 1
        }
        else if (stringValue === 'second') {
            numericValue = 2
        }
        else if (stringValue === 'third') {
            numericValue = 3
        }
        else if (stringValue === 'fourth') {
            numericValue = 4
        }
        else if (stringValue === 'fifth') {
            numericValue = 5
        }
        else {
            numericValue = 0
        }
        return numericValue
    }

    if (one) {
        const arr = [one, two, three, four, five]

        arr.forEach(item=> item.addEventListener('mouseover', (event)=>{
            handleSelect(event.target.id)

        }));
        arr.forEach(item=> item.addEventListener('click', (event)=>{
            const val = event.target.id
            const val_num = getNumericValue(val)
            console.log(val)
            console.log(val_num)
            rateValue.innerHTML= val_num
        }));
        arr.forEach(item=> item.addEventListener('mouseout', (event)=>{
            one.classList.remove('bigStar','checked')
            two.classList.remove('bigStar','checked')
            three.classList.remove('bigStar','checked')
            four.classList.remove('bigStar','checked')
            five.classList.remove('bigStar','checked')
            if (rateValue.innerHTML === '1') {
                one.classList.add('checked')
            }
            else if (rateValue.innerHTML === '2') {
                one.classList.add('checked')
                two.classList.add('checked')
            }
            else if (rateValue.innerHTML === '3') {
                one.classList.add('checked')
                two.classList.add('checked')
                three.classList.add('checked')
            }
            else if (rateValue.innerHTML === '4') {
                one.classList.add('checked')
                two.classList.add('checked')
                three.classList.add('checked')
                four.classList.add('checked')
            }
            else if (rateValue.innerHTML === '5') {
                one.classList.add('checked')
                two.classList.add('checked')
                three.classList.add('checked')
                four.classList.add('checked')
                five.classList.add('checked')
            }
        }));
    };
});