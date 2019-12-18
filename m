Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA8124218
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 09:44:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50DC33C22C7
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 09:44:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 77FFB3C2092
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 09:44:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BD2BC1401A27
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 09:44:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72D75AB71;
 Wed, 18 Dec 2019 08:44:08 +0000 (UTC)
Date: Wed, 18 Dec 2019 09:44:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191218084406.GA10966@dell5510>
References: <20191217171918.10237-1-alexey.kodanev@oracle.com>
 <20191217171918.10237-2-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217171918.10237-2-alexey.kodanev@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] network/iptables: add new test for
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

Reviewed-by: Petr Vorel <pvorel@suse.cz>
one more fix below.

> +++ b/testcases/network/iptables/nft01.sh
> @@ -0,0 +1,41 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2019 Oracle and/or its affiliates. All Rights Reserved.
> +
> +TST_CNT=6
> +TST_SETUP="do_setup"
> +TST_TESTFUNC="test"
> +TST_CLEANUP="do_cleanup"
> +TST_NEEDS_TMPDIR=1
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_CMDS="nft iptables-translate grep ping telnet"
> +TST_NEEDS_DRIVERS="nf_tables"
> +use_iptables=0
> +
> +. iptables_lib.sh
> +. tst_test.sh
> +
> +cleanup_tables=0
cleanup_table=0

Otherwise it fails:
nft01 1 TCONF: 'nft' not found
/opt/ltp/testcases/bin/nft01.sh: line 37: [: -eq: unary operator expected

+ nit (code style comments, feel free to ignore):

1) I'd use empty variable instead of 0 (and [ "$cleanup_chain" = 1 ]),
we discuss it with previous patches.

2) I'd move TST_CNT=6 to iptables_lib.sh (if test function adds more tests, all
iptables_lib.sh uses would have to update it). Maybe all but these could be
there: TST_SETUP, TST_CLEANUP and use_iptables.

3) I'd move cleanup_table and cleanup_chain below use_iptables
(or use_iptables below, just to have all 3 variables together).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
