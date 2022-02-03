import React from 'react'
import NoPayType from './NoPayType'
import CreditCardPayType from './CreditCardPayType'
import CheckPayType from './CheckPayType'
import PurchaseOrderPayType from './PurchaseOrderPayType'

class PayTypeSelector extends React.Component {
    constructor(props) {
        super(props);
        this.onPayTypeSelected = this.onPayTypeSelected.bind(this);
        this.state = { selectedPayType: null };
    }

    onPayTypeSelected(event) {
        // The event passed in is a synthetic event, which has a property target that is a DOMEventTarget
        this.setState({ selectedPayType: event.target.value });
    }

    render() {
        let PayTypeCustomComponent = NoPayType;
        if (this.state.selectedPayType === 'Credit card') {
            PayTypeCustomComponent = CreditCardPayType;
        } else if (this.state.selectedPayType === 'Check') {
            PayTypeCustomComponent = CheckPayType;
        } else if (this.state.selectedPayType === 'Purchase order') {
            PayTypeCustomComponent = PurchaseOrderPayType;
        }

        return (
            <>
                <div className="field">
                    <label htmlFor="order_pay_type">Pay type</label>
                    <select onChange={this.onPayTypeSelected} name="order[pay_type]">
                        <option value="">Select a payment method</option>
                        <option value="Check">Check</option>
                        <option value="Credit card">Credit card</option>
                        <option value="Purchase order">Purchase order</option>
                    </select>
                </div>
                <PayTypeCustomComponent />
            </>
        );
    }
}
export default PayTypeSelector
