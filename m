Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F68E2AA6B3
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 17:42:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DEAB3C6013
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Nov 2020 17:42:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 572673C0888
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 17:42:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4A905140019F
 for <ltp@lists.linux.it>; Sat,  7 Nov 2020 17:42:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 110D2AB8F;
 Sat,  7 Nov 2020 16:42:16 +0000 (UTC)
Date: Sat, 7 Nov 2020 17:42:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20201107164214.GA10159@pevik>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-4-mdoucha@suse.cz>
 <5F97E6A0.8090506@cn.fujitsu.com> <20201106173545.GA30641@pevik>
 <5FA5E8D6.4040401@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FA5E8D6.4040401@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 03/19] Unify error handling in
 lib/tst_safe_timerfd.c
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

Hi Martin, Xu,

> > Hi Martin, Xu,

> > > > diff --git a/lib/tst_safe_timerfd.c b/lib/tst_safe_timerfd.c
> > > > index ffe7b2ef7..4c36a309c 100644
> > > > --- a/lib/tst_safe_timerfd.c
> > > > +++ b/lib/tst_safe_timerfd.c
> > > > @@ -17,9 +17,14 @@ int safe_timerfd_create(const char *file, const int lineno,
> > > >    	int fd;

> > > >    	fd = timerfd_create(clockid, flags);
> > > > -	if (fd<   0) {
> > > > -		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_create(%s) failed",
> > > > -			file, lineno, tst_clock_name(clockid));
> > > > +
> > > > +	if (fd == -1) {
> > > > +		tst_brk_(file, lineno, TTYPE | TERRNO,
> > > > +			"timerfd_create(%s) failed", tst_clock_name(clockid));
> > > > +	} else if (fd<   0) {
> > nit: fd<   0 =>  fd<   0
> Sorry, It is my email format problem, on patchwork[1], the format is right.

Martin, sorry for not checking what you send in the patch.

> [1]https://patchwork.ozlabs.org/project/ltp/patch/20201026164756.30556-4-mdoucha@suse.cz/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
