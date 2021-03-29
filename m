Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3B34D79A
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 20:53:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 009193C8C27
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 20:53:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 64B343C1A31
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 20:53:12 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BBB6010005A4
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 20:53:11 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2ABF61613;
 Mon, 29 Mar 2021 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617043989;
 bh=ejIKb6q6/gs2HDoMQ6j1LGQXZ1hRb27t83U54HTi7Dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=otksGAPBCiQKgiUOqwONY39mY4WMdjBAge9EMcCqBek+pU6iRU9XaTGxBiO2PJVaI
 1SY5GTeQ/ChKbTqszWlIbjYX+1p1t7He4RffFIqhE7VDScnskmRZQEBPXsOwEx5E9+
 XTnRL3ExfEyVd6j3tvPUNUxV1HipDGPzjfyReI8PaNnM9xJyNc5cQ0P28K1MxUKJGp
 EUKImkMrHxQK6yRvlooRQEjtYvvFf5tpGiVbNflAoCLqc7cC4Wzv3qyUCqt4zi0CPb
 4QuPo1YD0tuY+gb1UZKXlb34KzHT6T/cGoui4Gl5GLd856hpfkXH3bRuRICwXweBQU
 GzA4U/urnnmMw==
Date: Mon, 29 Mar 2021 11:53:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YGIiE5/DnjXrcHzK@gmail.com>
References: <20210315130349.1155389-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315130349.1155389-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto_user02: Find a valid template
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Mar 15, 2021 at 02:03:49PM +0100, Joerg Vehlow wrote:
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> 
> The test requires a crypto template, that is not in use by someone else,
> otherwise deleting it is not possible.
> This adds a list of templates, that are tested in order, until one is found,
> that can be used for the test, otherwise TCONF is returned.
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Generally looks good.  A few nits below.

> +/*
> + * List of possible templates to use try (not exhaustive).
> + * The template has to be valid (i.e. the drivers must exists
> + * and be a valid combination) and it has to be deleteable.
> + * To be deletable it cannot be used by someone else.
> + * The first algorithm, that fullfils the criteria is used for the test.
> + */
> +static const char* TEMPLATE_CANDIDATES[] = {
> +	"hmac(sha1-generic)",
> +	"hmac(sha224-generic)",
> +	"hmac(sha256-generic)",
> +	"hmac(sha384-generic)",
> +	"hmac(md5-generic)"
> +};

"template" means something like "hmac" by itself.  This probably should be
called something like ALGORITHM_CANDIDATES, and similarly template => algorithm
in a couple places below.

Also it should be 'const char * const', not just 'const char *'.

>  static void setup(void)
>  {
> +	int rc;
> +	unsigned i;
> +	struct crypto_user_alg alg, alg_out;

alg_out is unused.

> +	if (!template) {
> +		tst_brk(TCONF, "No viable template found");
> +	}

Single-line statements shouldn't have braces like this.

- Eric

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
