Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E3F392B1F
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 11:49:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C86083C7730
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 11:49:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 45B313C2A93
 for <ltp@lists.linux.it>; Thu, 27 May 2021 11:49:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 579B1200D41
 for <ltp@lists.linux.it>; Thu, 27 May 2021 11:49:23 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C1F52190B;
 Thu, 27 May 2021 09:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622108962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzNIyJP8JENX+xDtbe4qYQyvpT7EadwFH5B3IjAcVzQ=;
 b=LEiBW8yoGtnojeXexMnfGrfShpMmoyq4fh1ICIu8FqSY5CRluJ5/HHrt1RB8gMxJ1L6ZY/
 XgR+fDQDzNNkVn/4I1JeHja2C8EOEd/QxXEmP33VXufyD3/uTWznbVtjlgRfUyES8QkFAu
 cWXXmfe70qRovFEF5iXvHBxexP+QI1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622108962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzNIyJP8JENX+xDtbe4qYQyvpT7EadwFH5B3IjAcVzQ=;
 b=nmmvQlXc1zc4uRW3GiJK2wEH4LKje2ePO4sf/Kw+8/B6H8+bEq9d5mV3XrryKcEzt/pjsz
 /1sQmhB5Rfy+/nCQ==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 7D23B11A98;
 Thu, 27 May 2021 09:49:22 +0000 (UTC)
Date: Thu, 27 May 2021 11:23:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YK9lCnXHO2k810Sc@yuki>
References: <20210527053615.13254-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527053615.13254-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] read02: Fix the failure of mips architecture
 test
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

Hi!
> under mips architecture, writing to the buf of mmap PROT_NONE will
> report an error EPERM.

That is reallly strange as far as I can tell the first check that vfs_read()
does is:

ssize_t vfs_read(struct file *file, char __user *buf, size_t count, loff_t *pos)
{
        ssize_t ret;

        if (!(file->f_mode & FMODE_READ))
                return -EBADF;
        if (!(file->f_mode & FMODE_CAN_READ))
                return -EINVAL;
        if (unlikely(!access_ok(buf, count)))
                return -EFAULT;

...

Here for PROT_NONE the access_ok() will fail and we end up with EFAULT.

And the read syscall entry point calls ksys_read() which calls vfs_read() in a
case that the file descriptor is correct. So the only way how this can fail is
that you are not allowed to read from the file descriptor that the tests opens
for reading in the test setup() which should not happen. This looks more like a
kernel bug than anything else.

> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> 
> diff --git a/testcases/kernel/syscalls/read/read02.c b/testcases/kernel/syscalls/read/read02.c
> index 9199a95f6..650449e92 100644
> --- a/testcases/kernel/syscalls/read/read02.c
> +++ b/testcases/kernel/syscalls/read/read02.c
> @@ -52,7 +52,9 @@ static struct tcase {
>  } tcases[] = {
>  	{&badfd, &bufaddr, 1, EBADF},
>  	{&fd2, &bufaddr, 1, EISDIR},
> -#ifndef UCLINUX
> +#if defined(__mips)
> +	{&fd3, &outside_buf, 1, EPERM},
> +#elif !defined(UCLINUX)
>  	{&fd3, &outside_buf, 1, EFAULT},
>  #endif
>  	{&fd4, &addr4, 1, EINVAL},
> @@ -98,7 +100,7 @@ static void setup(void)
> 
>  	fd3 = SAFE_OPEN("test_file", O_RDWR);
> 
> -#if !defined(UCLINUX)
> +#if !defined(UCLINUX) || defined(__mips)
>  	outside_buf = SAFE_MMAP(0, 1, PROT_NONE,
>  				MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
>  #endif

We do not support UCLINUX anymore so if anything the UCLINUX ifdefs should be removed first.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
