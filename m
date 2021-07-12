Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A24333C5E0D
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 16:13:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DC823C7620
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 16:13:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 175C83C673C
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 16:13:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6E1A31A006B0
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 16:13:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACF1A2215C;
 Mon, 12 Jul 2021 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626099186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ky1XVH/uR1/1rSEHs+juk5BthlQ9CwAnh+36+1ivuZA=;
 b=Uya4aS8YqnYsFnIU4GrgToxwNgY6RozqvlP41f6wydIa2f1VUCD/PPbx2Z1fkTR0RgJ+7H
 +jAW5MLTSurq7WHixdQT+eOrBbYqcJXPdyMSDIz+jYfQiwr+l+VonsTNL1WbS+KcUy7tUf
 JEDmOODz//WYJFkA3iA4x07iNlw2TjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626099186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ky1XVH/uR1/1rSEHs+juk5BthlQ9CwAnh+36+1ivuZA=;
 b=nER227sTS92UMkzfn/H2xjXClHda1BWLWbg1G/trymwKBNwuhBViVb8SpD5HoxpVM1QFuS
 mow8emUxCgzYCKBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9488813AC4;
 Mon, 12 Jul 2021 14:13:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lOmzI/JN7GA7eAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 12 Jul 2021 14:13:06 +0000
Date: Mon, 12 Jul 2021 15:47:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YOxH9JgzwMfwo+Uc@yuki>
References: <20210712080322.11512-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712080322.11512-1-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mmap18: fix when PTHREAD_STACK_MIN < PAGE_SIZE
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
> PTHREAD_STACK_MIN can be less than the page size, to be more
> precise 2048 on musl. This value is used in the test as an
> offset for a new stack address with mmap() + MAP_FIXED flag.
> Though it might not be aligned to the page size.
> 
> This breaks the test with musl:
> 
>   tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
>   mmap18.c:98: TBROK: mmap(0x7fe67e2ee800,2048,3,306,-1,0) failed: EINVAL (22)
>   mmap18.c:169: TFAIL: Child: exited with 2
>   [...]
> 
> The fix is to align mapped_size arg to the page size.
> 
> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
> ---
>  testcases/kernel/syscalls/mmap/mmap18.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/syscalls/mmap/mmap18.c
> index dc2926454..b37b29890 100644
> --- a/testcases/kernel/syscalls/mmap/mmap18.c
> +++ b/testcases/kernel/syscalls/mmap/mmap18.c
> @@ -200,11 +200,12 @@ static void grow_stack_fail(size_t stack_size, size_t mapped_size)
>  
>  static void run_test(void)
>  {
> -	size_t stack_size = 8 * PTHREAD_STACK_MIN;
> +	size_t pthread_stack = LTP_ALIGN(PTHREAD_STACK_MIN, getpagesize());
> +	size_t stack_size = 8 * pthread_stack;

Looking at the code we have to align both stack size and mapped size so
this is correct. I guess that we can save a bit by aligning each of them
independently since 8 * PTHREAD_STACK_MIN would in most cases be aligned
allready.

	size_t pthread_stack = LTP_ALIGN(PTHREAD_STACK_MIN, getpagesize());
	size_t stack_size = LTP_ALIGN(8 * PTHREAD_STACK_MIN, getpagesize());

Either way this looks good so:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> -	grow_stack_success(stack_size, PTHREAD_STACK_MIN);
> +	grow_stack_success(stack_size, pthread_stack);
>  	grow_stack_success(stack_size, stack_size/2);
> -	grow_stack_fail(stack_size, PTHREAD_STACK_MIN);
> +	grow_stack_fail(stack_size, pthread_stack);
>  	grow_stack_fail(stack_size, stack_size/2);
>  }
>  
> -- 
> 2.25.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
