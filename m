Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D052C6725
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 14:47:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8ED803C5DD7
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 14:47:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 406293C4E17
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 14:47:24 +0100 (CET)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D10156018A5
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 14:47:23 +0100 (CET)
Received: by mail-il1-x141.google.com with SMTP id k8so4669741ilr.4
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 05:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gl0myECUqK+Y5c0n8pXZ6+/kj80gd0domGxqwfr2+/k=;
 b=IgS776/L6aFCqRnK8mfhl2uihpzxwc9Gzvp4s2YZzG8bBCCKRron3NJiqfhCf4icM+
 q3g6Zr/2Z5ZfoP1FGkNIobTaifLBCPeCJne2vH9DjA3lWwEm2r00s+36hwS/TtnMMI2R
 0gLHueW8uZlcn8J7RQ16MVh8iCgrH9u5LdTYIUkz7h8GoMoCy/QCSLKdfymQmSQeD5Y5
 QL7Ap3fAIP381HZOS/Nbog73ftIS6jvqKADtUcor32lnr5IYCPIOGLibI2tkqk7HCwPn
 4fTSFtE7tu0Y30bi9ien5b5K6wySK/Wt2sIC7LbzL39zEMWpuN0z7mcF5NoUJ3/y2pHJ
 Ey8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gl0myECUqK+Y5c0n8pXZ6+/kj80gd0domGxqwfr2+/k=;
 b=sPXrN665Ht4SbUMQgrr0QEQs4jRDzOUjKKVZmIu8bIX6I7GX8KAra2YbPrWWteBC8F
 Oo4j2x9ZSxxV/RlgKzqnuG+grJxG8QFN18lmko6+DbC3LqRczwHhKr42PcOreMhOXjqF
 n4t578kzTr4tbBjYlIBdakePZQR+k9TZ4qMRVIBTOdMDlyY8K8nXvSQ0reuWIsn+ASyr
 iTSIc1ihmbWno8ezzNZJ4NRIvORXBe3nfH4Klqrvk9/BBgMtSnMbKY8Igk2LQUsmoTel
 GgvcvoSGcBj6OpEO/uNhMInS9aZFxSbsZvrcAqzDt+PuLXO+N/vNlneEfvpRvcupKazH
 V6GQ==
X-Gm-Message-State: AOAM532fzUaZu/Facae87AKKmzZZiOrWXn2lszl5nSqcOEA5Z8v85euW
 7wJHzrig3DQYton300KTYTtpkRjZjxMWaS/4f5I=
X-Google-Smtp-Source: ABdhPJwQae/aNMgI8S41OSHYRrOMsX8o2Jm+0rdUvY4wdr0lLG/4tYIDPfrTHumHJFhG1hu7t+NEmWKeUafGcCLWQAk=
X-Received: by 2002:a92:6403:: with SMTP id y3mr7414263ilb.72.1606484842672;
 Fri, 27 Nov 2020 05:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20201126214121.6836-1-pvorel@suse.cz>
 <20201126214121.6836-4-pvorel@suse.cz>
In-Reply-To: <20201126214121.6836-4-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2020 15:47:11 +0200
Message-ID: <CAOQ4uxh8yb+GRc2cN=MNcgBu8KZO=NPzmO9tSMkgRAvbUCXjZg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/6] fanotify: Check for FAN_REPORT_FID support
 on fs
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

On Thu, Nov 26, 2020 at 11:41 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> This is related to kernel fix
> a8b13aa20afb ("fanotify: enable FAN_REPORT_FID init flag")
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Just a minor nit below.
you may add:
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

As far as I am concerned, you do not need to re-post for the nits
if Cyril is going to fix my nit on merge (or even if he doesn't)

> ---
> New in v4.
> Maybe it'd deserve better commit message.
>
> There might be even more cleanup: not sure if nofid_fd in fanotify13.c
> is required. According to the description is probably required:

You're right, It is required.

>
> static void do_setup(void)
> {
>         require_fanotify_fan_report_fid_supported_on_fs(MOUNT_PATH);
>
>         nofid_fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
>
>         /* Create file and directory objects for testing */
>         create_objects();
>
>         /*
>          * Create a mark on first inode without FAN_REPORT_FID, to test
>          * uninitialized connector->fsid cache. This mark remains for all test
>          * cases and is not expected to get any events (no writes in this test).
>          */
>         SAFE_FANOTIFY_MARK(nofid_fd, FAN_MARK_ADD, FAN_CLOSE_WRITE, AT_FDCWD,
>                           FILE_PATH_ONE);
>
>         /* Get the filesystem fsid and file handle for each created object */
>         get_object_stats();
>
>  testcases/kernel/syscalls/fanotify/fanotify.h | 31 +++++++++++++++++++
>  .../kernel/syscalls/fanotify/fanotify01.c     |  9 +++++-
>  .../kernel/syscalls/fanotify/fanotify13.c     |  4 ++-
>  .../kernel/syscalls/fanotify/fanotify15.c     |  6 ++--
>  .../kernel/syscalls/fanotify/fanotify16.c     |  6 +---
>  5 files changed, 45 insertions(+), 11 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> index 413034336..c690b82d3 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -283,4 +283,35 @@ static inline int fanotify_exec_events_supported_by_kernel(uint64_t mask)
>         return rval;
>  }
>
> +static inline int fanotify_fan_report_fid_supported_on_fs(const char *fname)
> +{
> +       int fd;
> +       int rval = 0;
> +
> +       fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF | FAN_REPORT_FID, O_RDONLY);
> +
> +       if (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_FILESYSTEM,
> +                         FAN_ACCESS | FAN_MODIFY | FAN_CLOSE | FAN_OPEN,
> +                         AT_FDCWD, fname) < 0) {

All those flags are not really needed for the test.
This minimal arg list would have been enough:

fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS, AT_FDCWD, fname)

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
