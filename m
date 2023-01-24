Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3767968E
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Jan 2023 12:27:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A35223CC790
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Jan 2023 12:27:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F2923CB3B0
 for <ltp@lists.linux.it>; Tue, 24 Jan 2023 12:27:32 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 05B341A006F0
 for <ltp@lists.linux.it>; Tue, 24 Jan 2023 12:27:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DC88D1FE22;
 Tue, 24 Jan 2023 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1674559650;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oL1fn8w3YkXnkepXODxRmtXXf1OYyWqQhQ173POzyOo=;
 b=Pd20TDBFPon2Gzi6Wzn8OXFXUcA9NUvDePpJwcCObDb75aLcvEndmCgF3aHUuYj4B4xUty
 06FZAsPm2w1NE0E+PCIr3HcXJoYLGcH1/2il9hvfCO8Rq+auW5bnUFUgw1NyF/2OL4+VkJ
 MIgo6xCUgLjYHLfH6PXEkN0Qvtfiejg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1674559650;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oL1fn8w3YkXnkepXODxRmtXXf1OYyWqQhQ173POzyOo=;
 b=KiV5sbhteltdXr1kmqpf3iK01KRTw02NJDTO1qZ9/AQGZpg+pUe4QccJ5PBOrb/hud2DnH
 CZphKiRWxdupK7DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B845813487;
 Tue, 24 Jan 2023 11:27:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7pGBK6LAz2NNGQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 24 Jan 2023 11:27:30 +0000
Date: Tue, 24 Jan 2023 12:27:28 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-ID: <Y8/AoCIniws6bVjd@pevik>
References: <20230124044227.13635-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230124044227.13635-1-akihiko.odaki@daynix.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/stress/http: Do not use SIGPIPE
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

Hi Akihiko,

> curl ignores SIGPIPE according to:
> https://github.com/curl/curl/commit/e2bcd2ab9e5ad894a57756fa660d2a07b69171f4

curl 7.29 (10 years old).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

I haven't tested http-stress.sh, just manually curl, which really ignores
SIGPIPE. This should be merged before release.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
