Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5A10C704
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 11:46:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 059653C22CF
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 11:46:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E92E53C1836
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 11:46:06 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C575D2016C0
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 11:46:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DABAEAC93;
 Thu, 28 Nov 2019 10:46:04 +0000 (UTC)
Date: Thu, 28 Nov 2019 11:46:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191128104603.GA3216@dell5510>
References: <20191126115344.15926-1-alexey.kodanev@oracle.com>
 <20191126115344.15926-2-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126115344.15926-2-alexey.kodanev@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] network/iptables: add new test for
 iptables-tranlsate and nft
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

> * Reuse the test-cases from iptables_tests by moving them
>   into iptables_lib.sh.

> * create nft rules with iptables-translate.

> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>

Thanks for your patch.
Rewrite is ok, I'd just also drop dots from messages.

Also redirection to tst_iptables.out in cleanup() is pointless,
maybe we could just change:

cleanup()
{
	if lsmod | grep -q "ip_tables"; then
		NFRUN -F -t filter > /dev/null 2>&1
		NFRUN -F -t nat > /dev/null 2>&1
		NFRUN -F -t mangle > /dev/null 2>&1
		rmmod -v ipt_limit ipt_multiport ipt_LOG ipt_REJECT \
			 iptable_mangle iptable_nat ip_conntrack \
			 iptable_filter ip_tables nf_nat_ipv4 nf_nat \
			 nf_log_ipv4 nf_log_common nf_reject_ipv4 \
			 nf_conntrack_ipv4 nf_defrag_ipv4 nf_conntrack \
			 > /dev/null 2>&1
	fi
}

For further work on iptables tests: I wonder if nc is more commonly installed in
distros than telnet (if yes, I'd be for using it).

But for nft01.sh I got error:

nft01 1 TINFO: INIT: Flushing all rules.
nft01 1 TCONF: nft not applicable for test 1
nft01 2 TINFO: Use nft to DROP packets from particular IP
nft01 2 TINFO: Rule to block icmp from 127.0.0.1
nft01 2 TFAIL: nft command failed to append new rule.
Error: Could not process rule: No such file or directory
add rule ip filter INPUT ip protocol icmp ip saddr 127.0.0.1 counter drop
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
nft01 3 TINFO: Use nft to REJECT ping request.
nft01 3 TINFO: Rule to reject ping request.
nft01 3 TFAIL: nft command failed to append new rule.
Error: Could not process rule: No such file or directory
add rule ip filter INPUT ip daddr 127.0.0.1 icmp type echo-request counter reject
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
nft01 4 TINFO: Use nft to log packets to particular port.
nft01 4 TINFO: Rule to log tcp packets to particular port.
nft01 4 TFAIL: nft command failed to append new rule.
Error: Could not process rule: No such file or directory
add rule ip filter INPUT ip daddr 127.0.0.1 tcp dport 45886 counter log prefix "1128114107:"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
nft01 5 TINFO: Use nft to log packets to multiple ports.
nft01 5 TINFO: Rule to log tcp packets to port 45801 - 45803.
nft01 5 TFAIL: nft command failed to append new rule.
Error: Could not process rule: No such file or directory
add rule ip filter INPUT ip daddr 127.0.0.1 tcp dport 45801-45803 counter log prefix "1128114107:"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
nft01 6 TINFO: Use nft to log ping request with limited rate.
nft01 6 TINFO: Rule to log ping request.
nft01 6 TFAIL: nft command failed to append new rule.
Error: Could not process rule: No such file or directory
add rule ip filter INPUT ip daddr 127.0.0.1 icmp type echo-request limit rate 3/hour burst 5 packets counter log prefix "1128114107:"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Tested on openSUSE Tumbleweed (5.3.8-1-default, nftables v0.9.2 (Scram),
iptables v1.8.3 (legacy)) and Debian unstable (5.2.0-rc3+, nftables v0.9.0 (Fearless Fosdick), iptables v1.8.2 (nf_tables)). Am I missing something, have wrong version?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
