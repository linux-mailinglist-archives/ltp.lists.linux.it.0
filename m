Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C36B264963
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 18:11:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A15813C534D
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 18:11:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 488B83C5275
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 18:11:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DF23B6010F9
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 18:11:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB13DB133;
 Thu, 10 Sep 2020 16:12:01 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id CE5211E12EB; Thu, 10 Sep 2020 18:11:45 +0200 (CEST)
Date: Thu, 10 Sep 2020 18:11:45 +0200
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200910161145.GA17362@quack2.suse.cz>
References: <20200910121628.18505-1-pvorel@suse.cz>
 <CAOQ4uxhshKD-gCuW94cvKee8W==Y6y6TNyEJmxifEagxs1BhOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhshKD-gCuW94cvKee8W==Y6y6TNyEJmxifEagxs1BhOA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu 10-09-20 17:14:03, Amir Goldstein wrote:
> On Thu, Sep 10, 2020 at 3:16 PM Petr Vorel <pvorel@suse.cz> wrote:
> >
> > Suggested-by: Amir Goldstein <amir73il@gmail.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi Amir,
> >
> > based on suggestion http://lists.linux.it/pipermail/ltp/2020-September/018891.html,
> > but not really sure if it should be applied, because we loose warning:
> >
> > HINT: You _MAY_ be missing kernel fixes, see:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9bdda4e9cf2d
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f02fd3fa13e
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=497b0c5a7c06
> >
> 
> I think your change is fine, because this warning would only send poor
> stable kernel maintainers on a quest to find a patch to backport, which IMO
> is not going to end with a fix.
> 
> The situation with ignored mask logic is that it was broken or not properly
> defined from day 1 of fanotify, so people are probably using ignored mask
> only in the very basic combinations.
> 
> Lately, along with FAN_MARK_FILESYSTEM and related work, more
> opportunities for using ignored mask have materialized and many old bugs
> have surfaced.
> 
> But I'm afraid it will not be feasible to backport all the fixes, so
> once the ignored
> logic settles (there are still several bugs left) I will try to
> properly document
> what is expected to work in which kernel and will update the man page
> BUGS section.
> 
> Jan,
> 
> Please let me know if we are on the same page in that regard.

Yeah I agree. We've never heard any real user complaining about broken
ignore masks behavior so backporting of the respective fixes (which is
sometimes rather difficult) is IMHO a wasted effort. I agree that
documentation in the BUGS manpage section would be worthwhile though.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
