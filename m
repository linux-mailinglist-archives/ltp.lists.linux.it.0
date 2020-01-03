Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D927E12F87E
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 13:48:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E1A33C244D
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 13:48:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4C0913C2440
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 13:48:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 884FE600CEB
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 13:48:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C4B98AD8E;
 Fri,  3 Jan 2020 12:48:53 +0000 (UTC)
Date: Fri, 3 Jan 2020 13:48:51 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200103124851.GA24603@dell5510>
References: <20191226135801.11839-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191226135801.11839-1-alexey.kodanev@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/iptables: add ipv6 support
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

> New tests: ip6tables, nft6.
great idea, just there is a regression in nft01.sh, see below.

> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> --- a/testcases/network/iptables/iptables_lib.sh
...
>  init()
>  {
> +	if [ "$use_iptables" = 1 ]; then
> +		toolname=ip${TST_IPV6}tables
> +		cmds="$toolname"
> +		tst_require_drivers ip${TST_IPV6}_tables
> +	else
> +		toolname=nft
> +		cmds="$toolname ip${TST_IPV6}tables-translate"
> +	fi
> +
> +	if [ "$TST_IPV6" ];then
> +		loc_addr="::1"
> +		proto="icmpv6"
> +	else
> +		loc_addr="127.0.0.1"
> +		proto="icmp"
> +	fi
> +
> +	ping_cmd="ping$TST_IPV6"
> +	tst_require_cmds $cmds $ping_cmd

change to tst_require_cmds() does not catch missing nft:

nft check broke, original:
nft01 1 TCONF: 'nft' not found

now:
/bin/sh: 1: nft: not found
nft01 1 TBROK: nft add table ip filter failed

one of these fixes it (take whatever you like. Both variants check nft twice,
I'd ignore it).

* use TST_NEEDS_CMDS
diff --git testcases/network/iptables/iptables_lib.sh testcases/network/iptables/iptables_lib.sh
index ad2a894b6..8d220bc0e 100755
--- testcases/network/iptables/iptables_lib.sh
+++ testcases/network/iptables/iptables_lib.sh
@@ -12,7 +12,7 @@ TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
 TST_SETUP="${TST_SETUP:-init}"
 TST_CLEANUP="${TST_CLEANUP:-cleanup}"
-TST_NEEDS_CMDS="grep telnet"
+TST_NEEDS_CMDS="$TST_NEEDS_CMDS grep telnet"
 
 . tst_net.sh
 
diff --git testcases/network/iptables/nft01.sh testcases/network/iptables/nft01.sh
index 1ae086678..225f59bc5 100755
--- testcases/network/iptables/nft01.sh
+++ testcases/network/iptables/nft01.sh
@@ -5,6 +5,7 @@
 TST_SETUP="do_setup"
 TST_CLEANUP="do_cleanup"
 TST_NEEDS_DRIVERS="nf_tables"
+TST_NEEDS_CMDS="nft"
 use_iptables=0
 cleanup_table=0
 cleanup_chain=0

* use tst_require_cmds
diff --git testcases/network/iptables/nft01.sh testcases/network/iptables/nft01.sh
index 1ae086678..e5799b918 100755
--- testcases/network/iptables/nft01.sh
+++ testcases/network/iptables/nft01.sh
@@ -15,6 +15,7 @@ do_setup()
 {
 	local ip_table="ip${TST_IPV6}"
 
+	tst_require_cmds nft
 	if ! nft list table $ip_table filter > /dev/null 2>&1; then
 		ROD nft add table $ip_table filter
 		cleanup_table=1


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
