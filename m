Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB12351467
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 13:15:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CD9E3C77BE
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 13:15:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C2523C222D
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 13:15:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8B1FC1000F4F
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 13:15:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CCAC1B137;
 Thu,  1 Apr 2021 11:15:01 +0000 (UTC)
Date: Thu, 1 Apr 2021 13:15:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YGWrNBxxmVUgT72/@pevik>
References: <20210326014137.15718-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326014137.15718-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/iso9660: bugfix for iso9660/isofs.sh
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

Hi,

> Debian uses genisoimage to replace mkisofs, the prompt of genisoimage
> is the same as that of mkisofs.

...
> +++ b/testcases/kernel/fs/iso9660/isofs.sh
> @@ -12,6 +12,12 @@
>  TST_NEEDS_CMDS="mkisofs"
>  TST_NEEDS_TMPDIR=1
>  TST_TESTFUNC=do_test
> +which mkisofs >/dev/null 2>&1
> +if [ $? -ne 0 ]; then
> +       TST_NEEDS_CMDS="genisoimage"
> +fi

You can omit whole $? check:

if ! which mkisofs >/dev/null 2>&1; then
	TST_NEEDS_CMDS="genisoimage"
fi

Also IMHO mkisofs is not dead [1], it just moved to schilytools [2] and some
distros use it (at least openSUSE [3]).
Thus asking for genisoimage (from cdrkit) can be a bit misleading.

But, is it really needed? Both Debian [4] and Fedora [5] creates
mkisofs symlink to genisoimage, Debian installs automatically genisoimage when
installing mkisofs.

Kind regards,
Petr

[1] https://wiki.osdev.org/Mkisofs
[2] http://sf.net/projects/schilytools/files/
[3] https://build.opensuse.org/package/show/utilities/schily
[4] https://tracker.debian.org/media/packages/c/cdrkit/changelog-91.1.11-3.2
[5] https://src.fedoraproject.org/rpms/cdrkit/blob/rawhide/f/cdrkit.spec

> +MKISOFS_CMD=$TST_NEEDS_CMDS
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
