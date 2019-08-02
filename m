Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED69C7F639
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 13:50:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B75773C1E12
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 13:50:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E90703C1DEB
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 13:50:49 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 706911400533
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 13:50:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 794B2AF7A;
 Fri,  2 Aug 2019 11:50:47 +0000 (UTC)
Date: Fri, 2 Aug 2019 13:50:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190802115046.GB27727@rei>
References: <1564742081-2234-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564742081-2234-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before
 test
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
> +	/* Mask to show which attributes are supported on filesystem. */
> +	if ((buf.stx_attributes_mask & FS_COMPR_FL) == 0)
> +		tst_brk(TCONF, "filesystem doesn't support FS_COMPR_FL");
> +	if ((buf.stx_attributes_mask & FS_APPEND_FL) == 0)
> +		tst_brk(TCONF, "filesystem doesn't support FS_APPEND_FL");
> +	if ((buf.stx_attributes_mask & FS_IMMUTABLE_FL) == 0)
> +		tst_brk(TCONF, "filesystem doesn't support FS_IMMUTABLE_FL");
> +	if ((buf.stx_attributes_mask & FS_NODUMP_FL) == 0)
> +		tst_brk(TCONF, "filesystem doesn't support FS_NODUMP_FL");

I doubt that all these flags are either set or unset for a given
fileystem, can we rather than this set flags such as supp_compr etc and
disable only tests for a subset of unsupported flags rather than the
whole test?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
