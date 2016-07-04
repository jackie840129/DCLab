module Rs232(
    input avm_rst,
    input avm_clk,
    output [4:0] avm_address,
    output avm_read,
    input [31:0] avm_readdata,
    output avm_write,
    output [31:0] avm_writedata,
    input avm_waitrequest,
    input [335:0]   iData,
    input           iStart
);
    localparam RX_BASE     = 0*4;
    localparam TX_BASE     = 1*4;
    localparam STATUS_BASE = 2*4;
    localparam TX_OK_BIT   = 6;
    localparam RX_OK_BIT   = 7;

    parameter S_IDLE                = 0;
    parameter S_GET_READ_STATUS     = 1;
    parameter S_GET_WRITE_STATUS    = 2;
    parameter S_RECV                = 3;
    parameter S_SEND                = 4;
    parameter S_END                 = 5;

    logic [335:0] data_r, data_w;
    logic [2:0] state_r, state_w;
    logic [6:0] bytes_counter_r, bytes_counter_w;
    logic [4:0] avm_address_r, avm_address_w;
    logic avm_read_r, avm_read_w, avm_write_r, avm_write_w;

    assign avm_address = avm_address_r;
    assign avm_read = avm_read_r;
    assign avm_write = avm_write_r;
    assign avm_writedata = data_r[327-:8];

    task StartRead;
        input [4:0] addr;
        begin
            avm_read_w      = 1;
            avm_write_w     = 0;
            avm_address_w   = addr;
        end
    endtask
    task StartWrite;
        input [4:0] addr;
        begin
            avm_read_w      = 0;
            avm_write_w     = 1;
            avm_address_w   = addr;
        end
    endtask
    task Clear;
        begin
            avm_read_w      = 0;
            avm_write_w     = 0;
        end
    endtask

    always_comb begin
        data_w          = data_r;
        avm_address_w   = avm_address_r;
        avm_read_w      = avm_read_r;
        avm_write_w     = avm_write_r;
        state_w         = state_r;
        bytes_counter_w = bytes_counter_r;

        case (state_r)
            S_IDLE:
                begin
                    if(iStart) begin
                        state_w = S_GET_WRITE_STATUS;
                        data_w = iData;
                    end
                end
            S_GET_READ_STATUS:
                begin
                    StartRead(STATUS_BASE);
                    if (avm_waitrequest == 1'b0 && avm_read_r == 1'b1) begin
                        if (avm_readdata[RX_OK_BIT] == 1'b1) begin
                            StartRead(RX_BASE);
                            state_w = S_RECV;
                        end
                    end
                end

            S_GET_WRITE_STATUS:
                begin
                    StartRead(STATUS_BASE);
                    if (avm_waitrequest == 1'b0 && avm_read_r == 1'b1) begin
                        if (avm_readdata[TX_OK_BIT] == 1'b1) begin
                            StartWrite(TX_BASE);
                            state_w = S_SEND;
                        end
                    end
                end

            S_RECV:         
                begin
                    if (avm_waitrequest == 1'b0 && avm_read_r == 1) begin
                        Clear();

                        if (bytes_counter_r < 42) begin
                            bytes_counter_w = bytes_counter_r + 1;
                            data_w = data_r << 8;
                            data_w[7:0] = avm_readdata[7:0];
                            state_w = S_GET_READ_STATUS;
                        end
                        if (bytes_counter_r == 41) begin
                            bytes_counter_w = 0;
                            state_w = S_IDLE;
                        end
                    end
                end

            S_SEND:
                begin
                    if (avm_waitrequest == 1'b0 && avm_write_r == 1) begin
                        Clear();

                        if (bytes_counter_r < 40) begin
                            bytes_counter_w = bytes_counter_r + 1;
                            data_w = data_r << 8;
                            state_w = S_GET_WRITE_STATUS;
                        end else if (bytes_counter_r == 40) begin
                            bytes_counter_w = 0;
                            state_w = S_IDLE;
                        end
                    end
                end
        endcase
    end

    always_ff @(posedge avm_clk or posedge avm_rst) begin
        if (avm_rst) begin
            data_r          <= 0;
            avm_address_r   <= STATUS_BASE;
            avm_read_r      <= 1;
            avm_write_r     <= 0;
            state_r         <= S_IDLE;
            bytes_counter_r <= 0;
        end else begin
            data_r          <= data_w;
            avm_address_r   <= avm_address_w;
            avm_read_r      <= avm_read_w;
            avm_write_r     <= avm_write_w;
            state_r         <= state_w;
            bytes_counter_r <= bytes_counter_w;
        end
    end
endmodule
