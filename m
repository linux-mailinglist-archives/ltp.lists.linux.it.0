Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C422466B2D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Dec 2021 21:50:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C24023C9045
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Dec 2021 21:50:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E3AC3C216A
 for <ltp@lists.linux.it>; Thu,  2 Dec 2021 21:50:42 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BCCF714016F5
 for <ltp@lists.linux.it>; Thu,  2 Dec 2021 21:50:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A76D12170C;
 Thu,  2 Dec 2021 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638478240;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJp/RARTotMqPtcCQNz8X6kEQA5f+UQ4ngYhQ/ZaAgw=;
 b=LRBKmMzRDQze+nWarL4RTgKt3+RCrdxif7tSbAQ0D72/XPZXjkerCgy38xhGd0A5oan4H5
 R/T1wnOI2em0XZWTL9yKJq5BXJD6x81Z+KIxBE6XgCNPB0aXrlRVgmnWKifZJPkS/ENvvS
 artviUqZOGTYpRxiRuJKuMJMtcR/uZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638478240;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJp/RARTotMqPtcCQNz8X6kEQA5f+UQ4ngYhQ/ZaAgw=;
 b=N6CaZ9T8pm0ZJs7um0zGdXzL/Rt9KaF6uz04aEcl1ESNjsfdsX0MaUy0pE4AqGxUUjxRai
 v6zjj8o898xD8cBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5ACAB13E53;
 Thu,  2 Dec 2021 20:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aG6XEqAxqWHZAQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 02 Dec 2021 20:50:40 +0000
Date: Thu, 2 Dec 2021 21:49:37 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YakxYTtUs+tWyLj8@pevik>
References: <20211201160954.16442-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201160954.16442-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Refactoring aiodio_append.c using LTP API
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
> +static void run(void)
> +{
> +	char *filename = "file";
You decided to remove file as first parameter.
That's fine ($TMPDIR/aiodio.$$/file2 as parameter used $$ to get unique
directory, but new API uses unique directory anyway), but then you should update
runtest/ltp-aiodio.part4 - remove $TMPDIR/aiodio.$$/file2.
nit: I'd just define that name with preprocessor #define.

> +	int filesize = FILE_SIZE;
> +	int num_children = NUM_CHILDREN;
> +	int status;
>  	int i;
> -	char *filename = argv[1];

> -	printf("Starting aio/dio append test...\n");
> +	*run_child = 1;

>  	for (i = 0; i < num_children; i++) {
nit: I'd use directly NUM_CHILDREN
> -		if ((pid[i] = fork()) == 0) {
> -			/* child */
> -			return read_eof(filename);
> -		} else if (pid[i] < 0) {
> -			/* error */
> -			perror("fork error");
> -			break;
> -		} else {
> -			/* Parent */
> -			continue;
> +		if (!SAFE_FORK()) {
> +			read_eof(filename, filesize);
... and here FILE_SIZE
> +			return;
>  		}
>  	}
...

> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1,
> +	.forks_child = 1,
> +};
>  #else
> -int main(void)
> +static void run(void)
>  {
> -	tst_brkm(TCONF, NULL, "test requires libaio and it's development packages");
> +	tst_res(TCONF, "test requires libaio and it's development packages");
>  }
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +};
>  #endif

New API has shorter variant when need to quit due missing dependencies:
TST_TEST_TCONF(), e.g.:

#else
	TST_TEST_TCONF("test requires libaio and it's development packages");
#endif

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
