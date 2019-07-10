Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3C64320
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:51:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C0E73C1C7C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:51:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 09D473C02C2
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:51:05 +0200 (CEST)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 315901A00E1E
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:51:04 +0200 (CEST)
Received: by mail-yb1-xb44.google.com with SMTP id f195so453504ybg.9
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8O4DtY2tileliPuhjxKQxyKbw46v2ymBqyWhR5QHbEk=;
 b=QaOdbaRsf2vEkBdsDdzS+iXxWIECLO6wR9ZyfTBoSz5gqc2PkM72cIXHP6PHZQi72y
 Ig9MUbG0aXLNBLC6K3e+pMZ3kRf49uYvzyYuke55DGh9/lp/aW8z2tBZcyJo4QVdSUXE
 N2rk26H6bD2l5c8EKM6jOZJtCKTEm0tsr2KL1Pjpgo6MBqd7cpRzHlYK0X6tkAymPH8W
 XnaE2tnrHdMC1Ah5B4gvXeMOd1rB4T8vhACpwwOwrJ0I7E39efiE5YncliunF7n/v1OP
 KhJYrFGIJzpia3nH2baK8seBIalFdp/atnolo2ps8Clb9Xizrc5pVQhn/4UJ5wePb5CO
 6q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8O4DtY2tileliPuhjxKQxyKbw46v2ymBqyWhR5QHbEk=;
 b=HCju8SMJ1kazlWeF67br98Nh/YMxXkrDoiL0RHI5ZFBrVZvwGV1raxvkl2gQZSY22y
 57xeykDn7pPUc4xFJxhC2rfl9QI+gnfBboSsmJtWw8AA4RsuN1NxRf05aO0uJK77ljsS
 QVpXloGA0D0S7M/sFmxMy0UojePtWbZeyNLwLoz85umQKHDiKNH1uhaViwIiWykqoIE6
 QU0WAPmO1kNeL+wyVGxee3js7+be4Biq5Xz5tpu9D1lje3cWmZV6OYA+0zxi/5zKbR3H
 LUIDtlz2gjOOiRF0YQ9RzSEY3t571jiLGzNQtO1/i9VGE45fnvQrB46z1U6jIvoiK8eK
 N2iA==
X-Gm-Message-State: APjAAAXvuZG/ghlMuIf8jn54mZ3yonZHzn/l/AAh+kBhs2hZk3+yQKh7
 i9I6MuDb/7x5wNK/yl17BTmXWcbYjc4De7mEnQA=
X-Google-Smtp-Source: APXvYqyhC8rRR7Pp12Mczn3uK4kD7D3gfLEuq16ftDjtl3337PO6Z0yXkhwmIHV03JABcrWQ+E0xIhAtjSf3M6cgqYs=
X-Received: by 2002:a25:c486:: with SMTP id
 u128mr16470377ybf.428.1562745063029; 
 Wed, 10 Jul 2019 00:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxhjbaszcCL0=QAncBT3PzqJR_7oyR+_0-zNa-pt6JNQSA@mail.gmail.com>
 <1562743104-2705-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1562743104-2705-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1562743104-2705-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 10 Jul 2019 10:50:51 +0300
