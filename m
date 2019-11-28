Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A210CBC5
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 16:34:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB23A3C2219
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 16:34:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B3B033C1808
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 16:34:20 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9A4AD6015A3
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 16:34:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A9598B1FE;
 Thu, 28 Nov 2019 15:34:18 +0000 (UTC)
Date: Thu, 28 Nov 2019 16:34:16 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191128153416.GA5219@dell5510>
References: <20191126115344.15926-1-alexey.kodanev@oracle.com>
 <20191126115344.15926-2-alexey.kodanev@oracle.com>
 <20191128104603.GA3216@dell5510>
 <81a49496-28c9-2057-7366-8e4d8665644b@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81a49496-28c9-2057-7366-8e4d8665644b@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

> > But for nft01.sh I got error:
> > nft01 1 TINFO: INIT: Flushing all rules.
> > nft01 1 TCONF: nft not applicable for test 1
> > nft01 2 TINFO: Use nft to DROP packets from particular IP
> > nft01 2 TINFO: Rule to block icmp from 127.0.0.1
> > nft01 2 TFAIL: nft command failed to append new rule.
> > Error: Could not process rule: No such file or directory
> > add rule ip filter INPUT ip protocol icmp ip saddr 127.0.0.1 counter drop
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> It seems there is no ip filter table with INPUT chain? firewalld not installed?
No, firewalld it's installed on openSUSE (+ I'll test it for Debian, but I
expect the same result).

> Is it test running fine after these:

> # nft add table ip filter
> # nft add chain ip filter INPUT '{ type filter hook input priority 0; }'

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
