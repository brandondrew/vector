package metadata

base: components: sinks: blackhole: configuration: {
	acknowledgements: {
		description: """
			Controls how acknowledgements are handled for this sink.

			See [End-to-end Acknowledgements][e2e_acks] for more information on how Vector handles event acknowledgement.

			[e2e_acks]: https://vector.dev/docs/about/under-the-hood/architecture/end-to-end-acknowledgements/
			"""
		required: false
		type: object: options: enabled: {
			description: """
				Whether or not end-to-end acknowledgements are enabled.

				When enabled for a sink, any source connected to that sink, where the source supports
				end-to-end acknowledgements as well, will wait for events to be acknowledged by the sink
				before acknowledging them at the source.

				Enabling or disabling acknowledgements at the sink level takes precedence over any global
				[`acknowledgements`][global_acks] configuration.

				[global_acks]: https://vector.dev/docs/reference/configuration/global-options/#acknowledgements
				"""
			required: false
			type: bool: default: null
		}
	}
	print_interval_secs: {
		description: """
			The number of seconds between reporting a summary of activity.

			Set to `0` to disable reporting.
			"""
		required: false
		type: uint: default: 1
	}
	rate: {
		description: """
			The number of events, per second, that the sink is allowed to consume.

			By default, there is no limit.
			"""
		required: false
		type: uint: default: null
	}
}
