Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1883E04E5
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 17:52:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 858703C80C6
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 17:52:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BA0133C8012
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 17:52:22 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CA838600D34
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 17:52:21 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 113BA1FDFD;
 Wed,  4 Aug 2021 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628092341;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LdjzdTuUDbZK5F8Mihr2MzMyfbLfmk9/+PB4PfIFR0=;
 b=yDQwg1MZVRZf2ijLx+jHnrsfyX1ISlQohJuT7P/HicEcSoAxTyyslwb80TpX6VUTW0oW7w
 JoIQTCwjalY+SWBGZes9ANtCs/91GAQ9BAI4vN0p7AW0xaxj2i53dXotnvLzJBmRe8+amz
 o133t02rlUzC4m9DgaIQ8lVoeWb1iNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628092341;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LdjzdTuUDbZK5F8Mihr2MzMyfbLfmk9/+PB4PfIFR0=;
 b=Q11Hl2FYeNcYMc7kN+WdUsPF/56xc8hvW5njRgobQtperHuKdryLarf8TzyuBuyVVoM+e1
 /zeLQOf++bBXKcBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B88F9139B5;
 Wed,  4 Aug 2021 15:52:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id sLhJK7S3CmFpaAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 04 Aug 2021 15:52:20 +0000
Date: Wed, 4 Aug 2021 17:52:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YQq3s+33ceaJmvR7@pevik>
References: <20210715065805.14086-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715065805.14086-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: Specify linux-stable-git rule
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/c-test-api.txt | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
> index 45784195b..9d26a483d 100644
> --- a/doc/c-test-api.txt
> +++ b/doc/c-test-api.txt
> @@ -2205,6 +2205,10 @@ struct tst_test test = {
>  };
>  -------------------------------------------------------------------------------

> +NOTE: We don't track all backports to stable kernel but just those which are
> +      stable branch specific (unique), i.e. no commit in mainline. Example of
> +      commits: c4a23c852e80, cac68d12c531.
> +
>  Glibc git commit in a regression test for a glibc bug:
>  [source,c]
>  -------------------------------------------------------------------------------
Any comment on this? I should have marked it as [RFC].

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
