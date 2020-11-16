Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEABC2B501B
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 19:48:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72A1F3C6AF4
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 19:48:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 390FB3C4F56
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 19:48:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 50801140054D
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 19:48:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BE84AD20;
 Mon, 16 Nov 2020 18:48:27 +0000 (UTC)
Date: Mon, 16 Nov 2020 19:48:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>,
 Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201116184825.GB171432@pevik>
References: <20201116101840.15433-1-kory.maincent@bootlin.com>
 <20201116184143.GA171432@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116184143.GA171432@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: ltp@lists.linux.it, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Kory, Alexey,

> Hi Kory,

> thanks for your patch.
> ...
> >  do_test()
> >  {

> > -    tst_resm TINFO "test basic functionality of the \`$TC' command."
> > +    tst_res TINFO "test basic functionality of the host command."

> > -    while [ $TST_COUNT -lt $NUMLOOPS ]; do
> > +    while [ $TST_COUNT -le $NUMLOOPS ]; do
> IMHO there is no need to have loop like this.
> If required, we'd just add -iN parameter to it in the runtest file (where N is
> <1,max int), but IMHO it's enough to test host only once.

> >          if rhost_addr=$(host $RHOST); then
> > -            rhost_addr=$(echo "$rhost_addr" | awk -F, '{print $NF}') >/dev/null 2>&1
> > -            if ! host $rhost_addr >/dev/null 2>&1; then
> > -                end_testcase "reverse lookup with host failed"
> > -            fi
> > -
> > +            rhost_addr=$(echo "$rhost_addr" | awk '{print $NF}') >/dev/null 2>&1
> > +            EXPECT_PASS host $rhost_addr \>/dev/null 2>&1
> We need to redirect also second > and &:
> EXPECT_PASS host $rhost_addr \>/dev/null 2\>\&1

BTW 2>&1 does not make sense in this context (it's a redirection of error
message of EXPECT_PASS function, which would be to stdout.
I also noticed this part of traceroute01.sh is also wrong:
EXPECT_PASS traceroute $ip $bytes -n -m 2 $opts \>out.log 2>&1

It should be:
EXPECT_PASS traceroute $ip $bytes -n -m 2 $opts \>out.log 2\>\&1

But IMHO it'd be better in both cases to keep stderr not redirected
(don't hide problems). Therefore, unless you're against it, I'll remove
redirection from traceroute01.sh.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
