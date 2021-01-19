Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6D2FB584
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 12:01:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C7EB3C309B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 12:01:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9FD953C0737
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 12:01:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 34FCC200904
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 12:01:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99E77AB9F;
 Tue, 19 Jan 2021 11:01:36 +0000 (UTC)
Date: Tue, 19 Jan 2021 12:01:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YAa8D8iQwaQr2tAm@pevik>
References: <20201215092534.757347-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215092534.757347-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/lftest: Convert to new library
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Additonal changes:
>  - Use temp directory instead of working dir
>  - 100 buffers is teh default  now and can be changed using -n
>  - Removed some useless output (nseek, nwrite was always bufnum)

Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM, going to merge it after Jan 2021 release.

Below are 2 tiny details I'll fix during merge.

...
> +++ b/runtest/fs
> @@ -58,7 +58,7 @@ ftest06 ftest06
>  ftest07 ftest07
>  ftest08 ftest08

> -lftest01	lftest 100
> +lftest01	lftest

Not sure if anybody uses runtest/fs_readonly, but we still haven't removed it.
Thus it must be also updated:

-test_robind54 test_robind.sh -c "lftest 80"
+test_robind54 test_robind.sh -c "lftest"

...
> +++ b/testcases/kernel/fs/lftest/lftest.c
...
> +	if (str_bufnum) {
> +		if (tst_parse_int(str_bufnum ,&bufnum, 0, INT_MAX)) {
nit: formatting:
		if (tst_parse_int(str_bufnum, &bufnum, 0, INT_MAX)) {

> +			tst_brk(TBROK, "Invalid buffer count '%s'", str_bufnum);
> +		}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
