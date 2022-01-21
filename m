Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C3495ECC
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 13:02:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AE513C96E3
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 13:02:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0DF823C0391
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 13:02:53 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 109EA1A0091A
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 13:02:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43DAC1F3C0;
 Fri, 21 Jan 2022 12:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642766572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ak5zsKHyT+zcjw0PgOL0q0PtaFOyN5NQ28M42pjafVg=;
 b=fHHD3OxdZDQoDkAAFPOsdwJCIdgoKz2dzcL6zElgLVMksJ8zMGXu/3HTLFEwtg9uRli/CL
 1hrtlPkzdy9J5i9MpRHRXcO2zFLerRF+ABPd7tzflokxCkvZY1ltth7SOqEem6IbYqG294
 yEGQmW59ibEp9pobzG5AR8PEWatMBp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642766572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ak5zsKHyT+zcjw0PgOL0q0PtaFOyN5NQ28M42pjafVg=;
 b=3X1W1ulBV3eBv3KIW4JBzaizUAAaE/71jMsB/6+lN1cXwOkJi4ejW/klTz/Un4s8Eybcgo
 x73Y0CzVDaVR4iDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22B0D13BC9;
 Fri, 21 Jan 2022 12:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hbEhB+yg6mF+IAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 21 Jan 2022 12:02:52 +0000
Message-ID: <4508acbd-3ca2-b1b4-ff38-6ffa573aa6fd@suse.cz>
Date: Fri, 21 Jan 2022 13:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20220121103011.6266-1-pvorel@suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20220121103011.6266-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] aiodio: Set timeout 30 min
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
only dio_sparse really needs higher timeout because we use it for a slow
stress test in a runfile. dio_read should get a lower default number of
child processes instead (8 or 16 to keep the default memory requirements
under 512MB).

The other programs finish in less than 30 seconds so if anybody wants to
use them for a custom stress test, it's their responsibility to set
LTP_TIMEOUT_MUL accordingly.

On 21. 01. 22 11:30, Petr Vorel wrote:
> Originally only ADSP075 failed (dio_sparse  -w 518192k -s 518192k -n 1000)
> but just in case increase timeout for all newly rewritten tests.
> 
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/io/ltp-aiodio/aiodio_append.c | 1 +
>  testcases/kernel/io/ltp-aiodio/dio_append.c    | 1 +
>  testcases/kernel/io/ltp-aiodio/dio_read.c      | 1 +
>  testcases/kernel/io/ltp-aiodio/dio_sparse.c    | 1 +
>  testcases/kernel/io/ltp-aiodio/dio_truncate.c  | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/testcases/kernel/io/ltp-aiodio/aiodio_append.c b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
> index 46cc74ee4e..3c4add66ec 100644
> --- a/testcases/kernel/io/ltp-aiodio/aiodio_append.c
> +++ b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
> @@ -183,6 +183,7 @@ static struct tst_test test = {
>  		"tmpfs",
>  		NULL
>  	},
> +	.timeout = 1800,
>  };
>  #else
>  TST_TEST_TCONF("test requires libaio and its development packages");
> diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
> index c099793f6c..dd044325bd 100644
> --- a/testcases/kernel/io/ltp-aiodio/dio_append.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
> @@ -97,4 +97,5 @@ static struct tst_test test = {
>  		"tmpfs",
>  		NULL
>  	},
> +	.timeout = 1800,
>  };
> diff --git a/testcases/kernel/io/ltp-aiodio/dio_read.c b/testcases/kernel/io/ltp-aiodio/dio_read.c
> index 67a28147fd..f48414ec01 100644
> --- a/testcases/kernel/io/ltp-aiodio/dio_read.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_read.c
> @@ -181,4 +181,5 @@ static struct tst_test test = {
>  		"tmpfs",
>  		NULL
>  	},
> +	.timeout = 1800,
>  };
> diff --git a/testcases/kernel/io/ltp-aiodio/dio_sparse.c b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
> index 39fc895d65..0039daa8d1 100644
> --- a/testcases/kernel/io/ltp-aiodio/dio_sparse.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
> @@ -135,4 +135,5 @@ static struct tst_test test = {
>  		"tmpfs",
>  		NULL
>  	},
> +	.timeout = 1800,
>  };
> diff --git a/testcases/kernel/io/ltp-aiodio/dio_truncate.c b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
> index 1fbf83de06..80445c48a3 100644
> --- a/testcases/kernel/io/ltp-aiodio/dio_truncate.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
> @@ -169,4 +169,5 @@ static struct tst_test test = {
>  		"tmpfs",
>  		NULL
>  	},
> +	.timeout = 1800,
>  };


-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
