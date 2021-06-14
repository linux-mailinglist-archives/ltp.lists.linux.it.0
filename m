Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 273D53A6983
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:03:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9E493C7222
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:03:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B28FA3C2E47
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:03:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4AADD1000A02
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:03:30 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A84811FD29;
 Mon, 14 Jun 2021 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623683009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WajOl8Qg73izsoBr6ppIpWga4WPbaqRuWPoqxdvf50E=;
 b=DoTWjEGzjhr1xunhxF05412o4looiKDF9U1O7+RGdDdN80rTNXFY/7NjWyVzrISNzfDH5U
 GazMdSU3FdTUYOO2fC1FaC7iSub+73ofs/308vFO8Hy+RDWf1Ee5tPYqlEI27JLYJHXgM3
 bg4bA52wCEt981Kfwlc9bz+vmSyrI30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623683009;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WajOl8Qg73izsoBr6ppIpWga4WPbaqRuWPoqxdvf50E=;
 b=LABGXf5afxb0cKQonpiUK6PBZNy6PxgAkxFdKnjwJWlSw5jjcT0l5CrFJgJ/4/Gy/VFfWa
 7VNQina03QlLJ5CA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7BF01118DD;
 Mon, 14 Jun 2021 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623683009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WajOl8Qg73izsoBr6ppIpWga4WPbaqRuWPoqxdvf50E=;
 b=DoTWjEGzjhr1xunhxF05412o4looiKDF9U1O7+RGdDdN80rTNXFY/7NjWyVzrISNzfDH5U
 GazMdSU3FdTUYOO2fC1FaC7iSub+73ofs/308vFO8Hy+RDWf1Ee5tPYqlEI27JLYJHXgM3
 bg4bA52wCEt981Kfwlc9bz+vmSyrI30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623683009;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WajOl8Qg73izsoBr6ppIpWga4WPbaqRuWPoqxdvf50E=;
 b=LABGXf5afxb0cKQonpiUK6PBZNy6PxgAkxFdKnjwJWlSw5jjcT0l5CrFJgJ/4/Gy/VFfWa
 7VNQina03QlLJ5CA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 76GqHMFvx2DJFwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 14 Jun 2021 15:03:29 +0000
Date: Mon, 14 Jun 2021 16:37:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMdpulBdM4FEtFm5@yuki>
References: <YMNqQE218QqnPiZY@yuki>
 <20210613171642.7773-1-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210613171642.7773-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] getrusage02: Skipped EFAULT tests for libc
 variant.
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Slightly adjusted and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
