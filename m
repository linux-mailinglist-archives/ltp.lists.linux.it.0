Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3457A83077
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 13:17:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0ADF3C176C
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 13:17:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 68F703C1C90
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 13:17:20 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7F91B1A01149
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 13:17:19 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id t16so41308454pfe.11
 for <ltp@lists.linux.it>; Tue, 06 Aug 2019 04:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4EWNHtJCYoNPHL1jsW8hEAcTtbGsGzDTZVLcn/kMGKc=;
 b=T8GeTHQD9Yv0Tn/Of7RynbI5MQXab5O9COdqaDv1A/wsrI/ebBbU0kPaZqxmezwsSH
 puqDS6bCJ8YDT3+Xvi/UKNfgsh7Jyk9G+Euki8HOkvszRqb9y3oXoAg/KOGhxv5kyUOt
 0sc1EcWb1k8GjvMsQDk9Hcm/K4lUHlDCnNL1cNB4gIE3rfqAoxiM0hlIcu1voagPcbDj
 E2Kd6yqSkb9hvKoW3c4IzWugakyTY8A+ZgaEl/wxE9gq5ClxhN5WID6Y/GWnyHobeGLr
 cNTzhbNUai9zt0AYmYEpmbyg31vG2bONA473xwOGPYFWrq6fRRqtmFBsAvrjah9zIDVi
 Ywng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4EWNHtJCYoNPHL1jsW8hEAcTtbGsGzDTZVLcn/kMGKc=;
 b=cxH9eVetdRExsNm9ro1+gzygmhiA6jvmjmOcmq7o/Gy28gHeomLXsks8g4WxY4nPIC
 HU1CBMi30rcYhuL7cXEVUS9swnQq1s/L6Sm40T7IN0gFLVyyGNu/nYityp94EsM6/rMg
 thIP2tkQcvWumHL1CjF9zDWjr5o4UxNj0FR/fvp70vFn7/CRf573jxEBmrpZwJm6hi+9
 +BZ0bWeD65qi7tYEJyc/DIikRVbNr6jCWZG4EDolQW6Fu1ZtMk0rMSinEePRbOIR/hAk
 QXzFrYojErGXJmB5b4iyTFa0QkaDKnqaCkCWDxVdUm4cd9nvLTp2yrVu5B1tW3Jp8701
 ONPA==
X-Gm-Message-State: APjAAAUzA5BBYZ/UXX8kOBcE74AIa3uSWS1IaIWjXttyREdOX/Tua4sD
 ejqri5L3ee+NWsoV/CBOrk8=
X-Google-Smtp-Source: APXvYqwpbgyAPgDV4ULqbLwBgwlL+S/t4tXu0ck8rU1ATLyMa7BVtNunoXSplaI3X0lgpTfZt/xFTg==
X-Received: by 2002:aa7:818b:: with SMTP id g11mr3184511pfi.122.1565090238026; 
 Tue, 06 Aug 2019 04:17:18 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 22sm100353962pfu.179.2019.08.06.04.17.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 04:17:17 -0700 (PDT)
Date: Tue, 6 Aug 2019 19:17:10 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190806111710.bknd7pxp6zb36xk5@XZHOUW.usersys.redhat.com>
References: <20190806091040.26448-1-pvorel@suse.cz>
 <20190806091040.26448-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806091040.26448-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/copy_file_range02: Add test
 description
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Aug 06, 2019 at 11:10:40AM +0200, Petr Vorel wrote:
> to increase readability as all_filesystems flag prolonged output a lot.

Test ok. Ack.

Thanks,
M

> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  .../copy_file_range/copy_file_range02.c       | 33 ++++++++++---------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 472dffdc6..56797f639 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -13,14 +13,14 @@
>   * 2) Try to copy contents to directory -> EISDIR
>   * 3) Try to copy contents to a file opened with the
>   *    O_APPEND flag -> EBADF
> - * 4) Try to copy contents to closed filedescriptor
> + * 4) Try to copy contents to closed file descriptor
>   *    -> EBADF
>   * 5) Try to copy contents with invalid 'flags' value
>   *    -> EINVAL
>   * 6) Try to copy contents to a file chattred with +i
>   *    flag -> EPERM
>   * 7) Try to copy contents to a swapfile ->ETXTBSY
> - * 8) Try to copy contents to the samefile with overlapping
> + * 8) Try to copy contents to the same file with overlapping
>   *    ->EINVAL
>   * 9) Try to copy contents to a blkdev ->EINVAL
>   * 10) Try to copy contents to a chardev ->EINVAL
> @@ -60,20 +60,21 @@ static struct tcase {
>  	int	exp_err;
>  	loff_t  dst;
>  	loff_t     len;
> +	const char *tname;
>  } tcases[] = {
> -	{&fd_rdonly,	0,   EBADF,      0,     CONTSIZE},
> -	{&fd_dir,	0,   EISDIR,     0,     CONTSIZE},
> -	{&fd_append,	0,   EBADF,      0,     CONTSIZE},
> -	{&fd_closed,	0,   EBADF,      0,     CONTSIZE},
> -	{&fd_dest,	-1,  EINVAL,     0,     CONTSIZE},
> -	{&fd_immutable, 0,   EPERM,      0,     CONTSIZE},
> -	{&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE},
> -	{&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2},
> -	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE},
> -	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE},
> -	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE},
> -	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX},
> -	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF},
> +	{&fd_rdonly,	0,   EBADF,      0,     CONTSIZE, "readonly file"},
> +	{&fd_dir,	0,   EISDIR,     0,     CONTSIZE, "directory"},
> +	{&fd_append,	0,   EBADF,      0,     CONTSIZE, "append to file"},
> +	{&fd_closed,	0,   EBADF,      0,     CONTSIZE, "closed file descriptor"},
> +	{&fd_dest,	-1,  EINVAL,     0,     CONTSIZE, "invalid flags"},
> +	{&fd_immutable, 0,   EPERM,      0,     CONTSIZE, "immutable file"},
> +	{&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE, "swap file"},
> +	{&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2, "overlaping"},
> +	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE, "block device"},
> +	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE, "charr device"},
> +	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE, "fifo"},
> +	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length lenght"},
> +	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
>  };
>  
>  static int run_command(char *command, char *option, char *file)
> @@ -97,6 +98,8 @@ static int run_command(char *command, char *option, char *file)
>  static void verify_copy_file_range(unsigned int n)
>  {
>  	struct tcase *tc = &tcases[n];
> +	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
> +
>  	if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
>  		tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
>  		return;
> -- 
> 2.22.0
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
