Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F602CB4FD
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 07:27:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5963C3C580C
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 07:27:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E95BC3C2BD7
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 07:27:41 +0100 (CET)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9DBF0600D75
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 07:27:41 +0100 (CET)
Received: by mail-il1-x141.google.com with SMTP id b8so526587ila.13
 for <ltp@lists.linux.it>; Tue, 01 Dec 2020 22:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ErVONd6PT+717HiTmvEKxyrmUHMR/9HRdPKIZO14+k=;
 b=ONlhOn9YnwhukegZKO4e9mRUZruud2RwNEjHoCkXPHugNHZGmegY98iOylcLAbgR2F
 3vAppfwuwPdaSVFwPcRFOr+W/Qok9rtxW1QkfURSoX6GNgyj38ienWEASrDTfH1oy4Gk
 AItiMLFtPoEW2uWdSS+oadHZZU9pWYPaVUx/vDS549WFdJGyNn0Af7PphUW+u07qF3BR
 zzxkPVfiIisPZDZsa/hqDo6ElO9z0aAMJwOx3A6hJ26pE+0GTkClmO4Pq67kmSLysKOx
 /wZHGBylPmRLyQP6l6k/9f387ZbrQ7LkcJTE5X3IDKIGfkaqX5gRYxoaLd6UnJJMSPG7
 t0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ErVONd6PT+717HiTmvEKxyrmUHMR/9HRdPKIZO14+k=;
 b=E/5mwzolIkJRCSUcaNxXYrEh7BEUjxORbcrZQDrxlu70t4LBCC2rkACAl5OmF6XeTb
 TwfCKvOGxk+wVi1xjh6ZMDu1J7xnLJcOoTdZWzVomn/HeEOpuYducnQHbJJGRR1ukF5T
 8R0KrPBZN5wgatyYP6KyGFHGSUrakiQr+ADoXDvZPVD4ccc5/eovxxtKiWfAIrpOQyfG
 oBI++UaUfBRF/BKNnDwhKnKytjH/OE1HnOEAhBUzfDJtVjXmXRYbdzJzrX6sZxIuCfK5
 RtTX/zR7wbPrbTz/MhR20r/19+1uEn6c0mXvNpXTYPaa1j5jk0W87f9/5cn/R65y9SNL
 C/iA==
X-Gm-Message-State: AOAM533b6SvlBv11PtMv38Um4MYnDbvQwn59Cah0rdGQ+RQCGbUeQcDn
 y+buEbLQFz0JXx7QYUY6VA8x2nnZyF+E84El+pY=
X-Google-Smtp-Source: ABdhPJw7fVHieDnbOlZF83jzOoumhLAxakTyluyfCsLrjLXCIPLPU4qZ14s/i3qIBYe2LYQZnsBx8Ch42pzjPM+SuOc=
X-Received: by 2002:a92:6403:: with SMTP id y3mr1143502ilb.72.1606890460471;
 Tue, 01 Dec 2020 22:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20201201174214.24625-1-pvorel@suse.cz>
 <20201201174214.24625-7-pvorel@suse.cz>
In-Reply-To: <20201201174214.24625-7-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 2 Dec 2020 08:27:29 +0200
Message-ID: <CAOQ4uxg_Kwmx1K=om9aA6Sh=+L129=YpneDW1ZLP2sL96ELNgw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 06/10] fanotify: Add helper for mark support
 check
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

On Tue, Dec 1, 2020 at 7:42 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> i.e. FAN_MARK_FILESYSTEM and use it in relevant tests setup().
> The purpose is to reduce checks (cleanup).
>
> NOTE: all tests check only for FAN_MARK_FILESYSTEM, but keep helper
> generic for future use.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New in v5.
>
>  testcases/kernel/syscalls/fanotify/fanotify.h | 21 ++++++++++++++++
>  .../kernel/syscalls/fanotify/fanotify01.c     | 12 +++++----
>  .../kernel/syscalls/fanotify/fanotify03.c     | 25 +++++++++----------
>  .../kernel/syscalls/fanotify/fanotify10.c     | 14 +++++------
>  .../kernel/syscalls/fanotify/fanotify13.c     | 15 +++++------
>  5 files changed, 55 insertions(+), 32 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> index 821e6cb29..2275a1da3 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -351,4 +351,25 @@ static inline void require_fanotify_fan_report_fid_supported_on_fs(const char *f
>  #define REQUIRE_FANOTIFY_FAN_REPORT_FID_SUPPORTED_ON_FS(fname) \
>         require_fanotify_fan_report_fid_supported_on_fs(__FILE__, __LINE__, (fname))
>
> +static inline int fanotify_mark_supported_by_kernel(uint64_t flag)
> +{
> +       int fd;
> +       int rval = 0;
> +
> +       fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
> +
> +       if (fanotify_mark(fd, FAN_MARK_ADD | flag, FAN_ACCESS_PERM, AT_FDCWD, ".") < 0) {
> +               if (errno == EINVAL) {
> +                       rval = -1;
> +               } else {
> +                       tst_brk(TBROK | TERRNO,
> +                               "fanotify_mark (%d, FAN_MARK_ADD, ..., FAN_ACCESS_PERM, AT_FDCWD, \".\") failed", fd);
> +               }

You meant FAN_ACCESS.

FAN_ACCESS_PERM requires CONFIG_FANOTIFY_ACCESS_PERMISSIONS which is not
a requirement for most of the affected tests.

Patch set is super! it's the only issue I found, so I don't think you
need to re-post for that.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
