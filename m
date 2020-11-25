Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31F2C4611
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 17:56:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61E733C4E38
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 17:56:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4F2B63C223E
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 17:56:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3EFBE1A009BD
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 17:56:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF2D1AC22
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 16:56:25 +0000 (UTC)
Date: Wed, 25 Nov 2020 17:56:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201125165624.GB32471@pevik>
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-3-pvorel@suse.cz>
 <20201119101655.GC2785@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119101655.GC2785@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/5] fanotify: Handle supported features checks
 in setup()
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

Hi Cyril,

> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify07.c b/testcases/kernel/syscalls/fanotify/fanotify07.c
> > index c2e185710..f4e8ac9e6 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify07.c
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify07.c
> > @@ -195,6 +195,8 @@ static void test_fanotify(void)

> >  static void setup(void)
> >  {
> > +	fanotify_access_permissions_supported_by_kernel();
> > +
> >  	sprintf(fname, "fname_%d", getpid());
> >  	SAFE_FILE_PRINTF(fname, "%s", fname);
> >  }

> Shouldn't we drop the check for EINVAL in setup_instance() as well?
I postponed that cleanup to next commit - whole part is being replaced by:

SAFE_FANOTIFY_MARK(fd, FAN_MARK_ADD, FAN_ACCESS_PERM, AT_FDCWD, fname);

https://patchwork.ozlabs.org/project/ltp/patch/20201113164944.26101-4-pvorel@suse.cz/

But if you find this confusing, I can remove CONFIG_FANOTIFY_ACCESS_PERMISSIONS
already in this commit.

> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
> > index 90cf5cb5f..b95efb998 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify10.c
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
> > @@ -64,6 +64,7 @@ static unsigned int fanotify_class[] = {
> >  static int fd_notify[NUM_CLASSES][GROUPS_PER_PRIO];

> >  static char event_buf[EVENT_BUF_LEN];
> > +static int support_exec_events;

> >  #define MOUNT_PATH "fs_mnt"
> >  #define MNT2_PATH "mntpoint"
> > @@ -451,6 +452,11 @@ static void test_fanotify(unsigned int n)

> >  	tst_res(TINFO, "Test #%d: %s", n, tc->tname);

> > +	if (support_exec_events != 0 && tc->expected_mask_with_ignore & FAN_OPEN_EXEC) {
> > +		tst_res(TCONF | TERRNO, "FAN_OPEN_EXEC not supported in kernel?");
> > +		return;
> > +	}
> > +

> Maybe we should rename the variable to "exec_events_unsupported" then
> we could write:

> 	if (exec_events_unsupported && tc->mask & FAM_OPEN_EXEC)

> Which is a bit easier to understand.

+1.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
