Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9D13D891
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 12:08:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC62B3C2379
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 12:08:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 426643C2357
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 12:08:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5857210000D8
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 12:08:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96FF9AC37;
 Thu, 16 Jan 2020 11:08:04 +0000 (UTC)
Date: Thu, 16 Jan 2020 12:08:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
 Li Wang <liwang@redhat.com>, ltp@lists.linux.it
Message-ID: <20200116110803.GA8586@dell5510>
References: <20191209160227.16125-1-zlang@redhat.com>
 <20191226072338.GH14328@dhcp-12-102.nay.redhat.com>
 <20200113153141.GA14282@dhcp-12-102.nay.redhat.com>
 <20200114081449.GB3468@dell5510>
 <20200114093633.GD14282@dhcp-12-102.nay.redhat.com>
 <20200114095804.GA9211@dell5510>
 <20200115090125.GE14282@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115090125.GE14282@dhcp-12-102.nay.redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

> About the TST_FS_SKIP_FUSE flag I have below questions:

> 1) About ntfs and vfat test
> You said below content in [1]:

>   I like you use .all_filesystems = 1 as I suggested in [1], but I warned that it
>   breaks nfs.
>   newmount01.c:58: FAIL: fsopen ntfs: ENODEV (19)

>   Fortunately this does not need any patch for filtering nfs as TST_FS_SKIP_FUSE
>   is enough for it - add this to struct tst_test:
>   .dev_fs_flags = TST_FS_SKIP_FUSE

>   Not sure if just fsopen() is affected, but it probably does not make sense to test
>   just fsopen() and fsconfig().

> Actually if you fsopen("ntfs", ...), it doesn't test FUSE. It's testing linux
> kernel ntfs:
>   # lsmod |grep ntfs
>   ntfs                  819200  0

> Similar for vfat:
>   # lsmod |grep fat
>   vfat                   45056  0
>   fat                   274432  1 vfat

> And from my test on linux 5.5-rc4, the ntfs and vfat can test passed:
>   ...
>   tst_test.c:1278: INFO: Testing on vfat
>   tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
>   tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
>   newmount01.c:62: PASS: fsopen vfat
>   newmount01.c:69: PASS: fsconfig set source to /dev/loop0
>   newmount01.c:77: PASS: fsconfig create superblock
>   newmount01.c:84: PASS: fsmount
>   newmount01.c:92: PASS: move_mount attach to mount point
>   newmount01.c:96: PASS: new mount works
>   tst_test.c:1278: INFO: Testing on ntfs
>   tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ntfs opts='' extra opts=''
>   The partition start sector was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
>   The number of sectors per track was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
>   The number of heads was not specified for /dev/loop0 and it could not be obtained automatically.  It has been set to 0.
>   To boot from a device, Windows needs the 'partition start sector', the 'sectors per track' and the 'number of heads' to be set.
>   Windows will not be able to boot from this device.
>   tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
>   newmount01.c:62: PASS: fsopen ntfs
>   newmount01.c:69: PASS: fsconfig set source to /dev/loop0
>   newmount01.c:77: PASS: fsconfig create superblock
>   newmount01.c:84: PASS: fsmount
>   newmount01.c:92: PASS: move_mount attach to mount point
>   newmount01.c:96: PASS: new mount works

> You hit that error, maybe due to your current kernel didn't build these fs
> modules, but your system has mkfs.ntfs* tool.
You're right (CONFIG_NTFS_FS not set, but mkfs.ntfs).
Sorry for a wrong suggestion.

The rest I'll reply at v4 of your post.

> 2) About if this case supports FUSE:

> This current code of this case can't do a FUSE mount, due to if we want to mount
> a fs through FUSE, we need to do more things, something likes:
>   fd = open(/dev/fuse, ...)
>   fsfd = fsopen("fuse", ...);
>   ...
>   fsconfig(fsfd, FSCONFIG_SET_FD, "fd", NULL, fd);
>   ...
>   (more)
>   ...

> It's not a simple mount as general localfs mount does. So I didn't do that.
> If need, I'd like to write another case to cover that.

> 3) About the TST_FS_SKIP_FUSE flag:

> If you want to skip ntfs and vfat test by set .dev_fs_flags = TST_FS_SKIP_FUSE
> for this case. I think it doesn't work. The reason as I said above. Actually
> if the current kernel support ntfs and vfat (build them), and we have mkfs.ntfs
> and mkfs.vfat tools, then this case can test it.

> But if we have the tools, but don't have the kernel support. The case will fail
> as you hit.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
