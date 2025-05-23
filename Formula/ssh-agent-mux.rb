# typed: true
# frozen_string_literal: true

# This file was generated by Homebrew Releaser. DO NOT EDIT.
class SshAgentMux < Formula
  desc "Combines multiple agents' keys into a single agent"
  homepage "https://github.com/overhacked/ssh-agent-mux"
  url "https://github.com/overhacked/ssh-agent-mux/archive/refs/tags/v0.1.6.tar.gz"
  version "0.1.6"
  sha256 "071decb6d9474dc7bed4f190af3b01db6c9ffc42ec9a26c537ecb98fde6e8d4b"
  license "BSD-3-Clause"

  on_macos do
    on_intel do
      url "https://github.com/overhacked/ssh-agent-mux/releases/download/v0.1.6/ssh-agent-mux-0.1.6-darwin-amd64.tar.gz"
      sha256 "e7130935576b24d1649740855c13cb2bb9a186deeb7d962febe4d835a367197b"
    end

    on_arm do
      url "https://github.com/overhacked/ssh-agent-mux/releases/download/v0.1.6/ssh-agent-mux-0.1.6-darwin-arm64.tar.gz"
      sha256 "10935d3f0f01e23291111698345b05eda76cf8f4662164e3e3eccaa49c0f1431"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/overhacked/ssh-agent-mux/releases/download/v0.1.6/ssh-agent-mux-0.1.6-linux-amd64.tar.gz"
      sha256 "bc3f3d8296aa68e5eb11568f67b597b7839aa29295fa8d2f96ce9a76371a38da"
    end

    on_arm do
      url "https://github.com/overhacked/ssh-agent-mux/releases/download/v0.1.6/ssh-agent-mux-0.1.6-linux-arm64.tar.gz"
      sha256 "da1807a6177e174d6dc10227b1a3c963bee946706cff951bd4b85dcabb1f24ff"
    end
  end

  def install
    bin.install "ssh-agent-mux"
  end

  test do
    test_sock = testpath/"#{name}.sock"
    agent_stdout = shell_output(
      %Q(#{opt_bin/name} --log-level info --config /dev/null --listen "#{test_sock}" &) \
      + %Q( until [ -e "#{test_sock}" ]; do sleep 0.1; done; kill %1; wait %1),
    )
    assert_match "Starting agent", agent_stdout
    assert_match "Exiting on SIGTERM", agent_stdout
  end
end
