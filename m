Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB702B4FFB
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 19:41:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76A6F3C6AF4
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 19:41:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B7A053C4F4C
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 19:41:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5FDA7600CE2
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 19:41:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C5BEAD79;
 Mon, 16 Nov 2020 18:41:44 +0000 (UTC)
Date: Mon, 16 Nov 2020 19:41:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20201116184143.GA171432@pevik>
References: <20201116101840.15433-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116101840.15433-1-kory.maincent@bootlin.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] net/host: update to new api
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Kory,

thanks for your patch.
...
>  do_test()
>  {

> -    tst_resm TINFO "test basic functionality of the \`$TC' command."
> +    tst_res TINFO "test basic functionality of the host command."

> -    while [ $TST_COUNT -lt $NUMLOOPS ]; do
> +    while [ $TST_COUNT -le $NUMLOOPS ]; do
IMHO there is no need to have loop like this.
If required, we'd just add -iN parameter to it in the runtest file (where N=
 is
<1,max int), but IMHO it's enough to test host only once.

>          if rhost_addr=3D$(host $RHOST); then
> -            rhost_addr=3D$(echo "$rhost_addr" | awk -F, '{print $NF}') >=
/dev/null 2>&1
> -            if ! host $rhost_addr >/dev/null 2>&1; then
> -                end_testcase "reverse lookup with host failed"
> -            fi
> -
> +            rhost_addr=3D$(echo "$rhost_addr" | awk '{print $NF}') >/dev=
/null 2>&1
> +            EXPECT_PASS host $rhost_addr \>/dev/null 2>&1
We need to redirect also second > and &:
EXPECT_PASS host $rhost_addr \>/dev/null 2\>\&1

>          else
> -            end_testcase "host $RHOST on local machine failed"
> +            tst_brk TFAIL "host $RHOST on local machine failed"
>          fi

> -        incr_tst_count
> +        TST_COUNT=3D$((TST_COUNT + 1))
>          sleep $SLEEPTIME
Also sleep time is not really needed.

...

Can I merge this simplified variant?

Kind regards,
Petr

#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (c) K=F6ry Maincent <kory.maincent@bootlin.com> 2020
# Copyright (c) Manoj Iyer <manjo@mail.utexas.edu> 2003
# Copyright (c) Robbie Williamson <robbiew@us.ibm.com> 2001
# Copyright (c) International Business Machines  Corp., 2000

TST_TESTFUNC=3D"do_test"
TST_NEEDS_CMDS=3D"awk host hostname"

. tst_net.sh

do_test()
{
	local rhost=3D${RHOST:-$(hostname)}
	local rhost_addr

    tst_res TINFO "test basic functionality of the host command"

	if rhost_addr=3D$(host $rhost); then
		rhost_addr=3D$(echo "$rhost_addr" | awk '{print $NF}')
		EXPECT_PASS host $rhost_addr \>/dev/null 2\>\&1
	else
		tst_brk TFAIL "host $rhost on local machine failed"
	fi
}

tst_run

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
