Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAA36D9BA
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 16:41:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE6583C63F9
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 16:41:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B98E73C0EFF
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 16:41:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 32355600691
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 16:41:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B880AD8A;
 Wed, 28 Apr 2021 14:41:12 +0000 (UTC)
Date: Wed, 28 Apr 2021 16:20:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YIlvQ7D925aVJMao@yuki>
References: <20210428072016.17556-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428072016.17556-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ttype: Replase TINFO with TPASS or TFAIL
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
> diff --git a/testcases/kernel/syscalls/fcntl/fcntl16.c b/testcases/kernel/syscalls/fcntl/fcntl16.c
> index a77a81298..f12474f79 100644
> --- a/testcases/kernel/syscalls/fcntl/fcntl16.c
> +++ b/testcases/kernel/syscalls/fcntl/fcntl16.c
> @@ -673,10 +673,10 @@ int main(int ac, char **av)
>  		 */
>  		tst_resm(TINFO, "Entering block 1");
>  		if (run_test(O_CREAT | O_RDWR | O_TRUNC, 0777, 0, 11)) {
> -			tst_resm(TINFO, "Test case 1: without mandatory "
> +			tst_resm(TFAIL, "Test case 1: without mandatory "
>  				 "locking FAILED");
>  		} else {
> -			tst_resm(TINFO, "Test case 1: without manadatory "
> +			tst_resm(TPASS, "Test case 1: without manadatory "
>  				 "locking PASSED");
>  		}

I would be happier if we fixed the run_test() function to report
TFAIL/TPASS in all cases and just called run_test() from the main().

It shouldn't be even a big change since we report most of the failures
there, what we need is to change one TINFO into TFAIL and report TPASS
at the end of the function.

>  		tst_resm(TINFO, "Exiting block 1");

Also can we please get rid of the useless entering/exitting block
messages?


And the same applies for the rest of the tests changed by this patch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
