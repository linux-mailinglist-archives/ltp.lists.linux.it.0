Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D41B66A5
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 00:12:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C3BC3C2967
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 00:12:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9D3393C2925
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 00:12:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7D58E1001341
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 00:12:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3C3BAE67;
 Thu, 23 Apr 2020 22:12:46 +0000 (UTC)
Date: Fri, 24 Apr 2020 00:12:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20200423221245.GA1391884@x230>
References: <20200421180002.11351-1-pvorel@suse.cz>
 <dab04fc5-5d20-3dbc-c21f-535112ab222f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dab04fc5-5d20-3dbc-c21f-535112ab222f@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/sendfile01.sh: Check with timeout
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

> > I guess nothing controversial here as failure of starting server is
> > guarded by -s.
> > I was thinking about using TST_RETRY_FUNC, but passing command to it
> > leads to: tst_rhost_run: unknown option: l


> Hi Petr,

> eval might help in this case, take a look at tst_retry() in test.sh
Good point.

> old api, not sure why exactly it was removed in the new one...
It was designed from scratch I guess.
But this patch makes sense to me, I'll test it tomorrow.

> index 1d8a71d9f..e34edb26a 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -207,7 +207,7 @@ TST_RETRY_FN_EXP_BACKOFF()
>         fi

>         while true; do
> -               $tst_fun
> +               eval "$tst_fun"
>                 if [ "$?" = "$tst_exp" ]; then
>                         break
>                 fi

> > What bothers me more, that TST_NEEDS_CMDS does not check command on
> > rhost. Do we want to have something like TST_NEEDS_CMDS_RHOST or we just
> > don't care?

> In general, yes, we need to check if a command exists on the remote host.
> Yet another variable, what about checking what in TST_NEEDS_CMDS on the
> remote host? Though TST_NEEDS_CMDS_RHOST looks quite well.
In this case ss was needed only on rhost.
I don't know if SUT in two hosts configurations (ssh/rsh) are identical.
If yes, it'd be enough just to check TST_NEEDS_CMDS also on rhost.
I'm for this variant as it's a simpler change. I'll send a patch tomorrow.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
