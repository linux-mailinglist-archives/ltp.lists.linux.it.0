Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2614961FB
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 16:22:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 910E73C96F2
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 16:22:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 034763C9232
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 16:22:28 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2C6FE1000F46
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 16:22:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E4A921982;
 Fri, 21 Jan 2022 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642778547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYq/NsDhvgNICC7AY7EWmGwErYM44lu07/6R6uRH/AU=;
 b=H6+JrPbx4RpI6Xpd/g3Z5ogEaUo/FhjMlt+neaCtd1+HX3vaeqAcqpU/0nd1aEu5Rl9Axb
 lSIKFCuqwfiAainqP27XlvpijZ9QDynvaXSlx/sbm4zOZwsL5TO8Jn2vS/xv2WmAO+ebfa
 ZIjkK5ygmX1tPPM6ncN9IWTVizHwtnU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642778547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYq/NsDhvgNICC7AY7EWmGwErYM44lu07/6R6uRH/AU=;
 b=Jf7k33FiN+VXUbGns5SIWZStiqoeSDEr4yYNXtuE98El51PPgG3ddhqBebZmWseqOrXU5D
 ALjOD0oWEi/UUkDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34B3A139FE;
 Fri, 21 Jan 2022 15:22:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8t0uC7PP6mHwAgAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 21 Jan 2022 15:22:27 +0000
Message-ID: <24a1d092-ec35-342b-fd7f-cdbd00725f4e@suse.cz>
Date: Fri, 21 Jan 2022 16:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Andrea Cervesato <andrea.cervesato@suse.de>, ltp@lists.linux.it
References: <20220121150111.22995-1-andrea.cervesato@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20220121150111.22995-1-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Reduce default children in dio_read test
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
Acked-by: Martin Doucha <mdoucha@suse.cz>

On 21. 01. 22 16:01, Andrea Cervesato wrote:
> We reduce default children from 100 to 8 in order to reduce time
> execution and memory footprint consuption when using default
> values.
> 
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
> ---
>  testcases/kernel/io/ltp-aiodio/dio_read.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/io/ltp-aiodio/dio_read.c b/testcases/kernel/io/ltp-aiodio/dio_read.c
> index 2c2ec4bce..b0bbb25d5 100644
> --- a/testcases/kernel/io/ltp-aiodio/dio_read.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_read.c
> @@ -26,7 +26,7 @@ static char *str_readsize;
>  static char *str_filesize;
>  
>  static char *filename = "file.bin";
> -static int numchildren = 100;
> +static int numchildren = 8;
>  static long long writesize = 32 * 1024 * 1024;
>  static long long readsize = 32 * 1024 * 1024;
>  static long long filesize = 128 * 1024 * 1024;
> @@ -171,7 +171,7 @@ static struct tst_test test = {
>  	.needs_tmpdir = 1,
>  	.forks_child = 1,
>  	.options = (struct tst_option[]) {
> -		{"n:", &str_numchildren, "Number of threads (default 100)"},
> +		{"n:", &str_numchildren, "Number of threads (default 8)"},
>  		{"w:", &str_writesize, "Size of writing blocks (default 32M)"},
>  		{"r:", &str_readsize, "Size of reading blocks (default 32M)"},
>  		{"s:", &str_filesize, "File size (default 128M)"},


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
