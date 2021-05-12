Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9744937C4A7
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 17:32:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FA943C8A99
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 17:32:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E805A3C1C23
 for <ltp@lists.linux.it>; Wed, 12 May 2021 17:31:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6DFAD200DEA
 for <ltp@lists.linux.it>; Wed, 12 May 2021 17:31:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEF39B0B3;
 Wed, 12 May 2021 15:31:58 +0000 (UTC)
Date: Wed, 12 May 2021 17:31:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YJv07fCsOlCR0LZH@pevik>
References: <20210308033428.20924-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308033428.20924-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] proc01: Add /proc/dirty/dirty_list to known_issues
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zhao,

> When we open the file /proc/dirty/dirty_list directly, it will return -1 and
> set the errno to ENOMEM.

...
> +++ b/testcases/kernel/fs/proc/proc01.c
> @@ -85,6 +85,7 @@ static const struct mapping known_issues[] = {
>  	{"open", "/proc/sal/init/data", EBUSY},
>  	{"open", "/proc/sal/mca/data", EBUSY},
>  	{"open", "/proc/fs/nfsd/pool_stats", ENODEV},
> +	{"open", "/proc/dirty/dirty_list", ENOMEM},
Is /proc/dirty/dirty_list in mainline? We haven't found "dirty_list" string in
mainline git (there is dirty_list code, but not "dirty_list" string).

I'd prefer not to add vendor specific files, or at least to document them.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
