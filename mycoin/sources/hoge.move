module mycoin::hoge{
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct HOGE has drop {}

    fun init(witness: HOGE, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(withness, 9, b"HOGE", b"HOGE", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::send(ctx))
    }

    public entry fun mint(treasury &mut coin::TreasuryCap<HOGE>, amount: u64, recipient address, ctx &mut TxContext) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx)
    }

    // TODO: learn how to use anathor contract's struct
}