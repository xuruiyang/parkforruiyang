(def
    (Report
        (volatile bytes_acked 0)
        (volatile bytes_misordered 0)
        (volatile ecn_bytes 0)
        (volatile packets_acked 0)
        (volatile packets_misordered 0)
        (volatile ecn_packets 0)
        (volatile loss 0)
        (volatile timeout false)
        (volatile bytes_in_flight 0)
        (volatile packets_in_flight 0)
        (volatile bytes_pending 0)
        (volatile rtt 0)
        (volatile rin 0)
        (volatile rout 0)
    )
)
(when true
    (:= Report.bytes_acked (+ Report.bytes_acked Ack.bytes_acked))
    (:= Report.bytes_misordered (+ Report.bytes_misordered Ack.bytes_misordered))
    (:= Report.ecn_bytes (+ Report.ecn_bytes Ack.ecn_bytes))
    (:= Report.packets_acked (+ Report.packets_acked Ack.packets_acked))
    (:= Report.packets_misordered (+ Report.packets_misordered Ack.packets_misordered))
    (:= Report.ecn_packets (+ Report.ecn_packets Ack.ecn_packets))

    (:= Report.loss Ack.lost_pkts_sample)
    (:= Report.timeout Flow.was_timeout)

    (:= Report.bytes_in_flight Flow.bytes_in_flight)
    (:= Report.packets_in_flight Flow.packets_in_flight)
    (:= Report.bytes_pending Flow.bytes_pending)

    (:= Report.rtt Flow.rtt_sample_us)
    (:= Report.rin Flow.rate_outgoing)
    (:= Report.rout Flow.rate_incoming)

    (fallthrough)
)
(when (|| Report.timeout (> Report.loss 0))
    (report)
    (:= Micros 0)
)
(when (> Micros 10000)
    (report)
    (:= Micros 0)
)
