Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0513A9A15
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 14:21:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B6B73C71C3
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 14:21:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 923A03C2DD7
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 14:21:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D7859140115F
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 14:21:53 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 578D01FD84;
 Wed, 16 Jun 2021 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623846113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5LnyZirqYtenVdXJYYAeppfJsIPPu6hFDfQQnep2BE=;
 b=gQKe8BPqLbAHq2JgwQurrS+7GJrJPh9gc2njsyzioTtLmq8XH9FOgbAzJvB3udHE4HXvV+
 mOUw1LI79l7abrPqUMK7piuVdPCas/fbkU6vp6HTbC0anegvtGEXpPL787duu5VdEgYcfa
 pL+MNq+7k/bIhRWYUF8wDBsEy5BAUTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623846113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5LnyZirqYtenVdXJYYAeppfJsIPPu6hFDfQQnep2BE=;
 b=4JiFt5DTpoM+Ffieq44A/lskTWKGvgvT7Ug8y63ql+AXd8I0vgZ7Ytlloyz1naqd6sK6IA
 gznOAFhpb4lnMBAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 38B66118DD;
 Wed, 16 Jun 2021 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623846113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5LnyZirqYtenVdXJYYAeppfJsIPPu6hFDfQQnep2BE=;
 b=gQKe8BPqLbAHq2JgwQurrS+7GJrJPh9gc2njsyzioTtLmq8XH9FOgbAzJvB3udHE4HXvV+
 mOUw1LI79l7abrPqUMK7piuVdPCas/fbkU6vp6HTbC0anegvtGEXpPL787duu5VdEgYcfa
 pL+MNq+7k/bIhRWYUF8wDBsEy5BAUTg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623846113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J5LnyZirqYtenVdXJYYAeppfJsIPPu6hFDfQQnep2BE=;
 b=4JiFt5DTpoM+Ffieq44A/lskTWKGvgvT7Ug8y63ql+AXd8I0vgZ7Ytlloyz1naqd6sK6IA
 gznOAFhpb4lnMBAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id b4YsDOHsyWCWEAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 16 Jun 2021 12:21:53 +0000
Date: Wed, 16 Jun 2021 13:56:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMnm3OaNEvej40JX@yuki>
References: <20210616093606.214856-1-xieziyao@huawei.com>
 <20210616093606.214856-4-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210616093606.214856-4-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/getrusage: Convert getrusage01 to
 the new API
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
Pushed with two changes, thanks.

* Changed the SPDX to GPL-2.0 since the original license was 2.0 only

* Changed the rusage buffer to guarded buffer

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
