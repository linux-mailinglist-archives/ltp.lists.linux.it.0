Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B0E23DB35
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 16:45:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD2683C321E
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 16:45:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D876D3C2334
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 16:45:02 +0200 (CEST)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9490860B7AE
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 16:43:31 +0200 (CEST)
Received: by mail-il1-x141.google.com with SMTP id j9so37228920ilc.11
 for <ltp@lists.linux.it>; Thu, 06 Aug 2020 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4cJ9kP3/QwzZNthUtsOjhu6rTVF+wY/ZoFelfzu+s4=;
 b=enQ46/8UJpafoTUsx6GsvtfMUmNj8dZqxhKn+aekJLw24TGyQe/9DB4NMJrXz8Gn3X
 3b8hQW1zt5ezg94/dlUE4j8oCdS173qlNMiCdLG8K2BfsoCmfCERxTEOAhj42XxdGKgE
 KvwVkfS2Lessc5mXmUyz2vADfJJWRjk6rpTdhboV/e+8IVyqnK4vGqIkEib5X05o6zOm
 XgjdZY+T09eZ100PUl6LzLJBDftBKLDGrLi8+JgHNxwZw5Jtqxn1Hc2lsok+1FPDxJ9q
 E+NLTBSs3wkCkdi+G+CAXN+V36HZms5s1ZjpxEJIJ8Db9qlBcOXc7SldMjuo92CmNbn3
 /vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4cJ9kP3/QwzZNthUtsOjhu6rTVF+wY/ZoFelfzu+s4=;
 b=C9fvUP0rKQvqfqTHbpr1VCnTL3j+NMjmHmDZgfhu1rXyFhMcgaVuI68Wape7QjDKQf
 f5SRZmMJ1zBLDzIvqrrn8BnjliykF3dGjH60I9EvOxo2n8cKddxFcYbjdc5FgM6wqOo7
 VsYIO8UaukP9JJt3YYh5WbQCPohy1Qo3ONobLWW7f84WT9ItM6Ta1tnfuqblRpiU/x73
 OX0xdxf5fNC3JsKNRANr06aqc+ZrWQjsIHyBcm6knIVtJgCamrtpiDGFIS+qOOnTGwKI
 I3RroqiL1FxWPgn+hbft/sE7yvnhn2+khR0Ek0JmgTkxkDmx6wELjWV5H6A9MKQ8D+8T
 1mag==
X-Gm-Message-State: AOAM530cCQon4b4NEwWjMVj9h+APMcEYznV+wTlP0X5k5p4e4QtiaRPR
 6RoP1xigjTWsSy6U3A/Jlq04gU4azmg6QYDDROImnw==
X-Google-Smtp-Source: ABdhPJwu/iLGRyqF0WyJN5ax5yp/CiX30nzRev10q3kB+HJmWGfUejCN7JqZDvohvLvyDAkwALRDLN5XJzctNqyJ27w=
X-Received: by 2002:a92:1805:: with SMTP id 5mr10588552ily.127.1596725099915; 
 Thu, 06 Aug 2020 07:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200728163416.556521-1-hch@lst.de>
 <20200728163416.556521-3-hch@lst.de>
