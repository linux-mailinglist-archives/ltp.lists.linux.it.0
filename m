Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A740AAE4
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 11:31:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0EE33C89B7
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 11:31:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 19BD13C1D8F
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 11:31:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5280360138B
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 11:31:14 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 983E51FDD3;
 Tue, 14 Sep 2021 09:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631611873;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nhd6+TkGVl8tQGezrXbua4DEnbM3+BEv0raY2Jd0VCU=;
 b=AxsPoerBm9hQ1TN1d+fheXjq8nijcDbdBdwSpzfb74TnlIZMd/7uvDWgNuaj+aemQOtkKA
 ctv5jqV4gMLj4jinUD8j6Fvn/Ivl0ayyI2FjEF5+7tsgh2Rd+e0Z3JGdQXoUXXgI84DP7J
 L96DVX5neAFmAp7QQoDPFjsZvMabHiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631611873;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nhd6+TkGVl8tQGezrXbua4DEnbM3+BEv0raY2Jd0VCU=;
 b=VhRozTc48IMELQDaYxNCD0/QBuk9zSw7YORx27bQr9/tbll+m83E2BnGLD8yFMqM0Vi54G
 d2WyZJj+4vBLOcCw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5D4EAA3B8E;
 Tue, 14 Sep 2021 09:31:13 +0000 (UTC)
References: <1617707717-63693-1-git-send-email-zou_wei@huawei.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Zou Wei <zou_wei@huawei.com>
In-reply-to: <1617707717-63693-1-git-send-email-zou_wei@huawei.com>
Date: Tue, 14 Sep 2021 10:31:12 +0100
Message-ID: <87v933jyfz.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset/cpuset_memory_pressure_test: Check whether
 the swap partition is configured
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

Zou Wei <zou_wei@huawei.com> writes:

> --------------------------
>
> 1. Fixed a bug where a null value is obtained because swap is not in
>    the fourth line of the free result
> free -m
>         total        used        free      shared  buff/cache   available
> Mem:   128135        3857      120633         158        3644      123219
> Swap:    8191          82        8109
>
> free -m
>         total       used       free     shared    buffers     cached
> Mem:   419694       9464     410230        234        435       6005
> -/+ buffers/cache:       3022     416671
> Swap:    2053          0       2053
>
> 2. If no swap partition is configured in the test environment,
>    the testcase will be failed:
>
> cpuset_memory_pressure 7 TFAIL: sub group's memory_pressure
> didn't have memory pressure rate.
> cpuset_memory_pressure 9 TFAIL: root group's memory_pressure
> didn't have memory pressure rate.
> cpuset_memory_pressure 11 TFAIL: root group's memory_pressure
> didn't have memory pressure rate.
>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  .../cpuset_memory_pressure_testset.sh                        | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
> index eddd7f6..2a2d2a1 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
> @@ -35,8 +35,16 @@ exit_status=0
>  # usable physical memory
>  py_mem=$(free -m | awk '{if(NR==2) print $4 + $6 + $7}')
>  
> -# free swap space
> -sw_mem=$(free -m | awk '{if(NR==4) print $4}')
> +# total swap space
> +sw_mem=$(free -m | awk '{if(NR==4) print $2}')
> +if [ -z $sw_mem ]; then
> +	sw_mem=$(free -m | awk '{if(NR==3) print $2}')
> +fi

The original use of awk and free looks error prone. Perhaps it would be
better to do?

sw_mem=$(cat /proc/meminfo | awk '/SwapTotal/ { print $2 }')


> +
> +if [ $sw_mem -eq 0 ]; then
> +	tst_resm TCONF "The size of the swap partition is zero."
> +	exit 32
> +fi
>  
>  # the memory which is going to be used
>  usemem=$((py_mem - 20))
> -- 
> 2.6.2


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
