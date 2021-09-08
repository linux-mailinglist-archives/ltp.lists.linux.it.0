Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E426403A33
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 15:03:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54DC03C91AC
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Sep 2021 15:03:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D75213C2317
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 15:03:38 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2AD17200DC2
 for <ltp@lists.linux.it>; Wed,  8 Sep 2021 15:03:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 372392014D;
 Wed,  8 Sep 2021 13:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631106216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CRHIt/3uWwmQ2FgWQuBnfWKFe0bPgCWABDkBm1fUF5c=;
 b=vkyyewTJh/OOtgZPK3AThaRzJm1B+PDxPLUDcECysWo9mEHWgbd2IUttHQ7Xqi9koMUiVP
 bbWwY1dFsD+FoopOvcJJOdIPNSP0uORv9wdAIf1fX7bPyzUsFQKKjjuMFhG6oIonzfI57s
 tHf/xMBzIcslClgGxp007hRnOj7p76M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631106216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CRHIt/3uWwmQ2FgWQuBnfWKFe0bPgCWABDkBm1fUF5c=;
 b=tSBjFaGftyo8mDnrUiKVcV1FD+M/ztjLcRHcgcHQ61OtunBuUfHxOh32KxKjGYU9h4vun5
 sDkaXmzS28PtjQDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1A5BE13CE2;
 Wed,  8 Sep 2021 13:03:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hSuLBai0OGFAeAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 08 Sep 2021 13:03:36 +0000
Date: Wed, 8 Sep 2021 15:03:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YTi0tWLUaTOTeRcB@yuki>
References: <20210623080157.26424-1-krzysztof.kozlowski@canonical.com>
 <2a08d5c4-c002-7284-03d1-ff4441f8c9c5@canonical.com>
 <YNMdNqGiGXOgby6v@yuki>
 <aaf8acb9-f28f-b550-ccbc-8feb5aad17b0@canonical.com>
 <34c93a03-ca56-1648-5db0-4f15d617b4d9@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34c93a03-ca56-1648-5db0-4f15d617b4d9@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
> Hi Cyril and all,
> 
> Anything stops this patch from being applied?

Thanks for the reminded, pushed.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
