# ============================================================================
# Qutebrowser
# ============================================================================
{pkgs, ...}: {
  programs.qutebrowser = {
    enable = true;

    settings = {
      # Network/ad blocking.
      content.blocking.enabled = true;
      content.blocking.method = "both"; # Uses both Host blocking and AdblockPlus-style rules

      # Reduce ambient browser permissions.
      content.geolocation = false;
      content.notifications.enabled = false;
      content.desktop_capture = false;
      content.media.audio_capture = false;
      content.media.video_capture = false;
      content.media.audio_video_capture = false;
      content.mouse_lock = false;
      content.persistent_storage = false;
      content.register_protocol_handler = false;

      # Don't accept third-party cookies by default.
      content.cookies.accept = "no-3rdparty";

      # Prevent locally loaded content from reaching local resources.
      content.local_content_can_access_file_urls = false;

      # Reduce unnecessary network discovery.
      content.dns_prefetch = false;

      # Don't expose local/private interfaces through WebRTC.
      content.webrtc_ip_handling_policy = "default-public-interface-only";

      # Keep JavaScript-enabled browsing usable, but don't allow pages to
      # silently open tabs/windows.
      content.javascript.can_open_tabs_automatically = false;
    };
  };
}
