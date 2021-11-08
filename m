Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 850E4447F91
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Nov 2021 13:40:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F5763C765F
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Nov 2021 13:40:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2AFC73C101C
 for <ltp@lists.linux.it>; Mon,  8 Nov 2021 13:40:37 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E33C814011AA
 for <ltp@lists.linux.it>; Mon,  8 Nov 2021 13:40:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2741D2195F;
 Mon,  8 Nov 2021 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636375236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fzv4GgTy0pDvSSLgTe3+kU4z4yvCzGhIiphIXjq5TCc=;
 b=pGJavvdHk59GeGkyzQyF3rxajgnM9UKlLEGjlJOWgGLIswaYKaCp6uBiqKVu/NjEU6DmoA
 mGtczHTfF4ZgNKbbNpyUGXGNiftLH8okjljoJ0goVml1hGTQSOPP85ibN8HSYQ6ErwQVQc
 SpTYXV7sNdY94iHyffmJXLku/0rwuyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636375236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fzv4GgTy0pDvSSLgTe3+kU4z4yvCzGhIiphIXjq5TCc=;
 b=SoY2YuUMnLlqPfLr3OMjKxmaLNksQOV2OVqQlFtmFVSDfnVYEt+FEfCtxEckzqrhGy8w9A
 7VTVCFVmCDgqytDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1516B13BA0;
 Mon,  8 Nov 2021 12:40:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t7IgBcQaiWH7aQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 08 Nov 2021 12:40:36 +0000
Date: Mon, 8 Nov 2021 13:41:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YYkbAEITAiGbdTTk@yuki>
References: <20211108021450.1460819-1-liwang@redhat.com>
 <20211108021450.1460819-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108021450.1460819-2-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] testcase: make use of .supported_archs
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
>  	asm volatile (
>  		"add $0x400, %%esp\n\t"
>  		"int $0x80\n\t"
> @@ -114,15 +112,14 @@ static void run(void)
>  
>  static struct tst_test test = {
>  	.test_all = run,
> +	.supported_archs = (const char *const []) {
> +		"i386",
> +		"ppc",
> +		NULL
> +	},
>  	.tags = (const struct tst_tag[]) {
>  		{"linux-git", "cf01fb9985e8"},
>  		{"CVE", "CVE-2017-7616"},
>  		{}
>  	}
>  };
> -
> -#else /* #if defined(__x86_64__) || defined(__powerpc__) */
> -
> -TST_TEST_TCONF("not i386 or powerpc");
> -
> -#endif /* #else #if defined(__x86_64__) || defined(__powerpc__) */

Accordingly to this table:

https://wiki.debian.org/ArchitectureSpecificsMemo

__powerpc__ matches both 32bit and 64bit variants.

I guess that we would have to change the checks in the library as:

#ifdef __powerpc__
# ifdef __powerpc64__ || __ppc64__
.arch = "ppc64",
.type = TST_PPC64,
# else
.arch = "ppc",
.type = "TST_PPC"
# endif
#endif

Also I guess that gcc does not define __x86__ for historical reasons and
__i386__ really means __x86__, but I haven't checked that one.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
