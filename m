Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 81171205604
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 17:35:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50E8B3C22DE
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 17:35:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C83373C074B
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 17:35:50 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1B0D21001717
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 17:35:50 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id a9so23932468ljn.6
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0/mLCcTfl2C8WRN+Q51KcaPky/CCITIn3lw5Vjl08bE=;
 b=GN+CiqZBzT/XXrTdx+f07bZ4w5r9Lhz7S9XxNd9DiDN1JXwlAEbDfG2xtMojxSIqX2
 8ZLRa6c0d7IzpkEtyGimRSJyQhQYKOkAcNwRuNvgHkwPyCKuJu0iWI5V3tK9pLtEl7c3
 rkmmzXMP/vrbm1ChVi/wGu12+M/DlsGfQSb+5mYxJM6JQQZ0qvI65WW5r//dQVI+mhIX
 AGNa7EfrQuES/oDnsG/rmnaak7zmNUbmffylOOsaynTc8fJbv1Xo0sCemQEj3KasX3cm
 t7lUNVH6QTgIEFdE8DHweMzigYYTqV4NHiMKk/TfRlE5U9B80HGFen5ExzLCPMzSPpEO
 tr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0/mLCcTfl2C8WRN+Q51KcaPky/CCITIn3lw5Vjl08bE=;
 b=ervPWYli4aImvtC/fds+LQNTkYP4/YEH0ZXHSQrdrc2X15xaFpcTvxq2VIz2EwaIJL
 wO2gfUWIvyBlge9rmbwxJemEUVTey8gWn3kyl1amQy/Zp55Di70+b6+HFU9qun1s0QXy
 xBl4+RxUhXjb7CX5pg7V6UbV1Uju5Wv8CK1GkN45NfLZkFenPibiSvHsIK+5mc6Lyn8S
 q7fIUxYZplZcBdDQ/uQpHg0ZitSbJQjER/BsnTmtkmi8TJ4HSbrnkYPFY7hdOA0ildoy
 yGF2mKaK09U7IgCzSGkkUDlrYmaJI9678ZY2Ty+5X4nj7rlSyOW7kie2FHWxmX7/+vIp
 Juvg==
X-Gm-Message-State: AOAM530zCH9N9CSFAfX07X2qqE7RxifLkQIAYCtYC+byUqakvOYHfAq9
 viCm6yeJrnoZqUOZXNTBqET1xxRMBmjEC8YrfSufGA==
X-Google-Smtp-Source: ABdhPJyAMtIm5BHZDPb9F7Cryoq4V6/ui8e9lQOZjJ50oKuXcZPgDd5ftfrsCRbAJhiuyGwN+xd8FkkNQ+dQQ3QXtvI=
X-Received: by 2002:a2e:911:: with SMTP id 17mr12058746ljj.411.1592926548950; 
 Tue, 23 Jun 2020 08:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200618012218.607130-1-sashal@kernel.org>
 <20200618012218.607130-138-sashal@kernel.org>
