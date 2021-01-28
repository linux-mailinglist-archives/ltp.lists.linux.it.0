Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB43079F0
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 16:41:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AE1E3C792B
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 16:41:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 15C303C5E78
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 16:41:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BE6B61000DCC
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 16:41:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40156AC41;
 Thu, 28 Jan 2021 15:41:08 +0000 (UTC)
Date: Thu, 28 Jan 2021 16:42:15 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <YBLbV2EhTWKihyE2@yuki.lan>
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1611654925-8994-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611654925-8994-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/3] syscalls/mallinfo03: Add an overflow test
 when setting 2G size
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
> +void test_mallinfo(void)
> +{
> +	struct mallinfo info;
> +	char *buf;
> +	size_t size = 2UL * 1024UL * 1024UL * 1024UL;
> +
> +	buf = SAFE_MALLOC(size);

If nothing else use of SAFE_MALLOC() here is wrong. The call may
potentionally fail and return NULL since we are passing overly large
value there.

For example it will fail if memory overcommit is disabled and there is
not enough free memory.

So we should, at least, use malloc() instead and skip the test if NULL
was returned.

> +	info = mallinfo();
> +	if (info.hblkhd < 0) {
> +		print_mallinfo("Test malloc 2G", &info);
> +		tst_res(TFAIL, "The member of struct mallinfo overflow, we should use mallinfo2");
> +	} else {
> +		/*We will never get here*/
> +		tst_res(TPASS, "The member of struct mallinfo doesn't overflow");
> +	}
> +	free(buf);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = test_mallinfo,
> +};
> +
> +#else
> +TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo()");
> +#endif
> -- 
> 2.23.0
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
