Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6325A2988C0
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 09:49:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C3CA3C312B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 09:49:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A14C73C1D33
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 09:49:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7CECD600645
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 09:49:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4A8AACB0;
 Mon, 26 Oct 2020 08:49:40 +0000 (UTC)
Date: Mon, 26 Oct 2020 09:49:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201026084939.GE21306@dell5510>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201015122056.20715-4-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015122056.20715-4-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] network/virt: add wireguard01
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> * performance tests with TCP traffic

> * invalid configuration with allowed IPs, public key

> * emulation of the lossy link for the underlying interface.

Thanks a lot for supporting wireguard!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> +TST_NEEDS_TMPDIR=1
> +TST_NEEDS_CMDS="$TST_NEEDS_CMDS wg"
> +TST_TESTFUNC=${TST_TESTFUNC:-virt_netperf_msg_sizes}
> +TST_SETUP=${TST_SETUP:-wireguard_lib_setup}
> +TST_CLEANUP=${TST_CLEANUP:-wireguard_lib_cleanup}
> +TST_NEEDS_DRIVERS="wireguard"
> +VIRT_PERF_THRESHOLD_MIN=${VIRT_PERF_THRESHOLD_MIN:-200}
> +
> +virt_type="wireguard"
> +. virt_lib.sh
> +
> +# Usage: wireguard_lib_setup [TYPE]
> +# TYPE: [ default | invalid_allowed_ips | invalid_pub_keys ]
> +wireguard_lib_setup()
> +{
> +	local type="${1:-default}"
> +	local pub_key0="$(wg genkey | tee wg0.key | wg pubkey)"
> +	local pub_key1="$(wg genkey | tee wg1.key | wg pubkey)"
> +
> +	local port_loc="$(tst_get_unused_port ipv${TST_IPVER} dgram)"
> +	local port_rmt=$(tst_rhost_run -c "tst_get_unused_port ipv${TST_IPVER} dgram")
> +
> +	# copy private key to remote host
> +	tst_rhost_run -s -c "echo '$(cat wg1.key)' > wg1.key"
> +
> +	tst_res TINFO "setup wireguard UDPv${TST_IPVER} tunnel, port $port_loc/$port_rmt"
> +	tst_res TINFO "lhost[$(tst_ipaddr)] <-> rhost[$(tst_ipaddr rhost)]"
> +
> +	virt_setup
> +
> +	local ka_opt="persistent-keepalive 1"
> +	local allow_ip_loc="${ip_virt_local}/32,${ip6_virt_local}/128"
> +	local allow_ip_rmt="${ip_virt_remote}/32,${ip6_virt_remote}/128"
> +
> +	case $type in
> +	invalid_allowed_ips)
> +		allow_ip_loc="${ip_virt_remote}/32,${ip6_virt_remote}/128"
> +		allow_ip_rmt="${ip_virt_local}/32,${ip6_virt_local}/128"
> +		tst_res TINFO "Allowed IPs are source IPs only"
> +		;;
> +	invalid_pub_keys)
> +		pub_key0="$(wg genkey | wg pubkey)"
> +		tst_res TINFO "Invalid peer public key of lhost"
> +		;;
> +	esac
> +
> +	ROD wg set ltp_v0 listen-port $port_loc private-key wg0.key
> +	ROD wg set ltp_v0 peer $pub_key1 endpoint \
> +		$(tst_ipaddr rhost):$port_rmt $ka_opt \
> +		allowed-ips $allow_ip_rmt
> +
> +	tst_rhost_run -s -c \
> +		"wg set ltp_v0 listen-port $port_rmt private-key wg1.key"
> +	tst_rhost_run -s -c "wg set ltp_v0 peer $pub_key0 \
> +		endpoint $(tst_ipaddr):$port_loc $ka_opt \
> +		allowed-ips $allow_ip_loc"
> +
> +	tst_net_run -s "ip route add 128.0.0.0/1 dev ltp_v0"
Out of curiosity: why is IPv4 enough? (we test also IPv6)

> +}
> +
> +wireguard_lib_cleanup()
> +{
> +	virt_cleanup
> +}

Why not use just virt_cleanup() ?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
