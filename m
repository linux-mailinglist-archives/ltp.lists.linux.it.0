Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0036B98A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 20:59:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3F153C673F
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 20:59:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D82723C66E8
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 20:59:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BC1541000406
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 20:59:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2577DAE4B
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 18:59:07 +0000 (UTC)
Date: Mon, 26 Apr 2021 20:59:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YIcNeV0wbuK9wmPu@pevik>
References: <20210401124724.25394-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401124724.25394-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] df01.sh: Fix DF_FS_TYPE assignment on bind
 mount
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Merged this one.

Kind regards,
Petr

> In case of bind mount of testing directory, grep will assign filesystem
> twice, with new line:

> $ echo "DF_FS_TYPE: '$DF_FS_TYPE'"
> DF_FS_TYPE: 'ext2
> ext2'

> Limiting only first line to avoid failure with confusing message:

> df01 5 TFAIL: 'df' failed.
> df: ext2: No such file or directory

> +++ b/testcases/commands/df/df01.sh
> @@ -39,7 +39,7 @@ setup()
>  {
>  	tst_mkfs
>  	tst_mount
> -	DF_FS_TYPE=$(mount | grep "$TST_DEVICE" | awk '{print $5}')
> +	DF_FS_TYPE=$(mount | grep "$TST_DEVICE" | awk 'NR==1{print $5}')
>  }

>  df_test()

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
