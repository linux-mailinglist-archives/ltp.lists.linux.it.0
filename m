Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BABF2D13DF
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 15:40:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C99313C628C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 15:40:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AA39C3C2C7F
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 15:40:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 37DFF1A00CD9
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 15:40:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EB79ABE9;
 Mon,  7 Dec 2020 14:40:42 +0000 (UTC)
Date: Mon, 7 Dec 2020 15:41:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <X84/IAwVIwXjN+6Z@yuki.lan>
References: <20201203110616.28302-1-liwang@redhat.com>
 <20201204063305.6820-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204063305.6820-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lib: add .min_cpus in tst_test struct
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
Pushed with two fixes, thanks.

> +	/* Minimum numbers of online CPU required by the test */
                      ^
		      number
> +	unsigned long min_cpus;
> +
>  	/*
>  	 * If set non-zero number of request_hugepages, test will try to reserve the
>  	 * expected number of hugepage for testing in setup phase. If system does not
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 535c0ff4c..c4e04eb4a 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -918,6 +918,9 @@ static void do_setup(int argc, char *argv[])
>  	if (tst_test->all_filesystems)
>  		tst_test->needs_device = 1;
>  
> +	if (tst_test->min_cpus > tst_ncpus())
                                   ^
				   Added (unsigned long) cast to silence
				   warnings.
> +		tst_brk(TCONF, "Test needs at least %lu CPUs online", tst_test->min_cpus);
> +
>  	if (tst_test->request_hugepages)
>  		tst_request_hugepages(tst_test->request_hugepages);
>  
> -- 
> 2.21.3
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
