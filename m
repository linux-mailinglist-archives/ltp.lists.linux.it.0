Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4236315AA15
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 14:32:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8D283C25DE
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 14:32:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 68D933C2074
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 14:32:15 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 81A051401FB2
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 14:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581514332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oY2BJIVFfu+THMLzHT3Vlk0UkIJ2wr9KoyZXSHZgaTA=;
 b=F+TIbV5Zf1j7CWorxeyxjqfMLaete0mW4FE+DeKwYTwyjqhIXbey6LlxNM9xSzLelDfvDA
 ReYeWpvd/yRMgds/4ZLXxHQ/CxhlQVrcIlp2M1FhtQ0cYX6wM9ieYAxn+x9QBzhcQmV65O
 MLD4OMsmcUuAr3wPjulEuMJxeJqdVq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-TtfQ_er9N8O2lHPDwDsEAQ-1; Wed, 12 Feb 2020 08:32:08 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4CFADB64;
 Wed, 12 Feb 2020 13:32:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA2B28AC23;
 Wed, 12 Feb 2020 13:32:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF9B88B2A1;
 Wed, 12 Feb 2020 13:32:07 +0000 (UTC)
Date: Wed, 12 Feb 2020 08:32:07 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1892366945.7197852.1581514327491.JavaMail.zimbra@redhat.com>
In-Reply-To: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.21]
Thread-Topic: syscalls/kill11: add a check between hard limit and
 MIN_RLIMIT_CORE
Thread-Index: 177P2TKxdFtWiGWY3uX0vx2VGpHCDQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: TtfQ_er9N8O2lHPDwDsEAQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/kill11: add a check between hard limit
 and MIN_RLIMIT_CORE
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
> Currently, running this case will report EINVAL error if I run "ulimit -c
> 1023" command firstly. From setrlimit(2)manpage, it got EINVAL error because
> rlim->rlim_cur was greater than rlim->rlim_max. So add a check for it before
> setrlimit.
> 
> Reported-by: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/syscalls/kill/kill11.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/kill/kill11.c
> b/testcases/kernel/syscalls/kill/kill11.c
> index 83fba5beb..5f70b0a07 100644
> --- a/testcases/kernel/syscalls/kill/kill11.c
> +++ b/testcases/kernel/syscalls/kill/kill11.c
> @@ -201,6 +201,9 @@ void setup(void)
>  
>  	SAFE_GETRLIMIT(NULL, RLIMIT_CORE, &rlim);
>  
> +	if (rlim.rlim_max < MIN_RLIMIT_CORE)
> +		tst_brkm(TCONF, NULL, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
> +				rlim.rlim_max, MIN_RLIMIT_CORE);

This looks OK, but could we also raise the limit when possible?


+       if (rlim.rlim_max < MIN_RLIMIT_CORE) {
+               if (geteuid() != 0) {
+                       tst_brkm(TCONF, NULL, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
+                               rlim.rlim_max, MIN_RLIMIT_CORE);
+               }
+               tst_resm(TINFO, "Raising rlim_max to %i", MIN_RLIMIT_CORE);
+               rlim.rlim_max = MIN_RLIMIT_CORE;
+       }


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
