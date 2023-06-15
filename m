Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC0B731B50
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jun 2023 16:27:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4FA53CDD91
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jun 2023 16:27:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 616CC3CA927
 for <ltp@lists.linux.it>; Thu, 15 Jun 2023 16:27:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CE6B410005B4
 for <ltp@lists.linux.it>; Thu, 15 Jun 2023 16:27:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3AB2D1FE0F;
 Thu, 15 Jun 2023 14:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1686839268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKwUYDyW1XBAw5a1zLVgpdcFHiSa23f/19dTNlrwrJo=;
 b=vXWyTq1NTaCg1KF7nX0hW5ctED26r49SlKD9Z8ZNra+FSGX1050kSmL3ExxJvttznHeEjT
 6gqRPbqauND3JDK+C7NNZApMz4SPDSVW+bAXsAqnAyvbmutWf1hfbkMffZ1pSNpHXoZ3ja
 NS9vu6CnF7+wWvfGsB7o7j6QZiDDlnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1686839268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKwUYDyW1XBAw5a1zLVgpdcFHiSa23f/19dTNlrwrJo=;
 b=i4rPU4ZD7fk2271ejpWW6xbL9VaK70iiOhe7ipZkUfihv+a3G/8gqcIJ97jlSTF1sWxJvN
 6I6Kz0odfIbfdhCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F61613A32;
 Thu, 15 Jun 2023 14:27:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Dr+oBuQfi2TLdAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Thu, 15 Jun 2023 14:27:48 +0000
Message-ID: <f847e7db-f894-4ce8-6ea5-95817531ea89@suse.cz>
Date: Thu, 15 Jun 2023 16:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Hongchen Zhang <zhanghongchen@loongson.cn>, Cyril Hrubis
 <chrubis@suse.cz>, Petr Vorel <petr.vorel@gmail.com>
References: <20230609012740.19097-1-zhanghongchen@loongson.cn>
Content-Language: en-US
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20230609012740.19097-1-zhanghongchen@loongson.cn>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_memory_spread: change lowerlimit to 5000kb
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 09. 06. 23 3:27, Hongchen Zhang wrote:
> When I test the cpuset_memory_spread case,this case FAIL too often.
> After dig into the code, I find out that the fowlloing things trigger
> the FAIL:
> 1) random events,the probability is very small and can be ignored
> 2) get_meminfo which before send signal to test_pid
> 3) account_memsinfo before result_check
> 
> About 2) and 3), we can increase the value of lowerlimit to keep
> the result as SUCCESS.After my testing, 5000kb is a reasonable value.

we're also seeing these failures but only on architectures like PowerPC 
with pagesize higher than the usual 4KB. On which architectures do you 
see failures and what's the pagesize there?

> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> ---
>   .../cpuset_memory_spread_test/cpuset_memory_spread_testset.sh   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test/cpuset_memory_spread_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test/cpuset_memory_spread_testset.sh
> index e2767ef05..d33468525 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test/cpuset_memory_spread_testset.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test/cpuset_memory_spread_testset.sh
> @@ -38,7 +38,7 @@ nr_mems=$N_NODES
>   # on which it is running. The other nodes' slab space has littler change.(less
>   # than 1000 kb).
>   upperlimit=10000
> -lowerlimit=2000
> +lowerlimit=5000
>   
>   cpus_all="$(seq -s, 0 $((nr_cpus-1)))"
>   mems_all="$(seq -s, 0 $((nr_mems-1)))"

-- 
Martin Doucha   mdoucha@suse.cz
SW Quality Engineer
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