In-Reply-To: <20200618012218.607130-138-sashal@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Jun 2020 21:05:37 +0530
Message-ID: <CA+G9fYuD_N8jfT3ai0PyS9evumOAY8YNzcjKhqATH3QPVawHdA@mail.gmail.com>
To: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH AUTOSEL 4.19 138/172] ovl: verify permissions in
 ovl_path_open()
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
Cc: Miklos Szeredi <mszeredi@redhat.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-unionfs@vger.kernel.org, linux- stable <stable@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 18 Jun 2020 at 07:16, Sasha Levin <sashal@kernel.org> wrote:
>
> From: Miklos Szeredi <mszeredi@redhat.com>
>
> [ Upstream commit 56230d956739b9cb1cbde439d76227d77979a04d ]
>
> Check permission before opening a real file.
>
> ovl_path_open() is used by readdir and copy-up routines.
>
> ovl_permission() theoretically already checked copy up permissions, but it
> doesn't hurt to re-do these checks during the actual copy-up.
>
> For directory reading ovl_permission() only checks access to topmost
> underlying layer.  Readdir on a merged directory accesses layers below the
> topmost one as well.  Permission wasn't checked for these layers.
>
> Note: modifying ovl_permission() to perform this check would be far more
> complex and hence more bug prone.  The result is less precise permissions
> returned in access(2).  If this turns out to be an issue, we can revisit
> this bug.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  fs/overlayfs/util.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index db8bdb29b320..afbc6a97da2a 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -479,7 +479,32 @@ bool ovl_is_whiteout(struct dentry *dentry)
>
>  struct file *ovl_path_open(struct path *path, int flags)
>  {
> -       return dentry_open(path, flags | O_NOATIME, current_cred());
> +       struct inode *inode = d_inode(path->dentry);
> +       int err, acc_mode;
> +
> +       if (flags & ~(O_ACCMODE | O_LARGEFILE))
> +               BUG();

This BUG: triggered on stable-rc 5.7, 5.4, 4.19 and 4.14 on arm64 architecture.

steps to reproduce:
          - cd /opt/ltp
          - ./runltp -s execveat03

tst_device.c:262: INFO: Using test device LTP_DEV='/dev/loop0'
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.43.8 (1-Jan-2018)
[  407.103235] ------------[ cut here ]------------
[  407.107890] kernel BUG at fs/overlayfs/util.c:486!
[  407.112704] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[  407.118209] Modules linked in: overlay rfkill crc32_ce crct10dif_ce fuse
[  407.124965] Process execveat03 (pid: 17583, stack limit = 0x0000000043f145d5)
[  407.132136] CPU: 5 PID: 17583 Comm: execveat03 Not tainted
4.19.130-rc1-00442-g6c3e013be752 #1
[  407.140774] Hardware name: ARM Juno development board (r2) (DT)
[  407.146718] pstate: 60000005 (nZCv daif -PAN -UAO)
[  407.151634] pc : ovl_path_open+0xc4/0xc8 [overlay]
[  407.156537] lr : ovl_path_open+0x2c/0xc8 [overlay]
[  407.161345] sp : ffff800909eaf8c0
[  407.164673] x29: ffff800909eaf8c0 x28: ffff800909eafb40
[  407.170011] x27: 0000000000000000 x26: ffff2000012de1c0
[  407.175349] x25: ffff800909785e6c x24: ffff8009042073f0
[  407.180687] x23: ffff800909eafb40 x22: ffff200009d4d8c8
[  407.186026] x21: ffff800909eafb40 x20: ffff8008e4e25238
[  407.191364] x19: 0000000000004000 x18: 0000000000000000
[  407.196700] x17: 0000000000000000 x16: 0000000000000000
[  407.202037] x15: 0000000000000000 x14: ffff200008340864
[  407.207375] x13: ffff20000833f61c x12: ffff20000833b7bc
[  407.212714] x11: ffff20000830c52c x10: ffff2000012c8158
[  407.218052] x9 : ffff20000830b12c x8 : ffff200008084788
[  407.223390] x7 : 0000000041b58ab3 x6 : 00000000f1f1f1f1
[  407.228726] x5 : 00000000f3000000 x4 : dfff200000000000
[  407.234064] x3 : dfff200000000000 x2 : 0000000000000007
[  407.239401] x1 : 0000000000004000 x0 : 0000000000000000
[  407.244736] Call trace:
[  407.247289]  ovl_path_open+0xc4/0xc8 [overlay]
[  407.251846]  ovl_check_d_type_supported+0x9c/0x178 [overlay]
[  407.257616]  ovl_fill_super+0x8d4/0x1ad8 [overlay]
[  407.262437]  mount_nodev+0x4c/0xb8
[  407.265942]  ovl_mount+0x18/0x20 [overlay]
[  407.270060]  mount_fs+0x64/0x1d8
[  407.273314]  vfs_kern_mount.part.0+0x4c/0x1a0
[  407.277696]  do_mount+0x27c/0x1080
[  407.281121]  ksys_mount+0x8c/0xe8
[  407.284459]  __arm64_sys_mount+0x64/0x80
[  407.288409]  el0_svc_common+0xac/0x1e8
[  407.292182]  el0_svc_handler+0x38/0x80
[  407.295951]  el0_svc+0x8/0xc
[  407.298859] Code: f94013f5 a8c37bfd d65f03c0 d4210000 (d4210000)
[  407.304977] ---[ end trace 50a1985db0cfa610 ]---

https://lkft.validation.linaro.org/scheduler/job/1515127#L3772

metadata:
  git branch: linux-4.19.y
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
  git commit: 6c3e013be752bf70e7321d7c813d68eac8ac36b0
  git describe: v4.19.128-442-g6c3e013be752
  make_kernelversion: 4.19.130-rc1
  kernel-config:
https://builds.tuxbuild.com/xGjDe8DWEXpxwsygVrqa6Q/kernel.config
  build-url: https://gitlab.com/Linaro/lkft/kernel-runs/-/pipelines/158883698

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
