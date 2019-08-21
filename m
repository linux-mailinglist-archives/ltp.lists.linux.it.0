Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528F97F95
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 18:01:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 548A13C1D04
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 18:01:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CB2813C1CF4
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 18:01:36 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1F3B31000B10
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 18:01:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0CEBF7F75C;
 Wed, 21 Aug 2019 16:01:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03A9A5D6B0;
 Wed, 21 Aug 2019 16:01:33 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54CBD18089C8;
 Wed, 21 Aug 2019 16:01:33 +0000 (UTC)
Date: Wed, 21 Aug 2019 12:01:33 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: zhe he <zhe.he@windriver.com>
Message-ID: <145293056.7577705.1566403293117.JavaMail.zimbra@redhat.com>
In-Reply-To: <1566376044-175216-1-git-send-email-zhe.he@windriver.com>
References: <1566376044-175216-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.240, 10.4.195.15]
Thread-Topic: Fix kernel symbol finding for meltdown case
Thread-Index: jStTc6XK2ImYjkh4Ai6zsGE/7IWtxA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 21 Aug 2019 16:01:34 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] cve: Fix kernel symbol finding for meltdown
 case
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



----- Original Message -----
> From: He Zhe <zhe.he@windriver.com>
> 
> meltdown case fails as below.
> safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272
> 
> find_kernel_symbol is defined to try twice with each of /proc/kallsyms and
> /boot/System.map-%s. Currently if the symbol is not found in /proc/kallsyms,
> when kernel option CONFIG_KALLSYMS_ALL is disabled, it would stop the case
> immediately due to SAFE_FILE_LINES_SCANF.
> 
> This patch turns to use FILE_LINES_SCANF to give find_kernel_symbol second
> chance.

That explains it, thanks for the patch.

We should also tweak TCONF condition in find_kernel_symbol - no need
to re-post for that, I can add that.

> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  testcases/cve/meltdown.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
> index f78c38b..2d66c1e 100644
> --- a/testcases/cve/meltdown.c
> +++ b/testcases/cve/meltdown.c
> @@ -255,7 +255,7 @@ find_symbol_in_file(const char *filename, const char
> *symname)
>  
>  	sprintf(fmt, "%%lx %%c %s%%c", symname);
>  
> -	ret = SAFE_FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
> +	ret = FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
>  	if (ret)
>  		return 0;
>  
> --
> 2.7.4
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
