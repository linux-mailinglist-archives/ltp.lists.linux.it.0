Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 607103C9919
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 08:53:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D471E3C6CF1
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 08:52:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A70C3C4DF6
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 08:52:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0C2A7200DEC
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 08:52:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F33AD1FDE2;
 Thu, 15 Jul 2021 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626331976;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+N8Orytm++SC0mJcjlhOHT7Q7OHrxALVfmH8yV7mrPQ=;
 b=ujr75m05NBz/jiOT2Wfevv1SfRHThA332Q+IQvPbQW//WuLeunSwhbIZk7rPT6HTy6wDYk
 1OPO6dxH+bKucasejBnsEpJVPW97NNVAErvyXOU7ebNTT366EfDS4QM1NV9TjHOMztjptj
 SVL1YAVbg4OY20SuFTNiXR1WoeprgXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626331976;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+N8Orytm++SC0mJcjlhOHT7Q7OHrxALVfmH8yV7mrPQ=;
 b=BaReNXTyaM9+MVSKxuio3nuxqYoMYSfWqt4IeYVxD0rbWHh0na/dUuQIEJKkBrWVOFx2/+
 LfiZrNy83sOCvAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC1A713C27;
 Thu, 15 Jul 2021 06:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2CwnJ0fb72CXWgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 06:52:55 +0000
Date: Thu, 15 Jul 2021 08:52:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YO/bRs10jHRynMDv@pevik>
References: <20210713162450.34947-1-amir73il@gmail.com>
 <YO6SFGTvHJkAR5+9@pevik>
 <CAOQ4uxjjbv996OC_xqAtV1wttK51ytb3dPavS8F28K3QMU6Xzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjjbv996OC_xqAtV1wttK51ytb3dPavS8F28K3QMU6Xzw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify19: Add test cases for elevated
 reader privileges
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> On Wed, Jul 14, 2021 at 10:28 AM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Amir,

> > > Even when event reader has elevated privileges, the information provided
> > > in events is determined by the privileges of the user that created the
> > > fanotify group.

> > > Add test cases for unprivileged listener and privileged event reader.

> > > This is a regression test for kernel commit
> > > a8b98c808eab ("fanotify: fix permission model of unprivileged group")

> > > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> > > ---

> > > Hi Petr,

> > > Added test for a fix in v5.13-rc5.

> > Thanks for your patch, pushed!

> > Things I've found, not related to this patch:

> > TBROK when running with higher number of iterations:
> > ./fanotify19 -i 30
> > ...
> > fanotify19.c:224: TPASS: Received event: mask=2b, pid=11351 fd=-1
> > fanotify19.c:224: TPASS: Received event: mask=b, pid=11351 fd=-1
> > fanotify19.c:224: TPASS: Received event: mask=a, pid=11351 fd=-1
> > fanotify19.c:224: TPASS: Received event: mask=8, pid=11351 fd=-1
> > fanotify19.c:147: TINFO: Test #3 unprivileged lisneter, privileged reader - events by child
> > fanotify19.c:151: TINFO: Running as privileged user, revoking.
> > fanotify19.c:136: TBROK: Child process terminated incorrectly. Aborting

> > Summary:
> > passed   316
> > failed   0
> > broken   1
> > skipped  0
> > warnings 0

> > Could you have look into it?


> Posted fix.
Thanks!

> > very minor nit: checkpatch complains about minor issues. Although all but quoted
> > string split across lines are easily fixable we don't need to bother with it.
> > But could you please use checkpatch for new tests?

> Will do.
Thanks!

> > Also I'd personally join also strings which are below 100 chars, because it
> > helps to grep.

> > > @@ -248,6 +285,10 @@ static struct tst_test test = {
> > >       .needs_root = 1,
> > >       .mount_device = 1,
> > >       .mntpoint = MOUNT_PATH,
> > > +     .tags = (const struct tst_tag[]) {
> > > +             {"linux-git", "a8b98c808eab"},
> > FYI we also support "linux-stable-git", but we mainly use it for stable branch
> > specific patches (something required just for stable), not for regular backports
> > of fixes.


> I did not understand when linux-stable-git should be used or why it applies
> to this case.
I'm sorry for not being clear. It does not apply to this case, just FYI.
It's for commits which are stable branch specific, i.e. no commit in mainline.
Thus we have only two so far.

Example of commits: c4a23c852e80 cac68d12c531.

c4a23c852e80:
No upstream commit, this is a fix to a stable 5.4 specific backport.

cac68d12c531
[ Upstream commits 9392a27d88b9 and ff002b30181d ]

I'm going to send patch to our doc [1] to mention it.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/C-Test-API#138-test-tags

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