Message-ID: <CAOQ4uxi-pv_RFVWOMoAPxzvRXh7KUOjs56wtPwoCLiW4GNOj0Q@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] syscalls/copy_file_range01: add
 cross-device test
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jul 10, 2019 at 10:18 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Amir has relaxed cross-device constraint since commit(vfs: allow
> copy_file_range to copy across devices), I think we can remove it
> in copy_file_range02 and test it in copy_file_range01.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  .../copy_file_range/copy_file_range01.c       | 53 +++++++++++++++----
>  1 file changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> index a5bd5e7f7..aef626fce 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> @@ -24,7 +24,17 @@
>
>  static int page_size;
>  static int errcount, numcopies;
> -static int fd_in, fd_out;
> +static int fd_in, fd_out, cross_sup;
> +char FILE_TARGET_PATH[40];
> +
> +static struct tcase {
> +       char    *path;
> +       int     flags;
> +       char    *message;
> +} tcases[] = {
> +       {FILE_DEST_PATH,  0, "non cross-device"},
> +       {FILE_MNTED_PATH, 1, "cross-device"},
> +};
>
>  static int check_file_content(const char *fname1, const char *fname2,
>         loff_t *off1, loff_t *off2, size_t len)
> @@ -131,7 +141,7 @@ static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
>                 to_copy -= TST_RET;
>         } while (to_copy > 0);
>
> -       ret = check_file_content(FILE_SRC_PATH, FILE_DEST_PATH,
> +       ret = check_file_content(FILE_SRC_PATH, FILE_TARGET_PATH,
>                 off_in, off_out, len);
>         if (ret) {
>                 tst_res(TFAIL, "file contents do not match");
> @@ -152,7 +162,7 @@ static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
>  static void open_files(void)
>  {
>         fd_in  = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
> -       fd_out = SAFE_OPEN(FILE_DEST_PATH, O_CREAT | O_WRONLY | O_TRUNC, 0644);
> +       fd_out = SAFE_OPEN(FILE_TARGET_PATH, O_CREAT | O_WRONLY | O_TRUNC, 0644);
>  }
>
>  static void close_files(void)
> @@ -163,9 +173,18 @@ static void close_files(void)
>                 SAFE_CLOSE(fd_in);
>  }
>
> -static void copy_file_range_verify(void)
> +static void copy_file_range_verify(unsigned int n)
>  {
>         int i, j, k;
> +       struct tcase *tc = &tcases[n];
> +
> +       if (tc->flags && !cross_sup) {
> +               tst_res(TCONF,
> +                       "copy_file_range doesn't support cross-device, skip it");
> +               return;
> +       }
> +
> +       strcpy(FILE_TARGET_PATH, tc->path);
>
>         errcount = numcopies = 0;
>         size_t len_arr[]        = {11, page_size-1, page_size, page_size+1};
> @@ -190,25 +209,33 @@ static void copy_file_range_verify(void)
>
>         if (errcount == 0)
>                 tst_res(TPASS,
> -                       "copy_file_range completed all %d copy jobs successfully!",
> -                       numcopies);
> +                       "%s copy_file_range completed all %d copy jobs successfully!",
> +                       tc->message, numcopies);
>         else
> -               tst_res(TFAIL, "copy_file_range failed %d of %d copy jobs.",
> -                               errcount, numcopies);
> +               tst_res(TFAIL, "%s copy_file_range failed %d of %d copy jobs.",
> +                       tc->message, errcount, numcopies);
>  }
>
>  static void setup(void)
>  {
> -       int i, fd;
> +       int i, fd, fd1;
>
>         syscall_info();
>
>         page_size = getpagesize();
> -
> +       cross_sup = 1;
>         fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>         /* Writing page_size * 4 of data into test file */
>         for (i = 0; i < (int)(page_size * 4); i++)
>                 SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
> +
> +       fd1 = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
> +       TEST(sys_copy_file_range(fd, 0, fd1, 0, CONTSIZE, 0));
> +       if (TST_RET == -1)

I would restrict TCONF to errno == EXDEV.
Otherwise, a proper test failure is in order IMO.

> +               cross_sup = 0;
> +
> +       SAFE_CLOSE(fd1);
> +       remove(FILE_MNTED_PATH);
>         SAFE_CLOSE(fd);
>  }
>
> @@ -220,7 +247,11 @@ static void cleanup(void)
>  static struct tst_test test = {
>         .setup = setup,
>         .cleanup = cleanup,
> +       .tcnt = ARRAY_SIZE(tcases),
>         .needs_tmpdir = 1,
> -       .test_all = copy_file_range_verify,
> +       .mount_device = 1,
> +       .mntpoint = MNTPOINT,
> +       .all_filesystems = 1,
> +       .test = copy_file_range_verify,
>         .test_variants = TEST_VARIANTS,
>  };
> --
> 2.18.1
>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
