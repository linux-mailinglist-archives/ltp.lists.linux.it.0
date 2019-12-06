Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1E71154E8
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 17:15:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90EC73C2405
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 17:15:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2B2963C1C94
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 17:15:32 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id CF96C61B8CC
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 17:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575648929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlNjqVisVRXGyh1DPQ46MLWpZqiMCY26U11khUWf2Fs=;
 b=KS/cne+GgAx5U0oA/pM41oSURvwXzOxHiw783SqaITCzdvLv32cR1DXfBEOAJvfdJDT9OI
 UUuLalbS98jX/3I5dVrJDKK4syt7wj8NMvf4ChYyQgY4T/1O4/QnnhXk9umXv+hxE9qiQq
 lhozCQIT5BxZuCerouxI9edTxKIfmIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-Q2oiUNQ7NRmHWiUSN9BOHA-1; Fri, 06 Dec 2019 11:15:25 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D168017DF;
 Fri,  6 Dec 2019 16:15:24 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E6D45C6DC;
 Fri,  6 Dec 2019 16:15:23 +0000 (UTC)
Date: Sat, 7 Dec 2019 00:23:33 +0800
From: Zorro Lang <zlang@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191206162332.GH4601@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it,
 linux-fsdevel@vger.kernel.org
References: <20191128173532.6468-1-zlang@redhat.com>
 <20191203130339.GF2844@rei>
MIME-Version: 1.0
In-Reply-To: <20191203130339.GF2844@rei>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Q2oiUNQ7NRmHWiUSN9BOHA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/newmount: new test case for new mount API
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
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Dec 03, 2019 at 02:03:39PM +0100, Cyril Hrubis wrote:
> Hi!
> > +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> > diff --git a/testcases/kernel/syscalls/newmount/newmount01.c b/testcases/kernel/syscalls/newmount/newmount01.c
> > new file mode 100644
> > index 000000000..35e355506
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/newmount/newmount01.c
> > @@ -0,0 +1,150 @@
> > +/*
> > + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> > + * Author: Zorro Lang <zlang@redhat.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms of version 2 of the GNU General Public License as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it would be useful, but
> > + * WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> > + *
> > + * You should have received a copy of the GNU General Public License along
> > + * with this program; if not, write the Free Software Foundation, Inc.,
> > + * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > + *
> > + */
> > +
> > +/*
> > + *  DESCRIPTION
> > + *	Use new mount API (fsopen, fsconfig, fsmount, move_mount) to mount
> > + *	a filesystem.
> > + */
> > +
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <sys/prctl.h>
> > +#include <sys/wait.h>
> > +#include <sys/mount.h>
> > +
> > +#include "tst_test.h"
> > +#include "tst_safe_macros.h"
> > +#include "lapi/newmount.h"
> > +
> > +#define LINELENGTH 256
> > +#define MNTPOINT "newmount_point"
> > +static int sfd, mfd;
> > +static int mount_flag = 0;
> > +
> > +static int ismount(char *mntpoint)
> > +{
> > +	int ret = 0;
> > +	FILE *file;
> > +	char line[LINELENGTH];
> > +
> > +	file = fopen("/proc/mounts", "r");
> > +	if (file == NULL)
> > +		tst_brk(TFAIL | TTERRNO, "Open /proc/mounts failed");
> > +
> > +	while (fgets(line, LINELENGTH, file) != NULL) {
> > +		if (strstr(line, mntpoint) != NULL) {
> > +			ret = 1;
> > +			break;
> > +		}
> > +	}
> > +	fclose(file);
> > +	return ret;
> > +}
> 
> Hmm, this is very similar to file_lines_scanf(), maybe we need a library
> function that would iterate over file lines to call a callback on each
> of them as well. I will think about this.
> 
> > +static void setup(void)
> > +{
> > +	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, NULL);
> 
> Why aren't we just setting .format_device in the test structure?
> 
> > +}
> > +
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
> 
> > +	}
> > +}
> > +
> > +
> > +static void test_newmount(void)
> > +{
> > +	TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO,
> > +		        "fsopen %s", tst_device->fs_type);
> > +	} else {
> 
> There is no need for else branches after tst_brk(), the test will exit
> if we reach the tst_brk().

Sorry I can't be 100% sure what you mean at here. Do you mean as this:
--
TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
if (TST_RET < 0) {
	tst_brk(TFAIL | TTERRNO,
		"fsopen %s", tst_device->fs_type);
}
sfd = TST_RET;
tst_res(TPASS, "fsopen %s", tst_device->fs_type);
--

> 
> > +		sfd = TST_RET;
> > +		tst_res(TPASS,
> > +			"fsopen %s", tst_device->fs_type);
> > +	}
> > +
> > +	TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO,
> > +		        "fsconfig set source to %s", tst_device->dev);
> > +	} else {
> 
> Here as well.
> 
> > +		tst_res(TPASS,
> > +			"fsconfig set source to %s", tst_device->dev);
> > +	}
> > +
> > +	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO,
> > +		        "fsconfig create superblock");
> 
> And here.
> 
> > +	} else {
> > +		tst_res(TPASS,
> > +			"fsconfig create superblock");
> > +	}
> > +
> > +	TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO, "fsmount");
> > +	} else {
> 
> And here.
> 
> > +		mfd = TST_RET;
> > +		tst_res(TPASS, "fsmount");
> > +		SAFE_CLOSE(sfd);
> > +	}
> > +
> > +	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
> > +	if (TST_RET < 0) {
> > +		tst_brk(TFAIL | TTERRNO, "move_mount attach to mount point");
> > +	} else {
> 
> And here.
> 
> > +		tst_res(TPASS, "move_mount attach to mount point");
> > +		mount_flag = 1;
> > +		if (ismount(MNTPOINT))
> > +			tst_res(TPASS, "new mount works");
> > +		else
> > +			tst_res(TFAIL, "new mount fails");
> > +	}
> > +	SAFE_CLOSE(mfd);
> 
> We have to umount the device here, otherwise it would be mounted for
> each test iteration with -i.

OK, should I keep the 'umount' operation in cleanup() too?

Thanks,
Zorro

> 
> > +}
> > +
> > +struct test_cases {
> > +	void (*tfunc)(void);
> > +} tcases[] = {
> > +	{&test_newmount},
> > +};
> 
> Unless you plan to add more tests here, there is no point in declaring
> the structure with function pointers.
> 
> > +static void run(unsigned int i)
> > +{
> > +	tcases[i].tfunc();
> > +}
> > +
> > +static struct tst_test test = {
> > +	.test		= run,
> > +	.tcnt		= ARRAY_SIZE(tcases),
> > +	.setup		= setup,
> > +	.cleanup	= cleanup,
> > +	.needs_root	= 1,
> > +	.mntpoint	= MNTPOINT,
> > +	.needs_device	= 1,
> > +};
> 
> Otherwise it looks good.
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
