Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB25A2F3C86
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 00:13:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCCD43C5DD1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 00:13:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B00383C26C0
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 00:13:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3B03E2001AB
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 00:13:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6EC26AB7A;
 Tue, 12 Jan 2021 23:13:02 +0000 (UTC)
Date: Wed, 13 Jan 2021 00:13:00 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <X/4s/AhZ6+eTcYnv@pevik>
References: <20200928035605.22701-1-tusharsu@linux.microsoft.com>
 <20200928035605.22701-3-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928035605.22701-3-tusharsu@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] IMA: Add test for dm-crypt measurement
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
Cc: snitzer@redhat.com, nramas@linux.microsoft.com, dm-devel@redhat.com,
 ltp@lists.linux.it, linux-integrity@vger.kernel.org, gmazyland@gmail.com,
 agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tushar,

...
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh
> @@ -0,0 +1,60 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2020 Microsoft Corporation
> +# Author: Tushar Sugandhi <tusharsu@linux.microsoft.com>
> +#
> +# Verify that DM target dm-crypt are measured correctly based on policy.
> +
> +TST_NEEDS_CMDS="dmsetup"
> +TST_CNT=1
> +TST_NEEDS_DEVICE=1
> +TST_SETUP=setup
> +TST_CLEANUP=cleanup
> +
> +. ima_setup.sh
> +
> +FUNC_CRIT_DATA='func=CRITICAL_DATA'
> +TEMPLATE_BUF='template=ima-buf'
> +REQUIRED_POLICY="^measure.*($FUNC_CRIT_DATA.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_CRIT_DATA)"
> +
> +setup()
> +{
> +	require_ima_policy_content "$REQUIRED_POLICY" '-E' > $TST_TMPDIR/policy.txt
> +}
> +
> +cleanup()
> +{
> +	ROD "dmsetup remove test-crypt"
FYI: there should be check that dmsetup create was run.
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#a-word-about-the-cleanup-callback

i.e. here:

[ "$dmsetup_run" ] || return
ROD "dmsetup remove test-crypt"

+ see below.

> +}
> +
> +test1()
> +{
> +	local input_digest="039d8ff71918608d585adca3e5aab2e3f41f84d6"
> +	local pattern='data_sources=[^[:space:]]+'
> +	local tmp_file="$TST_TMPDIR/dm_crypt_tmp.txt"
> +	local policy="data_sources"
> +	local arg key res
> +
> +	tst_res TINFO "verifying dm target - dmcrypt gets measured correctly"
> +
> +	check_policy_pattern "$pattern" $FUNC_CRIT_DATA $TEMPLATE_BUF > $tmp_file || return
> +
> +	tgt="crypt"
> +	key="faf453b4ee938cff2f0d2c869a0b743f59125c0a37f5bcd8f1dbbd911a78abaa"
> +
> +	arg="'0 1953125 crypt aes-xts-plain64 "
> +	arg="$arg $key 0 "
> +	arg="$arg /dev/loop0 0 1 allow_discards'"
> +
> +	ROD "dmsetup create test-crypt --table $arg"
adding 
dmsetup_run=1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
