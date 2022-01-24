Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 278F44982A3
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 15:43:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E90F3C926E
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 15:43:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 29B9E3C7E58
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 15:43:02 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6E34010009F5
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 15:43:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7068D1F38B;
 Mon, 24 Jan 2022 14:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643035381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=20iTS7b1EqcePa0So8//Nn/9q29HpEhiWHs/kMtYt7I=;
 b=LNcSXEVMstKfzwIgwV3HC2+fAZywWYzapbRyXOJjvJPjRTLQ3Wt++NWRT6txWz3ukmpVvM
 GcJ37YfutL8JdZQXrCG90zsb7OsOd2VSQI2sIJl4gzIgnAf3X5PlLs7VNTQiYU5XkAq5HP
 KZmM+31ZhLg9H2lF5gLj9/80P815ozE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643035381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=20iTS7b1EqcePa0So8//Nn/9q29HpEhiWHs/kMtYt7I=;
 b=2U6mXfGK/08iJL1EeP1yX+oGAKsFVkcgb0+8yeEWu0j+UEcEOwr5X5pEgi5EoyalNHmzxF
 Wj3fK1g1sU6f/KAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 574C513BA5;
 Mon, 24 Jan 2022 14:43:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W+FDFfW67mHufwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 24 Jan 2022 14:43:01 +0000
Date: Mon, 24 Jan 2022 15:44:47 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <Ye67X6D1TprHrHcF@yuki>
References: <20220119152732.21189-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119152732.21189-1-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Replace ltp_syscall with tst_syscall
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
> diff --git a/include/lapi/syscalls/regen.sh b/include/lapi/syscalls/regen.sh
> index d7daf8ad0..8fa381c97 100755
> --- a/include/lapi/syscalls/regen.sh
> +++ b/include/lapi/syscalls/regen.sh
> @@ -35,34 +35,30 @@ cat << EOF > "${output_pid}"
>  #include <asm/unistd.h>
>  #include "cleanup.c"
>  
> -#define ltp_syscall(NR, ...) ({ \\
> -	int __ret; \\
> -	if (NR == __LTP__NR_INVALID_SYSCALL) { \\
> -		errno = ENOSYS; \\
> -		__ret = -1; \\
> -	} else { \\
> -		__ret = syscall(NR, ##__VA_ARGS__); \\
> -	} \\
> -	if (__ret == -1 && errno == ENOSYS) { \\
> -		tst_brkm(TCONF, CLEANUP, \\
> -			"syscall(%d) " #NR " not supported on your arch", \\
> -			NR); \\
> -	} \\
> -	__ret; \\
> +#ifdef TST_TEST_H__
> +#define TST_SYSCALL_BRK__(NR) ({ \
> +	tst_brk(TCONF, \
> +		"syscall(%d) " #NR " not supported on your arch", NR); \
>  })
> -
> -#define tst_syscall(NR, ...) ({ \\
> -	int tst_ret; \\
> -	if (NR == __LTP__NR_INVALID_SYSCALL) { \\
> -		errno = ENOSYS; \\
> -		tst_ret = -1; \\
> -	} else { \\
> -		tst_ret = syscall(NR, ##__VA_ARGS__); \\
> -	} \\
> -	if (tst_ret == -1 && errno == ENOSYS) { \\
> -		tst_brk(TCONF, "syscall(%d) " #NR " not supported", NR); \\
> -	} \\
> -	tst_ret; \\
> +#else
> +#define TST_SYSCALL_BRK__(NR) ({ \
> +	tst_brkm(TCONF, CLEANUP, \
> +		"syscall(%d) " #NR " not supported on your arch", NR); \
> +})
> +#endif
> +
> +#define tst_syscall(NR, ...) ({ \
> +	int tst_ret; \
> +	if (NR == __LTP__NR_INVALID_SYSCALL) { \
> +		errno = ENOSYS; \
> +		tst_ret = -1; \
> +	} else { \
> +		tst_ret = syscall(NR, ##__VA_ARGS__); \
> +	} \
> +	if (tst_ret == -1 && errno == ENOSYS) { \
> +		TST_SYSCALL_BRK__(NR); \
> +	} \
> +	tst_ret; \
>  })

Can we please keep the double backslashes here?

Both of them works, but if you put single backslash here into the script
the macro is put into one long line into the generated header, which is
really hard to decipher. With two the macro is split into lines as it
should be.

Other than that it looks good and simplifies a some of the places.

With the backslashes fixed:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
