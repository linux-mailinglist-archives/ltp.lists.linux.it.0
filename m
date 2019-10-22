Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF16EDFF0C
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 10:08:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3AA33C22B8
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 10:08:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 667473C1CA2
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 10:08:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8EB04600A1C
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 10:08:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E26AFB04C;
 Tue, 22 Oct 2019 08:08:32 +0000 (UTC)
Date: Tue, 22 Oct 2019 10:08:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191022080830.GA17235@dell5510>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-5-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018124502.25599-5-cfamullaconrad@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/5] Add newlib shell test for
 tst_multiply_timeout()
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

Hi,

> +do_test()
> +{
> +	LTP_TIMEOUT_MUL=2
> +	local sec=1
> +
> +	call_it 'tst_multiply_timeout sec' 'sec' 2
still some issue with this patchset. Making the function private
(_tst_multiply_timeout), we obviously get warning:
test_timeout_mul 1 TWARN: Private variable or function _tst_multiply_timeout used!

Unless we want to to add some special variable for library tests
(i.e. TST_IGNORE_WARN), the function cannot be used directly

I suggest to push the patchset change to use float (not to be postponed even
more), but without this patchset. Tests should be later added.

Kind regards,
Petr

> +	sec=1
> +	LTP_TIMEOUT_MUL="1.5"
> +	call_it 'tst_multiply_timeout sec' 'sec' 2
> +
> +	sec=1
> +	LTP_TIMEOUT_MUL=0.5
> +	call_it 'tst_multiply_timeout sec' 'sec' 1
> +
> +	sec=1
> +	LTP_TIMEOUT_MUL=2
> +	call_it 'tst_multiply_timeout sec' 'sec' 2
> +	call_it 'tst_multiply_timeout sec' 'sec' 4
> +	call_it 'tst_multiply_timeout sec' 'sec' 8
> +}
> +
> +tst_run

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
