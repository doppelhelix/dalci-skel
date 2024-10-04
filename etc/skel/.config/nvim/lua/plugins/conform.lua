return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                injected = {
                    options = {
                        ignore_errors = true,
                    },
                },
                shfmt = {
                    prepend_args = {
                        "-i",
                        "4",
                        "-ci",
                    },
                },
            },
        },
    },
}