In-Reply-To: <20200728163416.556521-3-hch@lst.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 6 Aug 2020 20:14:48 +0530
Message-ID: <CA+G9fYuYxGBKR5aQqCQwA=SjLRDbyQKwQYJvbJRaKT7qwy7voQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 02/23] fs: refactor ksys_umount
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-raid@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 28 Jul 2020 at 22:04, Christoph Hellwig <hch@lst.de> wrote:
>
> Factor out a path_umount helper that takes a struct path * instead of the
> actual file name.  This will allow to convert the init and devtmpfs code
> to properly mount based on a kernel pointer instead of relying on the
> implicit set_fs(KERNEL_DS) during early init.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/namespace.c | 40 ++++++++++++++++++----------------------
>  1 file changed, 18 insertions(+), 22 deletions(-)
>
> diff --git a/fs/namespace.c b/fs/namespace.c
> index 6f8234f74bed90..43834b59eff6c3 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -1706,36 +1706,19 @@ static inline bool may_mandlock(void)
>  }
>  #endif
>
> -/*
> - * Now umount can handle mount points as well as block devices.
> - * This is important for filesystems which use unnamed block devices.
> - *
> - * We now support a flag for forced unmount like the other 'big iron'
> - * unixes. Our API is identical to OSF/1 to avoid making a mess of AMD
> - */
> -
> -int ksys_umount(char __user *name, int flags)
> +static int path_umount(struct path *path, int flags)
>  {
> -       struct path path;
>         struct mount *mnt;
>         int retval;
> -       int lookup_flags = LOOKUP_MOUNTPOINT;
>
>         if (flags & ~(MNT_FORCE | MNT_DETACH | MNT_EXPIRE | UMOUNT_NOFOLLOW))
>                 return -EINVAL;
> -
>         if (!may_mount())
>                 return -EPERM;
>
> -       if (!(flags & UMOUNT_NOFOLLOW))
> -               lookup_flags |= LOOKUP_FOLLOW;
> -
> -       retval = user_path_at(AT_FDCWD, name, lookup_flags, &path);
> -       if (retval)
> -               goto out;
> -       mnt = real_mount(path.mnt);
> +       mnt = real_mount(path->mnt);
>         retval = -EINVAL;
> -       if (path.dentry != path.mnt->mnt_root)
> +       if (path->dentry != path->mnt->mnt_root)
>                 goto dput_and_out;
>         if (!check_mnt(mnt))
>                 goto dput_and_out;
> @@ -1748,12 +1731,25 @@ int ksys_umount(char __user *name, int flags)
>         retval = do_umount(mnt, flags);
>  dput_and_out:
>         /* we mustn't call path_put() as that would clear mnt_expiry_mark */
> -       dput(path.dentry);
> +       dput(path->dentry);
>         mntput_no_expire(mnt);
> -out:
>         return retval;
>  }
>
> +int ksys_umount(char __user *name, int flags)
> +{
> +       int lookup_flags = LOOKUP_MOUNTPOINT;
> +       struct path path;
> +       int ret;
> +
> +       if (!(flags & UMOUNT_NOFOLLOW))
> +               lookup_flags |= LOOKUP_FOLLOW;
> +       ret = user_path_at(AT_FDCWD, name, lookup_flags, &path);
> +       if (ret)
> +               return ret;
> +       return path_umount(&path, flags);
> +}
> +
>  SYSCALL_DEFINE2(umount, char __user *, name, int, flags)
>  {
>         return ksys_umount(name, flags);

Regressions on linux next 20200803 tag kernel.
LTP syscalls test umount03 mount a path for testing and
umount failed and retired for 50 times and test exit with warning
and following test cases using that mount path failed.

LTP syscalls tests failed list,
    * umount03
    * umount2_01
    * umount2_02
    * umount2_03
    * utime06
    * copy_file_range01


Summary
------------------------------------------------------------------------

kernel: 5.8.0
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git branch: master
git describe: next-20200803
Test details: https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200803
------------------------------------------------------------------------

test failed log:
tst_device.c:262: INFO: Using test device LTP_DEV='/dev/loop0'
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.43.8 (1-Jan-2018)
tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
[  870.449934] EXT4-fs (loop0): mounting ext2 file system using the
ext4 subsystem
[  870.454338] EXT4-fs (loop0): mounted filesystem without journal. Opts: (null)
[  870.456412] ext2 filesystem being mounted at
/tmp/ltp-YQrzWZNEEy/jVhqum/mntpoint supports timestamps until 2038
(0x7fffffff)
umount03.c:35: PASS: umount() fails as expected: EPERM (1)
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  1...
tst_device.c:388: INFO: Likely gvfsd-trash is probing newly mounted
fs, kill it to speed up tests.
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  2...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  3...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  4...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  5...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  6...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  7...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  8...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try  9...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 10...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 11...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 12...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 13...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 14...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 15...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 16...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 17...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 18...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 19...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 20...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 21...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 22...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 23...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 24...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 25...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 26...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 27...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 28...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 29...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 30...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 31...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 32...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 33...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 34...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 35...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 36...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 37...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 38...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 39...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 40...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 41...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 42...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 43...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 44...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 45...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 46...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 47...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 48...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 49...
tst_device.c:384: INFO: umount('mntpoint') failed with EBUSY, try 50...
tst_device.c:394: WARN: Failed to umount('mntpoint') after 50 retries
tst_tmpdir.c:337: WARN: tst_rmdir: rmobj(/tmp/ltp-YQrzWZNEEy/jVhqum)
failed: remove(/tmp/ltp-YQrzWZNEEy/jVhqum/mntpoint) failed; errno=16:
EBUSY
Summary:
passed   1
failed   0
skipped  0
warnings 1

mke2fs 1.43.8 (1-Jan-2018)
/dev/loop0 is mounted; will not make a filesystem here!
umount2_01    0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
umount2_01    0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
umount2_01    1  TBROK  :  tst_mkfs.c:103: umount2_01.c:81: mkfs.ext2
failed with 1
umount2_01    2  TBROK  :  tst_mkfs.c:103: Remaining cases broken
mke2fs 1.43.8 (1-Jan-2018)
/dev/loop0 is mounted; will not make a filesystem here!
umount2_02    0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
umount2_02    0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
umount2_02    1  TBROK  :  tst_mkfs.c:103: umount2_02.c:121: mkfs.ext2
failed with 1
umount2_02    2  TBROK  :  tst_mkfs.c:103: Remaining cases broken
mke2fs 1.43.8 (1-Jan-2018)
/dev/loop0 is mounted; will not make a filesystem here!
umount2_03    0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
umount2_03    0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
umount2_03    1  TBROK  :  tst_mkfs.c:103: umount2_03.c:101: mkfs.ext2
failed with 1
umount2_03    2  TBROK  :  tst_mkfs.c:103: Remaining cases broken

mke2fs 1.43.8 (1-Jan-2018)
/dev/loop0 is mounted; will not make a filesystem here!
utime06     0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
utime06     0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
utime06     1  TBROK  :  tst_mkfs.c:103: utime06.c:122: mkfs.ext2 failed with 1
utime06     2  TBROK  :  tst_mkfs.c:103: Remaining cases broken

Steps to reproduce:
-------------------------
cd /opt/ltp
./runltp -s umount                 --> FAILS

Above command runs all umount tests.

Test case description,
Verify that umount(2) returns -1 and sets errno to EPERM if the user
is not the super-user.
Test case link,
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/umount/umount03.c

full test log,
https://lkft.validation.linaro.org/scheduler/job/1642287

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
