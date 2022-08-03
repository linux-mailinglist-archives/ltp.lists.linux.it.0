Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3EE588A44
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Aug 2022 12:19:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E26E63C8A72
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Aug 2022 12:19:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE89E3C089F
 for <ltp@lists.linux.it>; Wed,  3 Aug 2022 12:19:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0565A600326
 for <ltp@lists.linux.it>; Wed,  3 Aug 2022 12:19:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2292C40262;
 Wed,  3 Aug 2022 10:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659521985;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OQFyuP9iokd2C+sOPia7D4MwyePWjhMzLm0DMbDEhkw=;
 b=FkKeRdyI0suGszz7bi1Es1+/69CUqMHJCb5Mqrg7oPAKecqH5U2SDgbxXPBnfXKiZU479d
 /+El7I6hvECob0IXc/YmuF9oXLG0J1WgN8i56yeTHP8b+BxwTG6N4HB4JPk4e92/DgOEya
 /Mie9zjcFUK03ZG1ekJnkXvKT9ZohoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659521985;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OQFyuP9iokd2C+sOPia7D4MwyePWjhMzLm0DMbDEhkw=;
 b=BxA+zuwTDtoM6/JzPaD69HyjK3xt4ImuKNXEkkVy1xw1gtaNWUKTnOPGVPNe6kAUXBkLvL
 SoGVf2OLEE9/g6BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5DA713AD8;
 Wed,  3 Aug 2022 10:19:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x1RYMsBL6mLKIAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 03 Aug 2022 10:19:44 +0000
Date: Wed, 3 Aug 2022 12:19:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YupLvuw1JpxL1pnY@pevik>
References: <20220803070839.24125-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803070839.24125-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Refactor aiocp using new LTP API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Andrea,

...
> +	io_destroy(myctx);
> +	SAFE_CLOSE(srcfd);
> +	SAFE_CLOSE(dstfd);
> +
> +	/* check if file has been copied correctly */
> +	tst_res(TINFO, "Comparing %s with %s", srcname, dstname);
> +
> +	SAFE_STAT(dstname, &st);
> +	if (st.st_size != filesize) {
> +		tst_res(TFAIL, "Expected destination file size %lld but it's %ld", filesize, st.st_size);
> +		/* no need to compare files */
> +		return;
>  	}
> +	srcfd = SAFE_OPEN(srcname, srcflags | O_RDONLY, 0666);
> +	dstfd = SAFE_OPEN(dstname, srcflags | O_RDONLY, 0666);
> +
> +	reads = howmany(filesize, buffsize);
> +
> +	for (i = 0; i < reads; i++) {
> +		r = SAFE_READ(0, srcfd, srcbuff, buffsize);
> +		SAFE_READ(0, dstfd, dstbuff, buffsize);
> +		if (memcmp(srcbuff, dstbuff, r)) {
> +			fail = 1;
> +			break;
>  		}

> +	SAFE_CLOSE(srcfd);
> +	SAFE_CLOSE(dstfd);
Shouldn't this be moved to the cleanup function? Because if SAFE_STAT() fails, file
stays open (also, if you add the cleanup function, than tst_res(TFAIL) can be in
for loop, followed by return - a bit simpler code).

Otherwise LGTM.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> +	if (fail)
> +		tst_res(TFAIL, "Files are not identical");
> +	else
> +		tst_res(TPASS, "Files are identical");
> +}

> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.needs_tmpdir = 1,
> +	.options = (struct tst_option[]) {
> +		{"b:", &str_aio_blksize, "Size of writing blocks (default 1K)"},
> +		{"s:", &str_filesize, "Size of file (default 10M)"},
> +		{"n:", &str_aionum, "Number of Async IO blocks (default 16)"},
> +		{"f:", &str_oflag, "Open flag: SYNC | DIRECT (default O_CREAT only)"},
> +		{},
> +	},
> +};
>  #else
> -int main(void)
> -{
> -	fprintf(stderr, "test requires libaio and it's development packages\n");
> -	return TCONF;
> -}
> +TST_TEST_TCONF("test requires libaio and its development packages");
>  #endif

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
