Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDFE49415A
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jan 2022 20:55:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C25E23C9698
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jan 2022 20:55:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 61B1F3C8DDA
 for <ltp@lists.linux.it>; Wed, 19 Jan 2022 20:55:25 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DA5DD1A00933
 for <ltp@lists.linux.it>; Wed, 19 Jan 2022 20:55:24 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EBC0D21110;
 Wed, 19 Jan 2022 19:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642622123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjjSOiQVUUpOD+sdDNL4wQJ1YLTo/wmoX2voEVYoy5U=;
 b=1DdfVhKdK5+1qDrMisaHT6uie82JfeRWlEiNn3vN5YUA6x26jIQnUMcrpf+iDQLs49v1Ks
 Umy62FkHspUCq5xDshvUgS2YPlqOGwc94p/J8FJUD13jTjP38KHXFoLgIWzwxZiQ/Orpqb
 MwLtUZ1qOht90mf7EL4/alGtlsbtio0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642622123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjjSOiQVUUpOD+sdDNL4wQJ1YLTo/wmoX2voEVYoy5U=;
 b=a2Mbao0f9dMrkUr1q74rDFJwvHP4mtkqpn2kXXCOysbBfO/RlOvNmCYip9JkgmoArcBTMF
 OywLETaP+pKlyVCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A602813BA3;
 Wed, 19 Jan 2022 19:55:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AHpVJqts6GH2fAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 19 Jan 2022 19:55:23 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 19 Jan 2022 20:55:18 +0100
Message-Id: <20220119195519.3117-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119195519.3117-1-pvorel@suse.cz>
References: <20220119195519.3117-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/2] tst_net.sh: Fix for disabled IPv6
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tests failed in tst_init_iface even IPv4 only test was run.
Allow to init interfaces at least for IPv4.

Tests which use TST_IPV6=6 needs to be fixed (unless they use
just tst_ipaddr_un()).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 66 +++++++++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 4dc0fca926..df16e12a26 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -24,7 +24,9 @@ TST_IPV6_FLAG=${TST_IPV6_FLAG:-}
 tst_net_parse_args()
 {
 	case $1 in
-	6) TST_IPV6=6 TST_IPVER=6 TST_IPV6_FLAG="-6";;
+	6)  tst_net_require_ipv6
+		TST_IPV6=6 TST_IPVER=6 TST_IPV6_FLAG="-6"
+		;;
 	*) [ "$TST_PARSE_ARGS_CALLER" ] && $TST_PARSE_ARGS_CALLER "$1" "$2";;
 	esac
 }
@@ -100,6 +102,30 @@ tst_brk_()
 	[ -z "$TST_USE_LEGACY_API" ] && tst_brk $@ || tst_brkm $@
 }
 
+tst_net_detect_ipv6()
+{
+	local type="${1:-lhost}"
+	local cmd='[ -f /proc/net/if_inet6 ]'
+
+	if [ "$type" = "lhost" ]; then
+		$cmd
+		return $?
+	fi
+
+	tst_rhost_run -c "$cmd"
+	return $?
+}
+
+tst_net_require_ipv6()
+{
+	local err="IPv6 not supported on:"
+	local missing
+
+	tst_net_detect_ipv6 || missing=" lhost"
+	tst_net_detect_ipv6 rhost || missing="$missing rhost"
+	[ -z "$missing" ] || tst_brk_ TCONF "$err$missing"
+}
+
 init_ltp_netspace()
 {
 	local pid
@@ -517,7 +543,9 @@ tst_init_iface()
 		ip link set $iface down || return $?
 		ip route flush dev $iface || return $?
 		ip addr flush dev $iface || return $?
-		sysctl -qw net.ipv6.conf.$iface.accept_dad=0 || return $?
+		if tst_net_detect_ipv6; then
+			sysctl -qw net.ipv6.conf.$iface.accept_dad=0 || return $?
+		fi
 		ip link set $iface up
 		return $?
 	fi
@@ -529,7 +557,9 @@ tst_init_iface()
 	tst_rhost_run -c "ip link set $iface down" || return $?
 	tst_rhost_run -c "ip route flush dev $iface" || return $?
 	tst_rhost_run -c "ip addr flush dev $iface" || return $?
-	tst_rhost_run -c "sysctl -qw net.ipv6.conf.$iface.accept_dad=0" || return $?
+	if tst_net_detect_ipv6 rhost; then
+		tst_rhost_run -c "sysctl -qw net.ipv6.conf.$iface.accept_dad=0" || return $?
+	fi
 	tst_rhost_run -c "ip link set $iface up"
 }
 
