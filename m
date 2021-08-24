Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 908AA3F61D1
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 17:38:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB4C63C9DF4
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 17:38:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3089A3C185E
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 17:38:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A64661000A0E
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 17:38:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 00FCF20062;
 Tue, 24 Aug 2021 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629819529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vz3sPMXqPBbxQTRD9xhTm+90ezNtQbn9iQK+Zzx6Zhw=;
 b=Tj62rcxU1IdqAd7b8onczxuP3TUR9Da3lGhVnjIQTnHurfH+rJJ0zGA4yr86E/OHCY7A8v
 QYdDELN2b6EN89cepN595Pve51OMC5DR5btryJpD+zJuv/yLx0k6vBF1Nhvc/Z1BrJ/DJ0
 NY5aJu5qk5Dtomy+YX0Dpq7L8iYKBAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629819529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vz3sPMXqPBbxQTRD9xhTm+90ezNtQbn9iQK+Zzx6Zhw=;
 b=5MGjuOdVdx+GECMhdToCFAH5APIUjJ8gFoNDlF1UAfsUPY7O31ujkNOTBM0LAG9n4kWqk6
 YgigU4hRBPEkcIDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D246D13B1E;
 Tue, 24 Aug 2021 15:38:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XNhvMYgSJWHCHwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 24 Aug 2021 15:38:48 +0000
Date: Tue, 24 Aug 2021 17:38:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YSUSj8qaWPfMF1/w@yuki>
References: <20210817064924.127970-1-xieziyao@huawei.com>
 <20210817064924.127970-4-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817064924.127970-4-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] epoll_ctl: Add test for epoll_ctl03
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

> +static void run_all(void)
> +{
> +	unsigned int index, events_bitmap;
> +
> +	for (index = 0; index < WIDTH_EPOLL_EVENTS; index++) {
> +		events_bitmap = ((EPOLLIN * ((index & 0x01) >> 0)) |
> +				(EPOLLOUT * ((index & 0x02) >> 1)) |
> +				(EPOLLPRI * ((index & 0x04) >> 2)) |
> +				(EPOLLERR * ((index & 0x08) >> 3)) |
> +				(EPOLLHUP * ((index & 0x10) >> 4)) |
> +				(EPOLLET * ((index & 0x20) >> 5)) |
> +				(EPOLLONESHOT * ((index & 0x40) >> 6)) |
> +				(EPOLLRDHUP * ((index & 0x80) >> 7)));

I guess that we can as well add a IS_BIT_SET() macro that would do:

#define IS_BIT_SET(val, bit) (((val) & (1<<(bit))) >> (bit))

And use that here instead.

Otherwise it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
