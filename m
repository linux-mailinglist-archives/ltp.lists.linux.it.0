Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 138263B15F8
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 10:36:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27F313C6FF2
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 10:36:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1D8603C2E72
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:35:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A81FB1001121
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:35:55 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0136821971;
 Wed, 23 Jun 2021 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624437355;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BwZAUmSirJlcZ9AyGMWzSevwR/PbnQwOgjn1QwKwJN0=;
 b=BZSXKhZZHClhdUwerkqhpof+u5f2+0BlJi/0rFwmlGSqVOQ0Gg3VQi2063L2eoZkRABIEK
 B0YsqpuqRe+1rZZKuUPXNatE0ocstVe+Zl8/VAZ34l2I1vVlumU74NCdgAAgzcu5n3ynAw
 yKPwnxFEGZQ7Xfu0Yh1ulf9dxobduMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624437355;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BwZAUmSirJlcZ9AyGMWzSevwR/PbnQwOgjn1QwKwJN0=;
 b=3xNe0/FX+2L/ygDzKtJj5sQWCDwrMw5JhvVgKmdnrcPwSqalhuE8r5pnVCMqQc3uRyESF/
 nOPwv0jU8MUzYWAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C8E4D11A97;
 Wed, 23 Jun 2021 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624437354;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BwZAUmSirJlcZ9AyGMWzSevwR/PbnQwOgjn1QwKwJN0=;
 b=bv3XxvVB7JB/ui06r5bfDLfWK/RXBTmXtNJVE4JDySMCdH5jp7ogwKZCnj09wIadEVoLaf
 CMshswg2ALwCkBm0qJpN61H6he0KgicnGh/2r9aEZDjxdaJjegJsMrEpjZddT49hL0+LZQ
 LUf6fF/TB+Umxq0eiyUH/pXbILGCPzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624437354;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BwZAUmSirJlcZ9AyGMWzSevwR/PbnQwOgjn1QwKwJN0=;
 b=V6kEejyx6LMdtcLm5+L9Ndqem7LkTQIzuv8mnWCOOj6nHkNJS8guTnAGWtYNSzDa6YpaVh
 tGR5NENkJxx6q/Cg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 9iLGLmry0mDSIQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 08:35:54 +0000
Date: Wed, 23 Jun 2021 10:35:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YNLyaTX6HWIUbD6K@pevik>
References: <20210623062456.430406-1-liwang@redhat.com>
 <20210623062456.430406-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623062456.430406-2-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] oom: enable lite == 1 for memory.swap.max
 testing
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

Hi Li,

> oom03: adding print info and restore memory.swap.max after testing
> oom05: enable lite == 1 for memory.swap.max testing
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
