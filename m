Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 232EB2DD0FD
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 13:01:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA0DE3C57B3
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 13:01:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6EA833C2A9B
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 13:01:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F23031A01470
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 13:01:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26E84AC7F;
 Thu, 17 Dec 2020 12:01:46 +0000 (UTC)
Date: Thu, 17 Dec 2020 13:02:43 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <X9tI4w6K0cz3hhNf@yuki.lan>
References: <0279beda4660ab1b401164e369c79475633bd067.1608189944.git.viresh.kumar@linaro.org>
 <d537c9be33a54d31f70bd25e3268dbebbb67ea8f.1608200941.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d537c9be33a54d31f70bd25e3268dbebbb67ea8f.1608200941.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 3/3] syscalls: finit_module: Add tests
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

Hi!
> +static void setup(void)
> +{
> +	finit_module_supported_by_kernel();
> +
> +	/* Kernel returned ENOEXEC for fd = -1 earlier */
> +	if ((tst_kvercmp(4, 6, 0)) < 0)
> +		tcases[0].exp_errno = ENOEXEC;

There are plenty of ways how to avoid hackery like that.

What about we defined a setup function in the test structure and then
loop over the testcases in the test setup() and execute all per-test
setup functions we have.

The we can keep the errno set to zero in the static structure and
initialize it in the per-testcase setup as:

static void bad_fd_setup(struct tcase *tc)
{
	if (tst_kvercmp(4, 6, 0)) < 0)
		tc->errno = ENOEXEC;
	else
		tc->errno = EBADFD;
}


Also I think that the last test needs to handle ETXTBSY in the same way
and we may possibly add more tests since I guess that most of the errors
that apply to execve() would apply here as well. What happpens for
example if we pass a fd that points to a directory?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