@@ -606,7 +636,9 @@ tst_restore_ipaddr()
 	local ret=0
 	local backup_tst_ipv6=$TST_IPV6
 	TST_IPV6= tst_add_ipaddr $type $link_num || ret=$?
-	TST_IPV6=6 tst_add_ipaddr $type $link_num || ret=$?
+	if tst_net_detect_ipv6; then
+		TST_IPV6=6 tst_add_ipaddr $type $link_num || ret=$?
+	fi
 	TST_IPV6=$backup_tst_ipv6
 
 	return $ret
@@ -971,8 +1003,10 @@ IPV6_RHOST="${IPV6_RHOST:-fd00:1:1:1::1/64}"
 if [ -z "$_tst_net_parse_variables" ]; then
 	eval $(tst_net_ip_prefix $IPV4_LHOST || echo "exit $?")
 	eval $(tst_net_ip_prefix -r $IPV4_RHOST || echo "exit $?")
-	eval $(tst_net_ip_prefix $IPV6_LHOST || echo "exit $?")
-	eval $(tst_net_ip_prefix -r $IPV6_RHOST || echo "exit $?")
+	if tst_net_detect_ipv6; then
+		eval $(tst_net_ip_prefix $IPV6_LHOST || echo "exit $?")
+		eval $(tst_net_ip_prefix -r $IPV6_RHOST || echo "exit $?")
+	fi
 fi
 
 [ -n "$TST_USE_NETNS" -a "$TST_INIT_NETNS" != "no" ] && init_ltp_netspace
@@ -981,19 +1015,29 @@ if [ -z "$_tst_net_parse_variables" ]; then
 	eval $(tst_net_iface_prefix $IPV4_LHOST || echo "exit $?")
 	eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV4_RHOST \
 		|| echo "exit $?")
-	eval $(tst_net_iface_prefix $IPV6_LHOST || echo "exit $?")
-	eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV6_RHOST \
-		|| echo "exit $?")
+
+	if tst_net_detect_ipv6; then
+		eval $(tst_net_iface_prefix $IPV6_LHOST || echo "exit $?")
+	fi
+
+	if tst_net_detect_ipv6 rhost; then
+		eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV6_RHOST \
+			|| echo "exit $?")
+	fi
 
 	eval $(tst_net_vars $IPV4_LHOST/$IPV4_LPREFIX \
 		$IPV4_RHOST/$IPV4_RPREFIX || echo "exit $?")
-	eval $(tst_net_vars $IPV6_LHOST/$IPV6_LPREFIX \
-		$IPV6_RHOST/$IPV6_RPREFIX || echo "exit $?")
+
+	if tst_net_detect_ipv6; then
+		eval $(tst_net_vars $IPV6_LHOST/$IPV6_LPREFIX \
+			$IPV6_RHOST/$IPV6_RPREFIX || echo "exit $?")
+	fi
 
 	tst_res_ TINFO "Network config (local -- remote):"
 	tst_res_ TINFO "$LHOST_IFACES -- $RHOST_IFACES"
 	tst_res_ TINFO "$IPV4_LHOST/$IPV4_LPREFIX -- $IPV4_RHOST/$IPV4_RPREFIX"
 	tst_res_ TINFO "$IPV6_LHOST/$IPV6_LPREFIX -- $IPV6_RHOST/$IPV6_RPREFIX"
+
 	export _tst_net_parse_variables="yes"
 fi
 
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
