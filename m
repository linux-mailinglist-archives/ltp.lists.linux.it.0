Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBBE3B6577
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 17:28:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2EF63C6E46
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 17:28:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D81343C03AB
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 17:28:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 658F7140021C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 17:28:30 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB64C22490;
 Mon, 28 Jun 2021 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624894109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUhW58NZflAgdSiKIdRsqt5sALYnsRr5rZWvadAc33g=;
 b=Nl20fjvihkwNvfggoUvp2adiC9RRGUwqOd9a2Af6K7/F7LVilSatIxxpuLPNMUi6r+rWj0
 GQkz7zHG3z/4vcJVAosYVrnRILExWMdfikIG0DWw5kwoHnKFanX7PCCfqEfFt7a5ytDwQa
 rMp374rRUMwGlZTde4hg49z6lt4GKPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624894109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUhW58NZflAgdSiKIdRsqt5sALYnsRr5rZWvadAc33g=;
 b=JAHhAucJ9IOPOtQQxStaXwh47tJzKILqkfpDJFEejG1mIg2zOw5IONMb6HIp+qU2QZBcTP
 wpw5tff2VGJcoUDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id AF94011906;
 Mon, 28 Jun 2021 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624894109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUhW58NZflAgdSiKIdRsqt5sALYnsRr5rZWvadAc33g=;
 b=Nl20fjvihkwNvfggoUvp2adiC9RRGUwqOd9a2Af6K7/F7LVilSatIxxpuLPNMUi6r+rWj0
 GQkz7zHG3z/4vcJVAosYVrnRILExWMdfikIG0DWw5kwoHnKFanX7PCCfqEfFt7a5ytDwQa
 rMp374rRUMwGlZTde4hg49z6lt4GKPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624894109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUhW58NZflAgdSiKIdRsqt5sALYnsRr5rZWvadAc33g=;
 b=JAHhAucJ9IOPOtQQxStaXwh47tJzKILqkfpDJFEejG1mIg2zOw5IONMb6HIp+qU2QZBcTP
 wpw5tff2VGJcoUDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id zMyNKZ3q2WDjLQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 28 Jun 2021 15:28:29 +0000
Date: Mon, 28 Jun 2021 17:02:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YNnkoGkFbv1HftMs@yuki>
References: <YNM4rlDJLzb4xk6v@yuki>
 <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624512827-3256-2-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624512827-3256-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] include/tst_test_macro.h: Add
 TST_EXP_FAIL2 macros
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
> +[source,c]
> +-------------------------------------------------------------------------------
> +static void test(void)
> +{
> +	...
> +	TST_EXP_FAIL2(msgget(key, flags), EINVAL, "msgget(%i, %i)", key, flags);
> +	...
> +}
> +The 'TST_EXP_FAIL2()' is the same as 'TST_EXP_FAIL' the only difference is that
> +the return value is a non-negative integer if call passes.
> +

I've fixed this part, it was missing the end of the code block (the ----
at the end) and reworded the description a bit and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
