import React from "react";
import "./Reviews.css";


export default function Reviews() {
    const [reviews, setReviews] = React.useState("");
    const [error, setError] = React.useState(false);
    const [products, setList] = React.useState([]);


    const RESPONSE_STATUS = {
        FAIL: false,
        SUCCESS: true,
    };

    const ShowReviews = async () => {
        try {
            let request = await fetch("http://localhost:3001/Reviwes");
            let response = await request.json();
            setList(response);
        } catch (error) {
            console.log(error);
        }
    }

    React.useEffect(() => {
        ShowReviews();
    }, [])

    const submit = async () => {
        try {
            if (reviews.length == 0) {
                setError(true);
            } else {
                const body = { reviews };
                const result = await fetch("http://localhost:3001/Reviews", {
                    method: "POST",
                    credentials: "include",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(body),
                });
                const bodyPar = await result.json();
                console.log(bodyPar, "bodyPar");
                if (bodyPar?.status === RESPONSE_STATUS.SUCCESS) {
                    console.log("good user and pass");
                    // window.location.href = "/";
                    window.localStorage.setItem('user', JSON.stringify(body.email))
                    window.location.href = '/';
                } else {
                    setError(true);

                    //bodyPar.message;
                }
            }
        } catch (err) {
            console.error(err.message, "hiiiiii1");
        }
    }


    return (
        <div className="rev">
            <br></br>
            <textarea className="reviews" onChange={(e) => setReviews(e.target.value)} value={reviews} name="reviews" placeholder="Add your review here!" cols="5" rows="3"></textarea>
            {error ?
                <label className="message">You Have To Login!</label> : ""}
            <br></br>
            <br></br>
            <button type="button" onClick={submit} className="submitLogin">submit review</button>



        </div>
    )
}
