Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C865662C1
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 07:24:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FA8A3CA086
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 07:24:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F081C3C7C07
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 07:24:53 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6EC8B1A00796
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 07:24:53 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CF1161FE31
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 05:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656998692;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rk7Du9IVA6pWZAM+7VHIXTGrzbI+zH5YMWHHChYpoPM=;
 b=RipOgBbNhqp3cxpeC9TS55uUDbowm0lo/noVZSSkbP0fEnxbo0Djo7oRycEVSvr4gZvGW/
 QsZoaAa79N1OTAh0+1eIBFAKWijwYS4arFA87lfFq3Fyrw0txrKglFqcEheq5v+xvLAyBg
 3ADZizTqjD/8VEWs774qH8h9iIVyZCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656998692;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rk7Du9IVA6pWZAM+7VHIXTGrzbI+zH5YMWHHChYpoPM=;
 b=rLDkYPOhWSAZLdcaUKhQ/9uzIDH1P10W1OtMUIZpiiB6zhbfDBCBjX6YJXMeejtlr/l12R
 tfyOl9akYycw17Cw==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9DC622C141;
 Tue,  5 Jul 2022 05:24:52 +0000 (UTC)
References: <20220620092146.7604-1-chrubis@suse.cz>
 <20220620092146.7604-6-chrubis@suse.cz>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 05 Jul 2022 06:24:43 +0100
In-reply-to: <20220620092146.7604-6-chrubis@suse.cz>
Message-ID: <87tu7wrv17.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/7] openposix: aio_h/2-1: Add return at the end
 of main()
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

Cyril Hrubis <chrubis@suse.cz> writes:

> This is compile-only test so the return value is not actually used but
> that's not a reason not to fix warnings.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  .../open_posix_testsuite/conformance/definitions/aio_h/2-1.c    | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/testcases/open_posix_testsuite/conformance/definitions/aio_h/2-1.c b/testcases/open_posix_testsuite/conformance/definitions/aio_h/2-1.c
> index 39fb41d22..133b3a516 100644
> --- a/testcases/open_posix_testsuite/conformance/definitions/aio_h/2-1.c
> +++ b/testcases/open_posix_testsuite/conformance/definitions/aio_h/2-1.c
> @@ -25,4 +25,6 @@ int main(void)
>  	aiocb.aio_nbytes = 0;
>  	aiocb.aio_sigevent = sigevent;
>  	aiocb.aio_reqprio = -1;
> +
> +	return 0;
>  }
> -- 
> 2.35.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
