Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 176DC9E415
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 11:25:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6EDA3C1D18
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 11:25:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 188573C1C68
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 11:25:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3B01220137F
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 11:25:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E2CC6AFBE;
 Tue, 27 Aug 2019 09:25:21 +0000 (UTC)
Date: Tue, 27 Aug 2019 11:25:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190827092520.GA28859@dell5510>
References: <20190802115046.GB27727@rei>
 <1566282838-2980-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566282838-2980-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/statx04: use stx_attributes_mask
 before test
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

Hi Yang,

> stx_attributes_mask shows what's supported in stx_attributes.
> we should check four attrbutes whether supports on tested filesystem
typo attrbutes
> and only test supported flags on tested filesystem.

I'd change it to
Set supp_{append,compr,immutable,nodump} attributes only on filesystems which
actually support them.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/syscalls/statx/statx04.c | 124 ++++++++++++++++------
...

> -	attr |= FS_COMPR_FL | FS_APPEND_FL | FS_IMMUTABLE_FL | FS_NODUMP_FL;
> +	if (supp_compr)
> +		attr |= FS_COMPR_FL;
> +	if (supp_append)
> +		attr |= FS_APPEND_FL;
> +	if (supp_immutable)
> +		attr |= FS_IMMUTABLE_FL;
> +	if (supp_nodump)
> +		attr |= FS_NODUMP_FL;

>  	ret = ioctl(fd, FS_IOC_SETFLAGS, &attr);
>  	if (ret < 0) {
> @@ -149,12 +176,43 @@ static void caid_flags_setup(void)

Current code...
	if (supp_append)
		attr |= FS_APPEND_FL;
	if (supp_compr)
		attr |= FS_COMPR_FL;
	if (supp_immutable)
		attr |= FS_IMMUTABLE_FL;
	if (supp_nodump)
		attr |= FS_NODUMP_FL;

	ret = ioctl(fd, FS_IOC_SETFLAGS, &attr);
	if (ret < 0) {
I wonder, if this check is still needed. Probably it's still useful to have
sanity check, but "Flags not supported" has been caught
by supp_{append,compr,immutable,nodump} variables.

		if (errno == EOPNOTSUPP)
			tst_brk(TCONF, "Flags not supported");
		tst_brk(TBROK | TERRNO, "ioctl(%i, FS_IOC_SETFLAGS, %i)", fd, attr);
	}
...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
