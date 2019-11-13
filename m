Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44DFAB8D
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 08:59:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BDE53C2393
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 08:59:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7FA853C2356
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 08:59:46 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 58DAE20180B
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 08:59:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6FF51B47C;
 Wed, 13 Nov 2019 07:59:44 +0000 (UTC)
Date: Wed, 13 Nov 2019 08:59:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20191113075942.GA14606@dell5510>
References: <20191107153458.16917-1-rpalethorpe@suse.com>
 <20191107153458.16917-3-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107153458.16917-3-rpalethorpe@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib: Allow timeout coefficient < 1
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
Cc: dvyukov@google.com, automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> For the Syzkaller reproducers we want to allow the test runner to set the
> timeout to be a fraction of the default amount.

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  lib/tst_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 6239acf89..2e00fd86b 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -1107,7 +1107,7 @@ void tst_set_timeout(int timeout)
>  	if (mul) {
>  		float m = atof(mul);

> -		if (m < 1)
> +		if (m <= 0)
>  			tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul);

>  		results->timeout = results->timeout * m + 0.5;

Update for current master:

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 8d7dee2cc..2513ce7ba 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1190,8 +1190,8 @@ unsigned int tst_multiply_timeout(unsigned int timeout)
 			timeout_mul = 1;
 		}
 	}
-	if (timeout_mul < 1)
-		tst_brk(TBROK, "LTP_TIMEOUT_MUL must to be int >= 1! (%.2f)",
+	if (timeout_mul <= 0)
+		tst_brk(TBROK, "LTP_TIMEOUT_MUL must to be int >= 0! (%.2f)",
 				timeout_mul);
 
 	if (timeout < 1)


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
