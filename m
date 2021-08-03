Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A23DF18E
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 17:31:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80DB53C8867
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 17:31:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55F833C55BB
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 17:31:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4245E600A62
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 17:31:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7494D21BAF;
 Tue,  3 Aug 2021 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628004666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zi+3VhLs/ZbjrcSjqjpT2+/rSFDWr+NoAe0c5WlxUPg=;
 b=jFXh0hhs9wOPHQNoPF0PbJ199hpbyWGyjSpauCa7fmX2gnyUR5EXjElyQtt70mEb5tbsS4
 GIN1o8iuQtZJCqpXmrU8HyDxVay6CGhmK/tQa9SGBI6AinUOPhoTrAYb0pP0BYeaca8Udy
 2xU5c+i7yboLY0WDqz2Ulr7DM78YRNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628004666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zi+3VhLs/ZbjrcSjqjpT2+/rSFDWr+NoAe0c5WlxUPg=;
 b=O12933t76rP2vLv4waVvOlxq3BdHmA4FEvDN1kTcZugUI5f25KNyRwzOYn4ag66rctprru
 hpu/aVJxtdNNBMAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 567FB13B0A;
 Tue,  3 Aug 2021 15:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C9RzFDphCWEZFQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 Aug 2021 15:31:06 +0000
Date: Tue, 3 Aug 2021 17:31:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YQlhQa/q55F98Gui@yuki>
References: <87czquna4l.fsf@suse.de>
 <20210803125252.16214-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803125252.16214-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] API: TST_EXP_FAIL: Allow passing when
 errno is not checked
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
> Judging by the existing usage of TST_EXP_FAIL(..., 0, ...) in
> finit_module02. We want to pass if errno == 0 otherwise the test will
> not return a result.

This is actually not true, we do not pass 0 to TST_EXP_FAIL() in
finit_module() at all. The places that are not initialized in the
structure are initialized at runtime based on the kernel version. I do
not think that we even pass 0 to TST_EXP_FAIL*() as an errno anywhere,
but I haven't really checked all the callers.

> This is also less surprising than giving errno == 0 a dual
> meaning.

But I do agree that the current if (ERRNO) branch is confusing. I would
be for dropping the if (ERRNO) and checking the TST_ERR against ERRNO
unconditionally.

Also note that the TEST() macro clears errno, so if a syscall fails but
does not report any error TST_ERR will end up 0 either way so there is
no need for having special handling for 0.

> This also changes the trailing '\' indentation to tabs. However this
> is correct and the rest of the file is wrong.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
> 
> V3:
> * Add fix for TST_EXP_FAIL which prevented the test from
>   passing on a non buggy system.
> * TCONF but continue on non 32-bit compat mode
> * Add Fixes trailer
> 
> V2:
> * Add mising lapi header
> 
>  include/tst_test_macros.h | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 41886fbbc..4c1df58ff 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -137,17 +137,15 @@ extern void *TST_RET_PTR;
>  			break;                                                 \
>  		}                                                              \
>  		                                                               \
> -		if (ERRNO) {                                                   \
> -			if (TST_ERR == ERRNO) {                                \
> -				TST_MSG_(TPASS | TTERRNO, " ",                 \
> -				         #SCALL, ##__VA_ARGS__);               \
> -				TST_PASS = 1;                                  \
> -			} else {                                               \
> -				TST_MSGP_(TFAIL | TTERRNO, " expected %s",     \
> -				          tst_strerrno(ERRNO),                 \
> -				          #SCALL, ##__VA_ARGS__);              \
> -			}                                                      \
> -		}                                                              \
> +		if (!ERRNO || TST_ERR == ERRNO) {			\
> +			TST_MSG_(TPASS | TTERRNO, " ",			\
> +				 #SCALL, ##__VA_ARGS__);		\
> +			TST_PASS = 1;					\
> +		} else {						\
> +			TST_MSGP_(TFAIL | TTERRNO, " expected %s",	\
> +				  tst_strerrno(ERRNO),			\
> +				  #SCALL, ##__VA_ARGS__);		\
> +		}							\
>  	} while (0)
>  
>  #define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, ERRNO, __VA_ARGS__)
> -- 
> 2.31.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
