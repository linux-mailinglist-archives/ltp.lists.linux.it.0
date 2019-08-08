Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD71858D1
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 05:57:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24F773C1D00
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 05:57:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 25A5A3C1826
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 05:57:40 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 414C91400760
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 05:57:39 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id y8so816876plr.12
 for <ltp@lists.linux.it>; Wed, 07 Aug 2019 20:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z1ooqPdIRs/tsHBTeSSOXXoHWHM7YN+Y/PWuPzXUn1I=;
 b=kL9tp1z4ziTZ3MztHpa9ewHWrHM+dBVOl3KrB0AkGu/XAlJLheJiq4Fli4VVLxB8Eo
 1exXfhh2K29Il9zlWzY6nBn9Wkq7Z+8czqABytW9Nlepfdg9Y5Q9NYFPYGVSI8K0YUgc
 gxRhxxA3ZSWOD8//3vll8HpGi4/lMoTrKAZ7gYEJ5H3wHy+3gvXrNozShnZ8Y5BG3ukk
 tq15Afiyc2zCjuYbJFr7zImnqF3r2mPkVUwpRg2q6BcufjK30HoRLCGGRNYE90Mh1fTJ
 i8J8Gm6nO4jq71+QvqxfVUkFvEZDVI3zS/H4epEmkxuWpbVYi9fUY4BbsdmLagTE82/D
 tiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z1ooqPdIRs/tsHBTeSSOXXoHWHM7YN+Y/PWuPzXUn1I=;
 b=nD7KIX2xWnndBeTaB1NKi6Oh/GsKT2qBbmSuU0pQQaLa9GgQv9xg2Azi4WLrk8PquB
 2em4lf3qOYC4aYfSbrSAJyaqv58WEmrpZ0u1HUhP4p/2SqBnt+zH+fIOH9prf2bD6gtY
 MTxkgj+EuKQ68Wm9XFdNwZ9pcNVq9yOUmKX93PZSMv4VuQ81iYbA5Hd55rFTdr8MAgSr
 Wf5EcaqbpsjO90MUyNGq69uvs9IrJrC17UVJfddavr5gS+XGrxCuCZqO5EwIV4E4n9Ks
 GdR/oXSEFrmR4WiyR/FEhDQmYiPytUvOOqD1nkRr9p3AN6V4gTF3Jw7/tPseOZdw2qO9
 LBHw==
X-Gm-Message-State: APjAAAUcV9dIxGrNLM1AuPYJ8YJS1xo7aa4bCkH6iMd/8fNCz4WX/Ko8
 RuW9ERWXBeK8yTNEiZcAQR2KO78l
X-Google-Smtp-Source: APXvYqyqYPSfvwTIahJZ9431LAnsS1BQFwpOBt8dwNVB59nwoNETcnwlesYUxFE1HCRAklRi1jpMgw==
X-Received: by 2002:a17:902:86:: with SMTP id
 a6mr11570445pla.244.1565236657878; 
 Wed, 07 Aug 2019 20:57:37 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id d12sm58350046pfn.11.2019.08.07.20.57.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 20:57:37 -0700 (PDT)
Date: Thu, 8 Aug 2019 11:57:30 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190808035730.3kzors4trok6amtr@XZHOUW.usersys.redhat.com>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190805065832.ti6vpoviykfaxcj7@XZHOUW.usersys.redhat.com>
 <5D47D6B9.9090306@cn.fujitsu.com>
 <20190805102211.pvyufepn6xywi7vm@XZHOUW.usersys.redhat.com>
 <20190806162703.GA1333@dell5510>
 <20190807101742.mt6tgowsh4xw5hyt@XZHOUW.usersys.redhat.com>
 <5D4B92EF.4090800@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D4B92EF.4090800@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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
