Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA74D7C0B5
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 14:07:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B80D33C1D28
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 14:07:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0EDA23C1D15
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 14:07:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 32BB96012B9
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 14:07:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF819AB9D;
 Wed, 31 Jul 2019 12:07:07 +0000 (UTC)
Date: Wed, 31 Jul 2019 14:07:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190731120706.GD22537@dell5510>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 1/3] lib: alter find_free_loopdev()
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

Hi Xu,

...
> +++ b/doc/test-writing-guidelines.txt
> @@ -1053,6 +1053,18 @@ IMPORTANT: All testcases should use 'tst_umount()' instead of 'umount(2)' to
>  -------------------------------------------------------------------------------
>  #include "tst_test.h"

> +int tst_find_free_loopdev(const char *path, size_t path_len);
> +-------------------------------------------------------------------------------
> +
> +This function finds a free loopdev and returns the free loopdev minor (-1 for no
> +free loopdev). If path is non-NULL, it will be filled with free loopdev path.
> +If you want to use a customized loop device, we can call tst_find_free_loopdev
> +(NULL, 0) in tests to get a free minor number. Then mknod.
Maybe (as "Then mknod." is a sentence without a verb):
   (NULL, 0) in tests to get a free minor number and then mknod.

(nitch, of course can be fixed during merge)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
