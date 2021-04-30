Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C7C36F802
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:38:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 638B63C5EC9
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:38:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C0FC3C19C3
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 11:38:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 530A21A01735
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 11:38:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB064AE56;
 Fri, 30 Apr 2021 09:38:03 +0000 (UTC)
Date: Fri, 30 Apr 2021 11:16:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YIvK4qFFbWpsEv2y@yuki>
References: <20210429142232.29596-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429142232.29596-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_checkpoint.c: Replace SAFE_CLOSE with
 SAFE_UNLINK
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
> When we call tst_checkpoint_init and set the cleanup_fn to NULL, the file
> checkpoint_futex_base_file might be left over.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  lib/tst_checkpoint.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/tst_checkpoint.c b/lib/tst_checkpoint.c
> index 9e9dcf9e6..3360ab07b 100644
> --- a/lib/tst_checkpoint.c
> +++ b/lib/tst_checkpoint.c
> @@ -78,7 +78,7 @@ void tst_checkpoint_init(const char *file, const int lineno,
> 
>  	tst_max_futexes = page_size / sizeof(uint32_t);
> 
> -	SAFE_CLOSE(cleanup_fn, fd);
> +	SAFE_UNLINK(cleanup_fn, "checkpoint_futex_base_file");

We ensure that the file is created in the test temporary directory and
we do check that the test created a temporary directory with the
tst_tmpdir_created() before we attempt to open the file, so the file is
removed at the end of the test along with rest of the files the test has
created.

Also we have to close the fd, we keep reference to the file only via the
mmaped() pages, there is no point in keeping it open.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
