Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138312F9DE
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:34:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 328B73C244D
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 16:34:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A695D3C2432
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:34:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0FE11600A46
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 16:34:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33E41AE2D;
 Fri,  3 Jan 2020 15:34:08 +0000 (UTC)
Date: Fri, 3 Jan 2020 16:34:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it, linux-fsdevel@vger.kernel.org
Message-ID: <20200103153406.GA22990@dell5510>
References: <20191209160227.16125-1-zlang@redhat.com>
 <20191226072338.GH14328@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191226072338.GH14328@dhcp-12-102.nay.redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/newmount: new test case for new mount
 API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zorro,

> > V3 test passed on ext2/3/4 and xfs[1], on upstream mainline kernel. Thanks
> > all your review points:)
> > But I have a question, how to test other filesystems, likes nfs, cifs?

> Ping.

> It's been several weeks passed. Is there more review points?
Sorry for a delay, that's how it works in open source projects (we're also
just contributors).
But you could speed up the review yourself, if you have carefully read reviews
and address suggestions :).

I like you use .all_filesystems = 1 as I suggested in [1], but I warned that it
breaks nfs.
newmount01.c:58: FAIL: fsopen ntfs: ENODEV (19)

Fortunately this does not need any patch for filtering nfs as TST_FS_SKIP_FUSE
is enough for it - add this to struct tst_test:
.dev_fs_flags = TST_FS_SKIP_FUSE

Not sure if just fsopen() is affected, but it probably does not make sense to test
just fsopen() and fsconfig().

There are some issues Xu found in v2 [2], which you didn't address:

> > +AC_DEFUN([LTP_CHECK_NEWMOUNT],[
> > +AC_CHECK_FUNCS(fsopen,,)
> > +AC_CHECK_FUNCS(fsconfig,,)
> > +AC_CHECK_FUNCS(fsmount,,)
> > +AC_CHECK_FUNCS(move_mount,,)
> > +AC_CHECK_HEADER(sys/mount.h,,,)
> > +])
> You use m4 to check them. But it seems that you don't use those macros
> in your cases.
> + I told you in v1 to move AC_CHECK_FUNCS and AC_CHECK_HEADER into configure.ac
> (there is sorted list you add things you need), we use m4/ltp-*.m4 files only
> for complex checks.
> 
> > +#include "tst_safe_macros.h"
> "tst_test.h" has included "tst_safe_macros.h"
=> simply just remove it.

> > +static int sfd, mfd;
> > +static int is_mounted = 0;
> static int sfd, mfd, is_mounted;
(static is always 0).

There are also Cyril's suggestions and objections [3]:

> > +static void setup(void)
> > +{
> > +	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, NULL);
>
> Why aren't we just setting .format_device in the test structure?

> > +static void cleanup(void)
> > +{
> > +	if (mount_flag == 1) {
> > +		TEST(tst_umount(MNTPOINT));
> > +		if (TST_RET != 0)
> > +			tst_brk(TBROK | TTERRNO, "umount failed");
>
> The library already produces TWARN if we fail to umount the device, so I
> would say that there is no need to TBROK here, the TBROK will be
> converted to TWARN anyways since it's in the cleanup...

He also noted, that umount must be done in test:
> > +	SAFE_CLOSE(mfd);
> We have to umount the device here, otherwise it would be mounted for
> each test iteration with -i.

Another reason for tst_umount() in test is for me that it looks a bit strange
for me to perform testing in cleanup function.

+ his objections against else blocks and struct test_cases (I fully agree with it).

[1] https://lists.linux.it/pipermail/ltp/2019-November/014619.html
[2] https://lists.linux.it/pipermail/ltp/2019-December/014702.html
[3] https://lists.linux.it/pipermail/ltp/2019-December/014654.html

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
