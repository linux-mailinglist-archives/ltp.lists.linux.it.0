Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6753F8B08
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 17:29:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 797593C2F29
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 17:29:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8AC303C2E47
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 17:29:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A1BB26006C4
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 17:29:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E042A201B4;
 Thu, 26 Aug 2021 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629991747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JmDWX+5zNCy0b9vK2zHwqU/33lNjLLF4HUc1iIQpSyI=;
 b=SAISebPhAhCa6xcFJIv8DwHAsqnyjFm/FRN6lPm4fnGaDxoYci6GGqjw4LogvdTxeUuZ4t
 KdJQsEhkSJbpoZm9hsSR/GStKXUOEfvQ8kiHfSFpc8vIWjaZMuzZDff26RYuji+dR61eF5
 vPcWl2HslmL/J/+43jPxSQB5fnLKpng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629991747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JmDWX+5zNCy0b9vK2zHwqU/33lNjLLF4HUc1iIQpSyI=;
 b=/mDzZ/Ygm/+FS1ldphsHugVhoNGJxpnCA3yUIYs8fsf1SaPgZA2vw5ANspyBqo1b77Zyk5
 gFTvr9ed9xAYmbDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C62A613C6F;
 Thu, 26 Aug 2021 15:29:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lV1SMEOzJ2G5CQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 26 Aug 2021 15:29:07 +0000
Date: Thu, 26 Aug 2021 17:29:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <ziyaoxie@outlook.com>
Message-ID: <YSezTHKUL9fgKn6a@yuki>
References: <20210825153932.138396-1-ziyaoxie@outlook.com>
 <OSZP286MB0871E8F61CE0773AF89CF35FCCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSZP286MB0871E8F61CE0773AF89CF35FCCC69@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4 v2] api: Add a IS_BIT_SET() macro in
 tst_bitmap.h
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
> Add a IS_BIT_SET() macro in tst_bitmap.h to check whether the n-th bit
> of val is set.

Since this has been put into the test library I've changed this to
TST_IS_BIT_SET() and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
