Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B04C6DB7
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Feb 2022 14:16:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 031763CA247
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Feb 2022 14:16:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6BD4A3C4BDC
 for <ltp@lists.linux.it>; Mon, 28 Feb 2022 14:16:45 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D704320009C
 for <ltp@lists.linux.it>; Mon, 28 Feb 2022 14:16:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B5601F899;
 Mon, 28 Feb 2022 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646054204;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TpEi8GfDn5QvLKkRTXVNzNJXhwH1krD9e6EHVqdLuSk=;
 b=zlTx6RSH71h0SZqPA0pZ/vlZTThH66HQM1snyOgW6z9t++1vfJIOIlZRZpZkh/OEeMntlF
 dPTxcPyUcIeJR71U4nuAIrdW+FxAWPOyDBykv6mlBC2Ry5gzXHZdez7FPcmiFeV2bBv2Ui
 Zf7Vu1PntBBYRkyO7nyZ0GwUlFMgioo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646054204;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TpEi8GfDn5QvLKkRTXVNzNJXhwH1krD9e6EHVqdLuSk=;
 b=CH97IBizVT/htnYjmy3I65BJpdCF3VJMG9+4R9YaiTljaOVYQDuU3OAb1bzgF3F4zjr8yy
 1ZlRlEBxVSxrjCCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC79713C3E;
 Mon, 28 Feb 2022 13:16:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0dI5MDvLHGLWPQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 28 Feb 2022 13:16:43 +0000
Date: Mon, 28 Feb 2022 14:16:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YhzLOrZDTTc/EffH@pevik>
References: <20220228094659.21959-1-chrubis@suse.cz>
 <20220228094659.21959-3-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228094659.21959-3-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] ksm06: lock memory about to be merged
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Good catch!

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  testcases/kernel/mem/lib/mem.c | 3 +++
>  1 file changed, 3 insertions(+)

> diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib/mem.c
> index 39e3f1791..f1756b34a 100644
> --- a/testcases/kernel/mem/lib/mem.c
> +++ b/testcases/kernel/mem/lib/mem.c
> @@ -565,6 +565,9 @@ void test_ksm_merge_across_nodes(unsigned long nr_pages)
>  #endif

>  		memset(memory[i], 10, length);
> +
> +		if (mlock(memory[i], length))
> +			tst_res(TINFO | TERRNO, "mlock() failed");
I'd consider using TWARN.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
