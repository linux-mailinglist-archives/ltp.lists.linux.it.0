Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9518F163
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:04:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67C093C4E69
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:04:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E36FB3C04FD
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:04:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 58AEE1401222
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:04:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A524CAFE8;
 Mon, 23 Mar 2020 09:04:47 +0000 (UTC)
Date: Mon, 23 Mar 2020 10:04:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200323090446.GA6282@dell5510>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <c0ab47c6-cc59-03e5-d474-e4efd68844a2@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0ab47c6-cc59-03e5-d474-e4efd68844a2@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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

Hi Xu,

> This patch looks good to me, just a small nit
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >   testcases/kernel/syscalls/add_key/add_key05.c   | 15 ++-------------
> >   testcases/kernel/syscalls/quotactl/quotactl01.c | 14 ++------------
> >   testcases/kernel/syscalls/quotactl/quotactl06.c | 12 +-----------
> >   3 files changed, 5 insertions(+), 36 deletions(-)

> > diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
> > index a39bfa0b7..6a4e20564 100644
> > --- a/testcases/kernel/syscalls/add_key/add_key05.c
> > +++ b/testcases/kernel/syscalls/add_key/add_key05.c
> > @@ -36,19 +36,8 @@ static void add_user(void)
> >   		return;
> >   	const char *const cmd_useradd[] = {"useradd", username, NULL};
> > -	int rc;
> > -
> > -	switch ((rc = tst_run_cmd(cmd_useradd, NULL, NULL, 1))) {
> > -	case 0:
> > -		user_added = 1;
> > -		ltpuser = SAFE_GETPWNAM(username);
> > -		break;
> > -	case 255:
> > -		tst_brk(TCONF, "useradd not found");
> > -		break;
> > -	default:
> > -		tst_brk(TBROK, "useradd failed (%d)", rc);
> > -	}
> > +
> > +	SAFE_RUNCMD(cmd_useradd, NULL, NULL);
> We should keep ltpuser and user_added assignment.

Oh, thanks for a reminder, sure.
+ there is an error in in safe_run_cmd() (used rc instead of rval).
I'll send v2.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
