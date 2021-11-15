Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBB45029A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 11:38:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2E343C816A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 11:38:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF95F3C7FC2
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 11:38:32 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E8B91600941
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 11:38:31 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 397891FD65;
 Mon, 15 Nov 2021 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636972711;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zm1bQLWHU8XxQWqExxDEBhCOsoBj7W8Dl6khGpJD6U=;
 b=RYXCjy9q5UBGuwVs13MLL009ZB8rgAz1jza2o2SzhtBpFrylhmAbQ51jXU3Ws+dE180ndY
 JTcYcPWrDqOrd/T5/VQjYTQAIdrleayW83e5/teASGMMDY5vkUtJ2zkviIJG140bXJZiTJ
 XDmn0BH70/3Y6w5RvuQw1Ua/pVlnfs0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636972711;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zm1bQLWHU8XxQWqExxDEBhCOsoBj7W8Dl6khGpJD6U=;
 b=Cjtsk92j41YNzavlUiOjFFBrSOd0VEIWug1Q1LBAjaHujn0NzUom5Hm1nwxxanpJGIVt1f
 Mbj20e2t64zznuAw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id DE032A3B81;
 Mon, 15 Nov 2021 10:38:30 +0000 (UTC)
References: <20210623071543.171021-1-lkml@jv-coder.de>
 <20210623071543.171021-2-lkml@jv-coder.de>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
Date: Mon, 15 Nov 2021 10:36:39 +0000
In-reply-to: <20210623071543.171021-2-lkml@jv-coder.de>
Message-ID: <877dd9d7q1.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] cpuset_regression_test: Convert to new api
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> -cpuset_test()
> +test()
>  {
> +	local cpu_exclusive_tmp cpus_value
> +
>  	ROD_SILENT mkdir ${root_cpuset_dir}/testdir
>  
>  	# Creat an exclusive cpuset.
>  	echo 1 > ${root_cpuset_dir}/testdir/${cpu_exclusive}
> -	if [ $? -ne 0 ]; then
> -		tst_brkm TFAIL "'echo 1 >" \
> -			       "${root_cpuset_dir}/testdir/${cpu_exclusive}'" \
> -			       "failed"
> -	fi
> -
> -	local cpu_exclusive_tmp=$(cat \
> -				  ${root_cpuset_dir}/testdir/${cpu_exclusive})
> +	[ $? -ne 0 ] && tst_brk TFAIL "'echo 1 > ${root_cpuset_dir}/testdir/${cpu_exclusive}' failed"
> +	

Merged, but with the trailing whitespace in the line above removed.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
