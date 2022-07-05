Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7FE5662B2
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 07:18:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AE6C3CA059
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 07:18:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A9923C2A8C
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 07:18:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 61300600443
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 07:18:03 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4787B221EA
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 05:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656998282;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3wQ7rCquHTCX8y7hp7Gmc1ypFO+CJ77/M6FOxssyiQ=;
 b=GDIscBoJmFwPROpcuMIOe+mEmyIr+ZHlpdwqirHciVP6L04OiOdp4c39ygoT80hPuPUJ/L
 zxokuf3Qs4PrgGHH5J1dsd2pk13sxaqkJLr6coAB2VIW3Qt1tOZbG5jy17We6vTcNKlU97
 WAejGgixjc/OWbe/l4wAT28rSWzPjbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656998282;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3wQ7rCquHTCX8y7hp7Gmc1ypFO+CJ77/M6FOxssyiQ=;
 b=99PZsZbfT4btH+sE67qjA/jLqFbvML3AyOLJU8n4QRmyWdhuBLXVVwwWydm8+kj2kKXPfs
 rtDGnm+WVzNe4xDQ==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id EFEDB2C141;
 Tue,  5 Jul 2022 05:18:01 +0000 (UTC)
References: <20220620092146.7604-1-chrubis@suse.cz>
 <20220620092146.7604-2-chrubis@suse.cz>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 05 Jul 2022 06:16:56 +0100
In-reply-to: <20220620092146.7604-2-chrubis@suse.cz>
Message-ID: <877d4st9x2.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/7] openposix: pthread_rwlockattr_getpshared/2-1:
 Fix
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

Cyril Hrubis <chrubis@suse.cz> writes:

> Propagate a failure in child to the parent properly.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  .../pthread_rwlockattr_getpshared/2-1.c       | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared/2-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared/2-1.c
> index 3ffdc0cea..72c40f117 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared/2-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared/2-1.c
> @@ -126,7 +126,11 @@ int main(void)
>  	if (pid == -1) {
>  		perror("Error at fork()");
>  		return PTS_UNRESOLVED;
> -	} else if (pid > 0) {
> +	}
> +
> +	if (pid > 0) {
> +		int status;
> +
>  		/* Parent */
>  		/* wait until child do wrlock */
>  		while (rwlock_data->data == 0) {
> @@ -141,7 +145,7 @@ int main(void)
>  		printf("Parent unlocked.\n");
>  
>  		/* Wait for child to end */
> -		wait(NULL);
> +		wait(&status);
>  
>  		if ((shm_unlink(shm_name)) != 0) {
>  			perror("Error at shm_unlink()");
> @@ -154,6 +158,16 @@ int main(void)
>  			return PTS_FAIL;
>  		}
>  
> +		if (!WIFEXITED(status)) {
> +			printf("Parent: did not exit properly!\n");
> +			return PTS_FAIL;
> +		}
> +
> +		if (WEXITSTATUS(status)) {
> +			printf("Parent: failure in child\n");
> +			return WEXITSTATUS(status);
> +		}
> +
>  		printf("Test PASSED\n");
>  		return PTS_PASS;
>  	} else {
> @@ -195,5 +209,7 @@ int main(void)
>  			rwlock_data->data = -1;
>  			return PTS_FAIL;
>  		}
> +
> +		return PTS_PASS;
>  	}
>  }
> -- 
> 2.35.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
