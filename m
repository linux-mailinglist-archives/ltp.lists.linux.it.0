Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E75B931A23C
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 17:01:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B8E23C945B
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 17:01:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2C22A3C5ACE
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 17:01:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A81BE600F94
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 17:01:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1AE34B029;
 Fri, 12 Feb 2021 16:01:13 +0000 (UTC)
Date: Fri, 12 Feb 2021 17:02:23 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YCamj5IAuyPMOcBo@yuki.lan>
References: <20210202130441.17861-1-pvorel@suse.cz>
 <20210202130441.17861-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202130441.17861-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] keyctl05: TCONF on FIPS mode
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
Cc: ltp@lists.linux.it, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +	int is_asymmetric = !strcmp(type, "asymmetric");
> +
>  	TEST(add_key(type, "desc", payload, plen, KEY_SPEC_SESSION_KEYRING));
>  	if (TST_RET < 0) {
> +		if (TST_ERR == EINVAL && is_asymmetric && tst_fips_enabled()) {
                                                          ^
							  I guess that
							  we can save
							  the value in
							  test setup
							  instead of
							  re-reading it
							  on every
							  iteration.

Other than that it looks good to me.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> +			tst_res(TCONF, "key size not allowed in FIPS mode");
> +			return;
> +		}
>  		if (TST_ERR == ENODEV) {
>  			tst_res(TCONF, "kernel doesn't support key type '%s'",
>  				type);
>  			return;
>  		}
> -		if (TST_ERR == EBADMSG && !strcmp(type, "asymmetric")) {
> +		if (TST_ERR == EBADMSG && is_asymmetric) {
>  			tst_res(TCONF, "kernel is missing x509 cert parser "
>  				"(CONFIG_X509_CERTIFICATE_PARSER)");
>  			return;
>  		}
> -		if (TST_ERR == ENOENT && !strcmp(type, "asymmetric")) {
> +		if (TST_ERR == ENOENT && is_asymmetric) {
>  			tst_res(TCONF, "kernel is missing crypto algorithms "
>  				"needed to parse x509 cert (CONFIG_CRYPTO_RSA "
>  				"and/or CONFIG_CRYPTO_SHA256)");
> -- 
> 2.30.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
