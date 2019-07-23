Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CA3716B0
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 13:03:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A10C43C1C9A
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 13:03:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CAF103C0137
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 13:03:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9F086140182F
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 13:03:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ABBF6AE74;
 Tue, 23 Jul 2019 11:03:07 +0000 (UTC)
Date: Tue, 23 Jul 2019 13:03:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Steve Muckle <smuckle@google.com>
Message-ID: <20190723110306.GB22630@rei.lan>
References: <20190722194439.161904-1-smuckle@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722194439.161904-1-smuckle@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx01: loosen the stx_blocks check
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> A filesystem may preallocate blocks (ext4 does this), so even though the
> contents of the file may fit into a single block, statx may report more
> than one block. Loosen the test to accommodate this.
> 
> Signed-off-by: Steve Muckle <smuckle@google.com>
> ---
>  testcases/kernel/syscalls/statx/statx01.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/statx/statx01.c b/testcases/kernel/syscalls/statx/statx01.c
> index 23ea99b4a..5e705dc7d 100644
> --- a/testcases/kernel/syscalls/statx/statx01.c
> +++ b/testcases/kernel/syscalls/statx/statx01.c
> @@ -92,7 +92,7 @@ static void test_normal_file(void)
>  			buff.stx_mode, MODE);
>  
>  
> -	if (buff.stx_blocks <= buff.stx_blksize/512)
> +	if (buff.stx_blocks <= 128)

Why 128?

Can't we rather multiply the buff.stx_blksize/512 by 16?

The filesystem block size is not constant the ppc64le has page size and
block size 64k, at least for Btrfs, so 128 would be a single block
there so if we preallocated blocks there this would stil fail.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
