Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4837BD72
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 14:55:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF27A3C8A5D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 14:55:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2393E3C1D63
 for <ltp@lists.linux.it>; Wed, 12 May 2021 14:55:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 76C7D200DC6
 for <ltp@lists.linux.it>; Wed, 12 May 2021 14:55:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA4D0AFE2;
 Wed, 12 May 2021 12:55:00 +0000 (UTC)
Date: Wed, 12 May 2021 14:28:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YJvJ91pXVluuzpvu@yuki>
References: <20210512101738.31118-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512101738.31118-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] API: Give user hint when checkpoints were not
 initialised
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
> ---
>  lib/tst_checkpoint.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/tst_checkpoint.c b/lib/tst_checkpoint.c
> index 9e9dcf9e6..13d86c73b 100644
> --- a/lib/tst_checkpoint.c
> +++ b/lib/tst_checkpoint.c
> @@ -86,6 +86,9 @@ int tst_checkpoint_wait(unsigned int id, unsigned int msec_timeout)
>  	struct timespec timeout;
>  	int ret;
>  
> +	if (!tst_max_futexes)
> +		tst_brkm(TBROK, NULL, "Set test.needs_checkpoints = 1");
> +
>  	if (id >= tst_max_futexes) {
>  		errno = EOVERFLOW;
>  		return -1;
> @@ -107,7 +110,10 @@ int tst_checkpoint_wake(unsigned int id, unsigned int nr_wake,
>  {
>  	unsigned int msecs = 0, waked = 0;
>  
> -	if (id >= tst_max_futexes) {
> +	if (!tst_max_futexes)
> +		tst_brkm(TBROK, NULL, "Set test.needs_checkpoints = 1");
> +
> +        if (id >= tst_max_futexes) {
    ^
    Spaces instead of tabs...


Other than that this looks obviously fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
