Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987B7A01B3
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Sep 2023 12:29:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2B443CE6F9
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Sep 2023 12:29:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D0F803CB222
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 12:29:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3E1E160346E
 for <ltp@lists.linux.it>; Thu, 14 Sep 2023 12:29:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 23EF91F750;
 Thu, 14 Sep 2023 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1694687378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQJaPPq2aYJuBjD70TA/tCilwLxKmEeoN3k/wUPCi+s=;
 b=xYrhI2hBRVOkvsWBO8NKGIBF3ig3oIFTwzZIo8f4mVqEE/kEbb5BTT2ctrplFRsXxxbZtR
 lGCqbESy0MyKzrRIJM+vBgyK2CGZxgO9UB5fHoULOCfiErEvncmXAZ0Top12je4TcAq6fi
 NNPv8x2oHAjIe/oGbWDH8oyK/PREGpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1694687378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQJaPPq2aYJuBjD70TA/tCilwLxKmEeoN3k/wUPCi+s=;
 b=4zd6Lr2hV27Lzne3Oqq2r8AJiM+QoVtSwlpHvf8GLhUDeCxm7HoPoPkfWjZN3BJXrTvHFR
 pAcYvhxSNgNsRsBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1226013580;
 Thu, 14 Sep 2023 10:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mWRjA5LgAmVsbgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 14 Sep 2023 10:29:38 +0000
Date: Thu, 14 Sep 2023 12:30:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZQLgv0WWc7bTMRyD@yuki>
References: <20230913144706.7126-1-andrea.cervesato@suse.de>
 <20230913144706.7126-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913144706.7126-2-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v9 1/4] Refactor mqns_03 using new LTP API
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
Since we are getting close to release I've fixed the remaining problems
and pushed, thanks.

What I fixed:

- runtest entries were not updated
- license did not match the original
- there was no need for asprintf() for statically defined strings
- the mq_freed was set but not used, so I've removed it
- changed the SAFE_STAT() to access() so that we have clear TPASS/TFAIL
  messages

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
