Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD63A817D
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 15:55:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DED33C970F
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 15:55:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE28F3C2E0B
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 15:55:20 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 721B21A00CD5
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 15:55:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A45F81FD4A;
 Tue, 15 Jun 2021 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623765319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lFpJLBDOxO4TF4OH8o1MXJwcFV2TcY63QqINWQGTb/U=;
 b=Z6Ao1mYVEwe4n17jHLVlI8P2jVJlsOtl10CEnRRP56/L+Eg0wXtsxNtMx5t1r6mQqn1FjJ
 mcQVpBGGkUgVeB//+fluRDzqR148wRBiErIGSKy/l4SjtRkIMLO+oKyisv5Ye1/C2Vdg0i
 L6YqO4DkgDJtNq94n2HOPGSoGUvG9Bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623765319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lFpJLBDOxO4TF4OH8o1MXJwcFV2TcY63QqINWQGTb/U=;
 b=r7f5WxoMCuzDydByiVQz7ex6dva/fpEV8y93Gvdh/+75IwcF0LPXSkCpnmNKdxbg05eHxN
 MC0/YY3JFFHoAQCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 85D84118DD;
 Tue, 15 Jun 2021 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623765319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lFpJLBDOxO4TF4OH8o1MXJwcFV2TcY63QqINWQGTb/U=;
 b=Z6Ao1mYVEwe4n17jHLVlI8P2jVJlsOtl10CEnRRP56/L+Eg0wXtsxNtMx5t1r6mQqn1FjJ
 mcQVpBGGkUgVeB//+fluRDzqR148wRBiErIGSKy/l4SjtRkIMLO+oKyisv5Ye1/C2Vdg0i
 L6YqO4DkgDJtNq94n2HOPGSoGUvG9Bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623765319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lFpJLBDOxO4TF4OH8o1MXJwcFV2TcY63QqINWQGTb/U=;
 b=r7f5WxoMCuzDydByiVQz7ex6dva/fpEV8y93Gvdh/+75IwcF0LPXSkCpnmNKdxbg05eHxN
 MC0/YY3JFFHoAQCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id kmV2H0exyGBtJAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 15 Jun 2021 13:55:19 +0000
Date: Tue, 15 Jun 2021 15:29:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YMirQoiYRYsDP7Sb@yuki>
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-3-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615074045.23974-3-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] API: Remove TST_ERR usage from
 rtnetlink/netdevice
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
> The test author is guaranteed that the library will not set TST_ERR
> except via the TEST macro and similar.
> 
> Currently the rtnetlink & netdevice API returns 0 on fail and 1 on
> success. Either TST_ERR or errno is used to store the error
> number. The commit stays with this scheme except that we only use
> errno. This means that we have to temporarily save errno when it would
> be overwritten by a less important operation.

I do not like this fix. If nothing else it's fragile and would make any
patch review for these libraries much harder.

I would prefer having these functions modified to return the errors
instead even if I have to do the work.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
