Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F100193B25
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 09:38:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D74E23C4AD7
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 09:38:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A219D3C0430
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 09:38:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B805B14019DA
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 09:38:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69CC3AC46
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 08:38:01 +0000 (UTC)
Date: Thu, 26 Mar 2020 09:37:59 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jozef Pupava <jpupava@suse.cz>
Message-ID: <20200326083759.GA29830@dell5510>
References: <20200324143837.51d2df15@daedruan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324143837.51d2df15@daedruan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Update syscalls/fsync02 to new API
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

Hi Jozef,

LGTM, thanks for your patch.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

> +	if (time_end == -1) {
> +		tst_res(TFAIL | TTERRNO, "getting end time failed");
> +	} else if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "fsync failed");
> +	} else if (TST_RET != 0) {
> +		tst_res(TFAIL | TTERRNO,
> +		"fsync failed with unexpected return value");
> +	} else if (time_end < time_start) {
> +		tst_res(TFAIL,
> +		"timer broken end %ld < start %ld",
> +		time_end, time_start);
> +	} else if ((time_delta =
> +		difftime(time_end, time_start)) > TIME_LIMIT) {
> +		tst_res(TFAIL,
> +		"fsync took too long: %lf seconds; "
> +		"max_block: %d; data_blocks: %d",
> +		time_delta, max_block, data_blocks);
> +	} else {
> +		tst_res(TPASS,
> +		"fsync succeeded in an acceptable amount of time");
> +	}

nit: note Cyril prefers due better readability return from function instead of
having too much else if. So something like this might be more readable.
But up to you.

	if (time_end == -1) {
		tst_res(TFAIL | TTERRNO, "getting end time failed");
		return;
	}

	if (TST_RET == -1) {
		tst_res(TFAIL | TTERRNO, "fsync failed");
		return;
	}

	if (TST_RET != 0) {
		tst_res(TFAIL | TTERRNO, "fsync failed with unexpected return value");
		return;
	}

	if (time_end < time_start) {
		tst_res(TFAIL, "timer broken end %ld < start %ld",
		time_end, time_start);
		return;
	}

	if ((time_delta = difftime(time_end, time_start)) > TIME_LIMIT) {
		tst_res(TFAIL,
		"fsync took too long: %lf seconds; max_block: %d; data_blocks: %d",
		time_delta, max_block, data_blocks);
		return;
	}

	tst_res(TPASS, "fsync succeeded in an acceptable amount of time");

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
