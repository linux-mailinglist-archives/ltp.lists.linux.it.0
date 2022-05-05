Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A8951C0D2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 May 2022 15:32:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78D963CA89F
	for <lists+linux-ltp@lfdr.de>; Thu,  5 May 2022 15:32:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9B3133C9F6C
 for <ltp@lists.linux.it>; Thu,  5 May 2022 15:32:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 64CAF1000451
 for <ltp@lists.linux.it>; Thu,  5 May 2022 15:32:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 817E6219C7;
 Thu,  5 May 2022 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651757560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dXWaxa4w192uh+seh14y2bUjB1CHRFnbQo3Q6JReKVQ=;
 b=quYYSLe5/IIIhBfE1OSk9yY1vS14PD/8ETpff7xg+PZS65wxsBLIlK3Zr25Z4GOvwtrkUJ
 a02MD+KDbRVKdqJEh4Ai8DwvJqKd0ujRTDHDYlzZkQrHQpl/j0XV5GI/NtZghTPgnPOLnC
 L9QUlHqy2RkyzLTwyTFpaJPPTVAXypg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651757560;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dXWaxa4w192uh+seh14y2bUjB1CHRFnbQo3Q6JReKVQ=;
 b=RJR1uFlEHeuRQSrSfZDT8fTIuhRvJlsp221LbTgG8o5QYC+Liqk0ww0KjV82RNfQS+W/Je
 lmzMG6+1e+gZN/CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FEAB13B11;
 Thu,  5 May 2022 13:32:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +FzUGvjRc2KXHwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 May 2022 13:32:40 +0000
Date: Thu, 5 May 2022 15:34:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
Message-ID: <YnPSgLxK2jUGndIv@yuki>
References: <cover.1651176645.git.luke.nowakowskikrijger@canonical.com>
 <2a67385fe34905b5b631abadb6daefb6f595a924.1651176646.git.luke.nowakowskikrijger@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a67385fe34905b5b631abadb6daefb6f595a924.1651176646.git.luke.nowakowskikrijger@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 05/19] tst_test_macros: Add TST_TOSTR macro
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
> Signed-off-by: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
> ---
>  include/tst_test_macros.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 2e7b7871c..f5d86c421 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -36,6 +36,9 @@ extern void *TST_RET_PTR;
>  
>  #define TST_2_(_1, _2, ...) _2
>  
> +#define _TST_TOSTR(STR) #STR
> +#define TST_TOSTR(STR) _TST_TOSTR(STR)

Just minor thing, anything starting with underscore is reserved for libc
and kernel. So we try to add the underscore at the end instead when
defining intemediate macros. This one should be TST_TO_STR_() instead.

>  #define TST_FMT_(FMT, _1, ...) FMT, ##__VA_ARGS__
>  
>  #define TST_MSG_(RES, FMT, SCALL, ...) \
> -- 
> 2.32.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
