Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F061146B01
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 15:17:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8626B3C24E2
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 15:17:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DA65C3C0516
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 15:17:54 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 135541001F39
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 15:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579789072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsIbkd1uGRMmS/B8rcqc4PJhAomP0kX5BCUxwUT0x4w=;
 b=AG6sxVrwoYNHY+W7d5CkO8zZUS0kuvLSoysBaLE34obBFou0yyFvN47ha7yTEVawZDNXpN
 gToCEH8tqFL54b3Xfe/L0SAmI448BN0pokyWUL19RcThyqB6dQlIMW92Nw170MDKVuZ9rD
 8HLSjWHLgH0MzB0c9sjn9n6kOsd3Yt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-CBscKxTVNiKJaeTgmpmK6A-1; Thu, 23 Jan 2020 09:17:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A42371005510;
 Thu, 23 Jan 2020 14:17:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71DFE60BE1;
 Thu, 23 Jan 2020 14:17:47 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3766C1832DE7;
 Thu, 23 Jan 2020 14:17:47 +0000 (UTC)
Date: Thu, 23 Jan 2020 09:17:46 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <104918104.3505581.1579789066988.JavaMail.zimbra@redhat.com>
In-Reply-To: <6aae63a2e362a0f09cf35fff058e7741f0987208.1579755655.git.viresh.kumar@linaro.org>
References: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
 <6aae63a2e362a0f09cf35fff058e7741f0987208.1579755655.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.25]
Thread-Topic: syscalls/io_pgetevents
Thread-Index: XS2lk6m5TyBFVXWDYnlCYnXjg+jeXA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: CBscKxTVNiKJaeTgmpmK6A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/io_pgetevents
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

----- Original Message -----
> +#ifdef HAVE_LIBAIO
> +#include <libaio.h>
> +
> +#ifndef HAVE_IO_SETUP
> +int io_setup(int nr, io_context_t *ctxp)
> +{
> +	return syscall(__NR_io_setup, nr, ctxp);
> +}
> +#endif /* HAVE_IO_SETUP */
> +
> +#ifndef HAVE_IO_DESTROY
> +int io_destroy(io_context_t ctx)
> +{
> +	return syscall(__NR_io_destroy, ctx);
> +}
> +#endif /* HAVE_IO_DESTROY */
> +
> +#ifndef HAVE_IO_SUBMIT
> +int io_submit(io_context_t ctx, long nr, struct iocb **iocbpp)
> +{
> +	return syscall(__NR_io_submit, ctx, nr, iocbpp);

Can functions above also use ltp_syscall?

<snip>

> +#ifdef HAVE_LIBAIO
> +
> +static int fd = -1;
> +
> +static void cleanup(void)
> +{
> +	SAFE_CLOSE(fd);

I'd move this to run(). It may get skipped on tst_brk(), but kernel will take
care of closing it. But if you run testcase in loop (-i) it won't run out
of file descriptors.

<snip>

> +#ifdef HAVE_LIBAIO
> +
> +static int fd = -1;
> +
> +static void cleanup(void)
> +{
> +	SAFE_CLOSE(fd);

same here

> +}
> +
> +static void run(void)
> +{
> +	struct io_event events[1];
> +	struct iocb cb, *cbs[1];
> +	io_context_t ctx = 0;
> +	sigset_t sigmask;
> +	char data[4096];
> +	int ret;
> +
> +	sigemptyset(&sigmask);
> +
> +	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
> +
> +	ret = io_setup(1, &ctx);
> +	if (ret < 0)
> +		tst_brk(TBROK | TERRNO, "io_setup() failed");
> +
> +	io_prep_pwrite(&cb, fd, data, 4096, 0);
> +
> +	cbs[0] = &cb;
> +
> +	ret = io_submit(ctx, 1, cbs);
> +	if (ret != 1)
> +		tst_brk(TBROK | TERRNO, "io_submit() failed");
> +
> +	/* Invalid Max event count */
> +	ret = io_pgetevents(ctx, 1, 0, events, NULL, &sigmask);
> +
> +	/* Invalid events*/
> +	if (ret != 1)
> +		ret = io_pgetevents(ctx, 1, 1, NULL, NULL, &sigmask);
> +
> +	if (io_destroy(ctx) < 0)
> +		tst_brk(TBROK | TERRNO, "io_destroy() failed");
> +
> +	/* Invalid ctx */
> +	if (ret != 1)
> +		ret = io_pgetevents(ctx, 1, 1, events, NULL, &sigmask);
> +
> +	if (ret != 1)
> +		tst_res(TPASS, "io_pgetevents() failed as expected");

If this reports FAIL, will we know what test actually failed?

Can you make this more verbose? I mean have each test report PASS/FAIL,
not just a one line summary after all tests.

> +	else
> +		tst_brk(TBROK| TERRNO, "io_pgetevents() passed unexpectedly");

TFAIL | TERRNO seems more fitting, since io_pgetevents is subject of the test.

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
