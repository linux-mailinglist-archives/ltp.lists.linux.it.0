Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C59AC5BA43
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 13:01:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AE683C1D6D
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 13:01:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5E5BD3C1D13
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 13:01:42 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C8902000E9
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 13:01:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3437B30832DC
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 11:01:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29A3A18677
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 11:01:40 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D8BF1806B15;
 Mon,  1 Jul 2019 11:01:40 +0000 (UTC)
Date: Mon, 1 Jul 2019 07:01:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <2137465502.31003797.1561978896804.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190701100343.3406-1-liwang@redhat.com>
References: <20190701100343.3406-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.11]
Thread-Topic: add tst_no_corefile to avoid corefile dumping
Thread-Index: GrxqMBCa0/2/ueZiUdI04VHtQnrAmw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 01 Jul 2019 11:01:40 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] lib: add tst_no_corefile to avoid corefile
 dumping
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
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Jan Stancek <jstancek@redhat.com>
> ---
>  include/tst_safe_macros.h                        | 16 ++++++++++++++++
>  testcases/kernel/security/umip/umip_basic_test.c |  2 ++
>  testcases/kernel/syscalls/ipc/shmat/shmat01.c    | 16 +++-------------
>  3 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> index 53a888c80..110e2984f 100644
> --- a/include/tst_safe_macros.h
> +++ b/include/tst_safe_macros.h
> @@ -394,6 +394,22 @@ static inline int safe_setrlimit(const char *file, const
> int lineno,
>  #define SAFE_SETRLIMIT(resource, rlim) \
>  	safe_setrlimit(__FILE__, __LINE__, (resource), (rlim))
>  
> +/*
> + * Crash is expected, avoid dumping corefile.
> + * 1 is a special value, that disables core-to-pipe.
> + * At the same time it is small enough value for
> + * core-to-file, so it skips creating cores as well.
> + */
> +static inline void tst_no_corefile(void)
> +{
> +       struct rlimit r;
> +
> +       r.rlim_cur = 1;
> +       r.rlim_max = 1;
> +       SAFE_SETRLIMIT(RLIMIT_CORE, &r);
> +       tst_res(TINFO, "Avoid dumping corefile in following test");

I'm fine with helper func. Maybe I'd print also current pid.
It could be little spammy if there are many children, but we could
address that later (if needed) with a parameter to control verbosity.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
