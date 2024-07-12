local neotest_status_ok, neotest = pcall(require, 'neotest')
if not neotest_status_ok then
    print('Error loading neotest...')
    return
end

local adapter_java_status_ok, adapter_java = pcall(require, 'neotest-java')
if not adapter_java_status_ok then
    print('Error loading neotest java adapter...')
    return
end

local adapter_rust_status_ok, adapter_rust = pcall(require, 'neotest-rust')
if not adapter_rust_status_ok then
    print('Error loading neotest rust adapter...')
    return
end

neotest.setup {
    adapters = {
        require("neotest-plenary"),
        adapter_java,
        adapter_rust,
    }
}

