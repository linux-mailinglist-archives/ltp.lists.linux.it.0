Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A43551450
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jun 2022 11:28:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D806C3C921A
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jun 2022 11:28:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA3EB3C1BCB
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 11:28:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 52421600845
 for <ltp@lists.linux.it>; Mon, 20 Jun 2022 11:28:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F90221BE9;
 Mon, 20 Jun 2022 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655717293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSD2gJ47qsTVPNmAR3l1QZAnGyE7vnAevpgGyXeYZFk=;
 b=DZJLpuMSu7uG48wVMcsRbqmByC1a3rzrTh09mwlEPXH1zp+An+YMDkKhqU/5aDa3IeYoUo
 Y+52SCnx4zVKN89oRls9u6KZovFdiksqRFDI4pFSn4S4r+McAeqDzEBiJitArh9NkJNpax
 PcPDCwnb+Jsxbm0dUu0BTRjfWOo6Il0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655717293;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSD2gJ47qsTVPNmAR3l1QZAnGyE7vnAevpgGyXeYZFk=;
 b=ys8AFFY1ae5NR1qB2pcIIS9n15SenQjEvLIcwAXCaIr/qDeVSYVKb6Zjm8X61R8opQEls0
 NdMFrJzQT+SOfeCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5E979134CA;
 Mon, 20 Jun 2022 09:28:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S8BiEq09sGKXRAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 20 Jun 2022 09:28:13 +0000
Date: Mon, 20 Jun 2022 11:30:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YrA+LFaA664fHpZA@yuki>
References: <20220617131659.27868-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220617131659.27868-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ci/ubuntu: impish -> jammy
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

Hi!
> Ubuntu 21.10 impish EOL in 2027-04 (next month).
                                ^
			     2022-06
> Replace it with the latest stable release (EOL 2027-04).

Other than that:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>


> Reported-by: Andrea Cervesato <andrea.cervesato@suse.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> It's also a question whether use 20.04 LTS focal instead of 18.04 LTS
> bionic. I guess we'd like to cover everything: bleeding edge, used
> distros and very old and still used distros. bionic EOL next year
> (2023-04).

I would keep that till the EOL

> Kind regards,
> Petr
> 
>  .github/workflows/ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> index fe28e4d05..a412f8904 100644
> --- a/.github/workflows/ci.yml
> +++ b/.github/workflows/ci.yml
> @@ -93,7 +93,7 @@ jobs:
>                CC: clang
>                METADATA: asciidoctor-pdf
>  
> -          - container: "ubuntu:impish"
> +          - container: "ubuntu:jammy"
>              env:
>                CC: gcc
>                METADATA: asciidoctor
> -- 
> 2.36.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
