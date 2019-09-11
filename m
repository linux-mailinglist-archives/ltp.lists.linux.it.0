Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F3AF89B
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 11:12:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F8D33C2091
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 11:12:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 149493C0232
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 11:12:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 572A82013B0
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 11:12:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B939AF5A;
 Wed, 11 Sep 2019 09:12:44 +0000 (UTC)
Date: Wed, 11 Sep 2019 11:12:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20190911091242.GA24623@dell5510>
References: <20190911085536.25546-1-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911085536.25546-1-cfamullaconrad@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Use LTP_TIMEOUT_MUL in TST_RETRY_FN()
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

Hi Clemens,

> We discovered timeout problems for well known candidates.
> Most of the time we already use LTP_TIMEOUT_MUL in other cases to
> globally increase timeout value. So doing it for this function as well.

> Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
> ---
>  testcases/lib/tst_test.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index e0b24c6b9..80b8871cb 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -162,9 +162,11 @@ EXPECT_FAIL()

>  TST_RETRY_FN_EXP_BACKOFF()
>  {
> +	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> +
>  	local tst_fun="$1"
>  	local tst_exp=$2
> -	local tst_sec=$(expr $3 \* 1000000)
> +	local tst_sec=$(expr $3 \* 1000000 \* $LTP_TIMEOUT_MUL)
>  	local tst_delay=1

I'm for it, but that will diverge from C API. Shouldn't we add it also
to tst_common.h?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
