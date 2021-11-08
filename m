Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F396447C58
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Nov 2021 09:55:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C07B33C75A0
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Nov 2021 09:55:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A96323C6D68
 for <ltp@lists.linux.it>; Mon,  8 Nov 2021 09:55:29 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C9AB3600852
 for <ltp@lists.linux.it>; Mon,  8 Nov 2021 09:55:28 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF284212C5;
 Mon,  8 Nov 2021 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636361727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0p2Cc3r9wXvSpRCW6YI3CjvhtcBeS0wcznXH9F5qQjc=;
 b=FBVyeoumpPCbgOLk/aoecrAzNreDps0GunDdSHInw8fhgZ6hIkyBMW1hAfUdkwqn/a3uN1
 8N7LJRn/nQsrVsEhdTBvjgoqWIL/nkM12g6E3tHhQjmZaX+6j7clvYGpcfI6phS1rcIDy2
 5y5rnhibQo9FwDCgyLCFNLj08zMGSwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636361727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0p2Cc3r9wXvSpRCW6YI3CjvhtcBeS0wcznXH9F5qQjc=;
 b=JjEVEvbT65J0pE2CtVnPRsKSmLAe2C+C97ARDx7aiJERbqRAMR530/HWbQQ3YOYMkuOmEI
 JnEqMsEaI8xLT/Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9ECF139CF;
 Mon,  8 Nov 2021 08:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5Uw2NP/liGG2ZwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 08 Nov 2021 08:55:27 +0000
Date: Mon, 8 Nov 2021 09:56:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YYjmO4H3Dsa3oDt/@yuki>
References: <20211105143125.7858-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211105143125.7858-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] CI: Remove Tumbleweed
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
> Tumbleweed suffers with common timeouts during installing packages.
> 
> https://github.com/linux-test-project/ltp/runs/4102121237?check_suite_focus=true
> 2021-11-04T07:12:04.5788989Z (110/114) Installing: pcre2-devel-10.38-1.1.x86_64 [.........done]
> 2021-11-04T13:10:22.9205133Z (111/114) Installing: clang13-13.0.0-1.2.x86_64 [.
> 2021-11-04T13:10:22.9326559Z ##[error]The operation was canceled.
> 2021-11-04T13:10:22.9383287Z Stop and remove container: 3dab012d9d14480da05fc921cd0c0124_opensusetumbleweed_b0089d
> 
> While keeping restarting after some time usually helps, it's not useful
> to have CI with false positives thus removed until problem gets
> permanently fixed. But keep seccomp workaround introduced in 0aa9ebd30
> for other distros with newest glibc.

Thinking about it it tumbleweed may not be suited for CI, quite possibly
new packages gets uploaded to the repository during our CI build which
would explain these kind of failures.

Acked-by: Cyril Hrubis <chrubis@suse.cz>

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  .github/workflows/ci.yml | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
> index 55d8f5eb5..3a0cc7d94 100644
> --- a/.github/workflows/ci.yml
> +++ b/.github/workflows/ci.yml
> @@ -76,11 +76,6 @@ jobs:
>                CC: clang
>                METADATA: asciidoc-pdf
>  
> -          - container: "opensuse/tumbleweed"
> -            env:
> -              CC: gcc
> -              METADATA: asciidoctor
> -
>            - container: "opensuse/leap"
>              env:
>                CC: gcc
> -- 
> 2.33.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
