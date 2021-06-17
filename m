Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFD3AB33B
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 14:04:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 652963C7184
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 14:04:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD3A23C2DCB
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 14:04:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1C9C0200AEA
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 14:04:33 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8EA181FDD7;
 Thu, 17 Jun 2021 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623931473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nbUSafhh4qaW8Eyec4FhozmWeE5XunO+MJhdBepH13A=;
 b=HPqUGX5TX+S9gGyhIAMn1M9ZrrLvIuEz0AgPiIpTq1qsM7OXRYR2gFHjKiZXDnTzfklTWe
 NtfD/lkAkeIFmkWbneYfHSHcYV8WbfmsqbCeWpbB+F3oYOoV0yuT77WUUh6BUiOfryAcw3
 KR7lKmOv2uwE/FRB2Y7ePZOgDF0ANLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623931473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nbUSafhh4qaW8Eyec4FhozmWeE5XunO+MJhdBepH13A=;
 b=yZ0P+kHUgMaeySFTfkCpGPeF4s+UTc3DumW/v6lE/AlOR4i9D5Tg/axpF/y5HwO9NaNYB9
 AIGbhes3RYsoInDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 76029118DD;
 Thu, 17 Jun 2021 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623931473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nbUSafhh4qaW8Eyec4FhozmWeE5XunO+MJhdBepH13A=;
 b=HPqUGX5TX+S9gGyhIAMn1M9ZrrLvIuEz0AgPiIpTq1qsM7OXRYR2gFHjKiZXDnTzfklTWe
 NtfD/lkAkeIFmkWbneYfHSHcYV8WbfmsqbCeWpbB+F3oYOoV0yuT77WUUh6BUiOfryAcw3
 KR7lKmOv2uwE/FRB2Y7ePZOgDF0ANLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623931473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nbUSafhh4qaW8Eyec4FhozmWeE5XunO+MJhdBepH13A=;
 b=yZ0P+kHUgMaeySFTfkCpGPeF4s+UTc3DumW/v6lE/AlOR4i9D5Tg/axpF/y5HwO9NaNYB9
 AIGbhes3RYsoInDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Wui5G1E6y2B8GAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 17 Jun 2021 12:04:33 +0000
Date: Thu, 17 Jun 2021 13:38:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMs0Tk5RJeuIJMcG@yuki>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
 <20210609173601.29352-10-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173601.29352-10-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 10/10] shmctl02 :Skipped EFAULT tests for libc
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
Adjusted a few whitespaces and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
