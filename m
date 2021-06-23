Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920B3B198D
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 14:04:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D80353C6FD9
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 14:04:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B2E223C2298
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 14:04:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F7A9601151
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 14:04:05 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B57031FD67;
 Wed, 23 Jun 2021 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624449844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJ80CGpUxqa/pEn9cJavRcutiegHFmATcA8c9TtuM0k=;
 b=JkDRBYnlxBWs0qhlwE3/q5GUSFom0+hXS2p2J3CDITXyh9UKcB3LY0SgX6v8EMLdgBrbhL
 3AvXeArI9e+7GAYSyVrASHJTRvZPL6QH3TzHmDBSgpwzH0LTsGq6DpI4Pt/HXV4GFv/y22
 lUsS7NMr5p1vd94+ndWNoG9Ys6qu5Mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624449844;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJ80CGpUxqa/pEn9cJavRcutiegHFmATcA8c9TtuM0k=;
 b=7WyrIa/mKhIlINOj3dvqMFpZHJhKGoxQ/PxMvGxZZgQYb24kOOf/Pzr9OlorFWlSUJW0ZQ
 pEswSCgO73PdD3Aw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 97D2211A97;
 Wed, 23 Jun 2021 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624449844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJ80CGpUxqa/pEn9cJavRcutiegHFmATcA8c9TtuM0k=;
 b=JkDRBYnlxBWs0qhlwE3/q5GUSFom0+hXS2p2J3CDITXyh9UKcB3LY0SgX6v8EMLdgBrbhL
 3AvXeArI9e+7GAYSyVrASHJTRvZPL6QH3TzHmDBSgpwzH0LTsGq6DpI4Pt/HXV4GFv/y22
 lUsS7NMr5p1vd94+ndWNoG9Ys6qu5Mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624449844;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJ80CGpUxqa/pEn9cJavRcutiegHFmATcA8c9TtuM0k=;
 b=7WyrIa/mKhIlINOj3dvqMFpZHJhKGoxQ/PxMvGxZZgQYb24kOOf/Pzr9OlorFWlSUJW0ZQ
 pEswSCgO73PdD3Aw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OCG6IzQj02DGDwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 23 Jun 2021 12:04:04 +0000
Date: Wed, 23 Jun 2021 13:38:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNMdNqGiGXOgby6v@yuki>
References: <20210623080157.26424-1-krzysztof.kozlowski@canonical.com>
 <2a08d5c4-c002-7284-03d1-ff4441f8c9c5@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a08d5c4-c002-7284-03d1-ff4441f8c9c5@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] device-drivers/cpufreq_boost: skip test on
 virtual machines
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
> > diff --git a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> > index b9739db37cb7..67917b3fea25 100644
> > --- a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> > +++ b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
> > @@ -90,6 +90,9 @@ static void setup(void)
> >  	unsigned int i;
> >  	tst_require_root();
> >  
> > +	if (tst_is_virt(VIRT_ANY))
> > +		tst_brkm(TCONF, NULL, "running in a virtual machine, overclock not reliably measureable");
> > +
> >  	for (i = 0; i < ARRAY_SIZE(cdrv); ++i) {
> >  		fd = open(cdrv[i].file, O_RDWR);
> >  		if (fd == -1)
> > 
> 
> Optionally, under virtual machine the test failure could be converted to
> accepted pass. This would still allow to test CPUfreq boosting
> interface. Any preferences?

I wonder what is the likehood of actually dicovering a bug by writing to
the cpufreq boost file from within a VM, I guess that it's non-zero at
least.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
