Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DBE3B841F
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 15:50:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76DE83C8D04
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 15:50:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3ECBB3C6C4A
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 15:49:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DA4EF1000DF9
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 15:49:58 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A72821FDB;
 Wed, 30 Jun 2021 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625060998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDK4GbaLwvHrpUyjK5a1l5KNqIstH5nqIOVxVQjaBM0=;
 b=Ro9WFPnZhz5I6matbGwQf7ozSTZKDKRPrgVe4kaiiNCjMp9dtyKuUWtZ8ZRw6dm5AQ3bBS
 C6t2rDtiokQjaUAJanDjqB2EmPpUGMjp0H5yeO7FqO+K2cWhs09OUi5Vz2dLDsMRRXzNC3
 8mLbWcjHnOyC3S+2LVDV+OMgV/EVTyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625060998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDK4GbaLwvHrpUyjK5a1l5KNqIstH5nqIOVxVQjaBM0=;
 b=hRV3AD6SoXHj02vfdb94mqt7OLpF5FNufeWYF1Wm8leKWUB4O7cmTBDT+Sbjh7XS46OThh
 a37OObEax6W+xwAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3CCFB118DD;
 Wed, 30 Jun 2021 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625060998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDK4GbaLwvHrpUyjK5a1l5KNqIstH5nqIOVxVQjaBM0=;
 b=Ro9WFPnZhz5I6matbGwQf7ozSTZKDKRPrgVe4kaiiNCjMp9dtyKuUWtZ8ZRw6dm5AQ3bBS
 C6t2rDtiokQjaUAJanDjqB2EmPpUGMjp0H5yeO7FqO+K2cWhs09OUi5Vz2dLDsMRRXzNC3
 8mLbWcjHnOyC3S+2LVDV+OMgV/EVTyk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625060998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CDK4GbaLwvHrpUyjK5a1l5KNqIstH5nqIOVxVQjaBM0=;
 b=hRV3AD6SoXHj02vfdb94mqt7OLpF5FNufeWYF1Wm8leKWUB4O7cmTBDT+Sbjh7XS46OThh
 a37OObEax6W+xwAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id rj9zDIZ23GAjAgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 30 Jun 2021 13:49:58 +0000
Date: Wed, 30 Jun 2021 15:24:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YNxwiTvI6AcqoLq0@yuki>
References: <YNHCQ8qWSBdHIAra@yuki>
 <1624963486-6614-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <60DB0121.9000404@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60DB0121.9000404@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls: Use more accurate TST_EXP_FAIL2
 macro
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> When I do this patch, I found a tst_res usage problem in sendfile06.c.
> 
> see https://github.com/linux-test-project/ltp/runs/2933366481#step:10:3797

Someone has put comma between % and the PRId64 which is obviously wrong.

Fixed in: 0880bf5aa757 (syscalls/sendfile06: Fix format string)

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
