Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55157375290
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 12:44:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C00E3C56D4
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 12:44:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 218AE3C56A4
 for <ltp@lists.linux.it>; Thu,  6 May 2021 12:44:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 83FD51000F29
 for <ltp@lists.linux.it>; Thu,  6 May 2021 12:44:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2B47B176;
 Thu,  6 May 2021 10:44:43 +0000 (UTC)
Date: Thu, 6 May 2021 12:44:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YJPImeHT9rVsVtON@pevik>
References: <20210429125255.31510-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429125255.31510-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/modify_ldt: Replace TINFO with TPASS
 or TFAIL
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

Hi Zhao, Cyril,

> diff --git a/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c b/testcases/kernel/syscalls/modify_ldt/modify_ldt01.c
...
> @@ -149,15 +132,13 @@ int main(int ac, char **av)
>  		(void)waitpid(pid, &status, 0);

>  		if (WEXITSTATUS(status) != 0) {
> -			flag = FAILED;
>  			tst_resm(TFAIL, "Did not generate SEGV, child returned "
>  				 "unexpected status");
> -		}
> -
> -		if (flag) {
> -			tst_resm(TINFO, "block 2 FAILED");
>  		} else {
> -			tst_resm(TINFO, "block 2 PASSED");
> +			if (WIFSIGNALED(status) && (WTERMSIG(status) == SIGSEGV))
> +				tst_resm(TPASS, "generate SEGV as expected");
> +			else
> +				tst_resm(TFAIL, "Did not generate SEGV");
FYI: since merging this patch (f5e8e6b11) test fails on this. Is it expected?
I haven't looked closer whether it's a test bug or real issue.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
