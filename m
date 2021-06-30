Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB27F3B857B
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 16:53:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 798B23C9389
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 16:53:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 353803C180B
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 16:53:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A1999600281
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 16:53:24 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D37D622156;
 Wed, 30 Jun 2021 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625064803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCunCDUtWgybBXy07s9F3FFceEJlxa5O397Vhss6kVg=;
 b=Fq45seEO8vh4oUaUQ/Hq5hICMCl6RoL9rsqcH6PnPDu1W56cHMicTHK4Ud1faaO2J/5AM/
 RgqkTlOjyIbAVQo+2Aww5BrWNR7pjGRxxgiJHVzajZoFxbzU2lEuJhfB9iSN9ojw28HAw/
 2hvs4IdBKZfmTitCBhUnbRLKY33VK6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625064803;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCunCDUtWgybBXy07s9F3FFceEJlxa5O397Vhss6kVg=;
 b=oxKPt5F3kFvVyQDXweKbkvT91+/kiQQQpBPfsVlTYGI+cmOU3qNTIhU9MqVz9OW+SVy9xT
 P6Oemml9wu+tcgAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B6B21118DD;
 Wed, 30 Jun 2021 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625064803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCunCDUtWgybBXy07s9F3FFceEJlxa5O397Vhss6kVg=;
 b=Fq45seEO8vh4oUaUQ/Hq5hICMCl6RoL9rsqcH6PnPDu1W56cHMicTHK4Ud1faaO2J/5AM/
 RgqkTlOjyIbAVQo+2Aww5BrWNR7pjGRxxgiJHVzajZoFxbzU2lEuJhfB9iSN9ojw28HAw/
 2hvs4IdBKZfmTitCBhUnbRLKY33VK6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625064803;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCunCDUtWgybBXy07s9F3FFceEJlxa5O397Vhss6kVg=;
 b=oxKPt5F3kFvVyQDXweKbkvT91+/kiQQQpBPfsVlTYGI+cmOU3qNTIhU9MqVz9OW+SVy9xT
 P6Oemml9wu+tcgAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id VjxrK2OF3GCEKwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 30 Jun 2021 14:53:23 +0000
Date: Wed, 30 Jun 2021 16:27:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YNx/ZvzdI9AifBHK@yuki>
References: <YNHCQ8qWSBdHIAra@yuki>
 <1624963486-6614-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624963486-6614-2-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624963486-6614-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/ipc: Make use of TST_EXP_FAIL or
 TST_EXP_FAIL2 macro
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
> +	TST_EXP_FAIL(msgget(*tc->key, tc->flags), tc->exp_err, "msgget(%i, %i)",
> +		*tc->key, tc->flags);
>  }

I've changed this one to TST_EXP_FAIL2() since msgget() returns
non-negative integer on success and pushed the patchset, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