Cc: linux-xfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Aug 08, 2019 at 11:11:43AM +0800, Yang Xu wrote:
> on 2019/08/07 18:17, Murphy Zhou wrote:
> 
> > And I have a question about LTP itself.
> >
> > If we run the testcase directly like:
> > 	 ./testcases/kernel/syscalls/copy_file_range/copy_file_range02
> >
> > to test all_filesystems, for every filesystem, we mkfs and mount it in
> > .mntpoint, but we do not chdir to .mntpoint. So we are running tests in 
> > the same tmpdir, fs type of which does not change while looping
> > all_filesystems.  Only the .mntpoint in tmpdir has different fs type in
> > each loop.
> >
> > Now we are using this to test cross-device copy in copy_file_range01.c,
> > but in copy_file_range02.c, we are not using .mntpint at all, all the
> > tests in the all_filesystems loop are running in the same tmpdir. In other
> > words, we are NOT testing all filesystems.
> >
> > Is this expected?
>  I removed the mnted test for cross-device copy_file_range in copy_file_range02.c.
> And I ignore the non-used mntpoint. IMO, we can directly use the FILE_MNTED to test EFBIG on all filesystems, 

If mntpoint is not used, it makes absolutely NO sense to test all_filesystems.

Because in the all_filesystems loop, various supported filesystems are
created and mounted in mntpoint.

And the copy_file_range tests happens outside of mntpoint. It just repeats
the same test several times in the same tmpdir, fs type of which depends
on /tmp configuration.

When the log prints "testing ext2", it's not the truth.

EFBIG is another issue.

Thanks,
Murphy
> 
> as below:
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 26bfa008a..67974ffa2 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -49,6 +49,7 @@ static int fd_blkdev;
>  static int fd_chrdev;
>  static int fd_fifo;
>  static int fd_copy;
> +static int fd_mnted;
> 
>  static int chattr_i_nsup;
>  static int swap_nsup;
> 
> @@ -73,7 +74,7 @@ static struct tcase {
>         {&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE},
>         {&fd_fifo,      0,   EINVAL,     0,     CONTSIZE},
>         {&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX},
> -       {&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF},
> +       {&fd_mnted,      0,   EFBIG,      MAX_OFF, MIN_OFF},
>  };
> 
>  static int run_command(char *command, char *option, char *file)
> @@ -117,7 +118,10 @@ static void verify_copy_file_range(unsigned int n)
>                         tst_res(TPASS | TTERRNO,
>                                         "copy_file_range failed as expected");
>                 } else {
> -                       tst_res(TFAIL | TTERRNO,
> +                       if (tc->exp_err == EFBIG && TST_ERR == EXDEV)
> +                               tst_res(TCONF, "copy_file_range doesn't support cross-device,skip it");
> +                       else
> +                               tst_res(TFAIL | TTERRNO,
>                                 "copy_file_range failed unexpectedly; expected %s, but got",
>                                 tst_strerrno(tc->exp_err));
>                         return;
> 
> @@ -152,6 +156,8 @@ static void cleanup(void)
>                 SAFE_CLOSE(fd_dup);
>         if (fd_copy > 0)
>                 SAFE_CLOSE(fd_copy);
> +       if (fd_mnted > 0)
> +               SAFE_CLOSE(fd_mnted);
>         SAFE_UNLINK(FILE_FIFO);
>  }
> 
> @@ -194,6 +200,7 @@ static void setup(void)
> 
>         fd_copy = SAFE_OPEN(FILE_COPY_PATH, O_RDWR | O_CREAT | O_TRUNC, 0664);
>         chattr_i_nsup = run_command("chattr", "+i", FILE_IMMUTABLE_PATH);
> +       fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
> 
>         if (!tst_fs_has_free(".", sysconf(_SC_PAGESIZE) * 10, TST_BYTES)) {
>                 tst_res(TCONF, "Insufficient disk space to create swap file");
>                 swap_nsup = 3;
> 
> test12) succeed on extN, failed on both btrfs and xfs, we need to detect filesystem type to handle. Or, I think we 
> can set a limit on filesize because this kind of user scene is a bit more than the first one , the EFBIG error can be 
> received easily (Also, we don't need  mnt_device mntpoint all_filesystem if so).
> What do you think about it?
> 
> > I commented out testcases in copy_file_range02.c other then #12, and add
> > some nasty debug info:
> 
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
