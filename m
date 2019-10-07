Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B3501CE496
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 16:03:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 541D73C1C90
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 16:03:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A9F183C1809
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 16:03:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E0FDE1A00F2D
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 16:03:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0012FB12B;
 Mon,  7 Oct 2019 14:03:22 +0000 (UTC)
Date: Mon, 7 Oct 2019 16:03:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: rasibley <rasibley@redhat.com>
Message-ID: <20191007140321.GA23368@rei.lan>
References: <20191004184436.30922-1-rasibley@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004184436.30922-1-rasibley@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Update dynamic_debug grep check
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
> If running on debug kernel this check will fail on EDAC DEBUG messages,
> update grep to ignore such cases like this.

You are missing the Signed-off-by: line here, see:

https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#developer-s-certificate-of-origin-1-1

Otherwise the patch is Ok.

> ---
>  testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh b/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
> index f39d67d0a..7f06c2488 100755
> --- a/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
> +++ b/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
> @@ -127,7 +127,7 @@ ddebug_test()
>  	sed -i -e 1,`wc -l < ./dmesg.old`d ./dmesg.new
>  	if grep -q -e "Kernel panic" -e "Oops" -e "general protection fault" \
>  		-e "general protection handler: wrong gs" -e "\(XEN\) Panic" \
> -		-e "fault" -e "warn" -e "BUG" ./dmesg.new ; then
> +		-e "fault" -e "warn" -e "\<BUG\>" ./dmesg.new ; then
>  		tst_res TFAIL "Issues found in dmesg!"
>  	else
>  		tst_res TPASS "Dynamic debug OK"
> -- 
> 2.20.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
