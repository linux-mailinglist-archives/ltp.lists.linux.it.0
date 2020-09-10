Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D918B2648AE
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 17:25:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0E5D3C535A
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 17:25:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8754B3C093E
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 17:25:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 31C2C1A00E0B
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 17:25:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D3D1AF45;
 Thu, 10 Sep 2020 15:26:10 +0000 (UTC)
Date: Thu, 10 Sep 2020 17:25:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200910152552.GA5438@dell5510>
References: <20200910121628.18505-1-pvorel@suse.cz>
 <CAOQ4uxhshKD-gCuW94cvKee8W==Y6y6TNyEJmxifEagxs1BhOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhshKD-gCuW94cvKee8W==Y6y6TNyEJmxifEagxs1BhOA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify10: Treat ignore mask bug as TCONF
 for < v5.9
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> > Suggested-by: Amir Goldstein <amir73il@gmail.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi Amir,

> > based on suggestion http://lists.linux.it/pipermail/ltp/2020-September/018891.html,
> > but not really sure if it should be applied, because we loose warning:

> > HINT: You _MAY_ be missing kernel fixes, see:

> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9bdda4e9cf2d
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f02fd3fa13e
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=497b0c5a7c06


> I think your change is fine, because this warning would only send poor
> stable kernel maintainers on a quest to find a patch to backport, which IMO
> is not going to end with a fix.

> The situation with ignored mask logic is that it was broken or not properly
> defined from day 1 of fanotify, so people are probably using ignored mask
> only in the very basic combinations.

> Lately, along with FAN_MARK_FILESYSTEM and related work, more
> opportunities for using ignored mask have materialized and many old bugs
> have surfaced.

> But I'm afraid it will not be feasible to backport all the fixes, so
> once the ignored
> logic settles (there are still several bugs left) I will try to
> properly document
> what is expected to work in which kernel and will update the man page
> BUGS section.
+1, that'd be great. Having tests early and update man page, not many syscalls
have that, thank you.

Kind regards,
Petr

> Jan,

> Please let me know if we are on the same page in that regard.

> Thanks,
> Amir.

> > Kind regards,
> > Petr


> >  testcases/kernel/syscalls/fanotify/fanotify10.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)

> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
> > index 2c4401f61..5b4591b4a 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify10.c
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
> > @@ -508,8 +508,8 @@ static void test_fanotify(unsigned int n)
> >                                         "zero length read from fanotify fd");
> >                         }
> >                         if (ret > 0) {
> > -                               tst_res(TFAIL, "group %d (%x) with %s and "
> > -                                       "%s ignore mask got event",
> > +                               tst_res((tst_kvercmp(5, 9, 0)) < 0 ? TCONF : TFAIL,
> > +                                       "group %d (%x) with %s and %s ignore mask got event",
> >                                         i, fanotify_class[p], mark->name, ignore_mark->name);
> >                                 if (event->fd != FAN_NOFD)
> >                                         SAFE_CLOSE(event->fd);
> > --
> > 2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
