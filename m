Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F448558A
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jan 2022 16:13:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25F6C3C90EE
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jan 2022 16:13:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 840123C903B
 for <ltp@lists.linux.it>; Wed,  5 Jan 2022 16:13:35 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C3DE31400521
 for <ltp@lists.linux.it>; Wed,  5 Jan 2022 16:13:34 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCB1DB81BB6;
 Wed,  5 Jan 2022 15:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D32C36AE0;
 Wed,  5 Jan 2022 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641395612;
 bh=v8UcAp+b0yzo85bWoy7yVTdK0zThpL9ZeXAdFLOtMh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IE7xPWmSa3DeBnQfV3ZKG03/4kei2bQ+R9IaZLwz7ixH1sqwpWW5deoTjO+zc/oll
 x0hQiojggmQTFR923a6qzK1QaAOe3gD1iocDabTT/sq/RgGXR8UfJn/ZjbulUE7Rru
 7uKtm0gjf8PnRjK3ncdP3uwipfMFBnZxl6QFZ8kIxSwRDKYrG+RNaNwFBqi1lYCt/N
 JGjG52X19cnTStsmo9whgm5TN2bOCFfZtHT5iIdLIh47zSqOdCHttNgaz7yml7nbpr
 ++z3gl3j4qvfUvFv2TrJdXA/2pBmidfnvkZ61Vd2K43uli3+QWWlr0kknnZ6x5UGkh
 L3JUIeRCCAm7g==
Date: Wed, 5 Jan 2022 07:13:31 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: wenyehai <wenyehai@huawei.com>
Message-ID: <YdW1m4D2wLYQm1v/@sol.localdomain>
References: <1641287729-194863-1-git-send-email-wenyehai@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1641287729-194863-1-git-send-email-wenyehai@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] add several hash algorithms for
 crypto/crypto_user02.c
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

On Tue, Jan 04, 2022 at 05:15:29PM +0800, wenyehai via ltp wrote:
> kernel/crypto/crypto_user02.c: add several hash algorithms according to
> the latest linux kernel encryption module
> 
> Signed-off-by: Yehai Wen <wenyehai@huawei.com>
> ---
>  testcases/kernel/crypto/crypto_user02.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/crypto/crypto_user02.c b/testcases/kernel/crypto/crypto_user02.c
> index 717b297..afaff5d 100644
> --- a/testcases/kernel/crypto/crypto_user02.c
> +++ b/testcases/kernel/crypto/crypto_user02.c
> @@ -40,7 +40,15 @@ static const char * const ALGORITHM_CANDIDATES[] = {
>  	"hmac(sha256-generic)",
>  	"hmac(sha384-generic)",
>  	"hmac(md5-generic)",
> -	"hmac(sm3-generic)"
> +	"hmac(sm3-generic)",
> +	"hmac(sha512-generic)",
> +	"hmac(rmd160-generic)",
> +	"hmac(sha3-224-generic)",
> +	"hmac(sha3-256-generic)",
> +	"hmac(sha3-384-generic)",
> +	"hmac(sha3-512-generic)",
> +	"hmac(streebog256-generic)",
> +	"hmac(streebog512-generic)"
>  };

There's no harm in listing more algorithms here.  Just to avoid any
misunderstanding though, are you expecting this test to test those algorithms?
This test just uses the first available algorithm listed; it's a regression test
for a bug in the crypto_user API, and not a test for the algorithms themselves.
So, listing more algorithms here doesn't magically provide test coverage for
them.  If what you're looking for is an LTP test that tests that certain
algorithms are working correctly, then such a test would need to be written.

- Eric

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
