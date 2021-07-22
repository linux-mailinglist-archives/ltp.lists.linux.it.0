Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D80143D2492
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 15:27:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47A283C8191
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 15:27:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 88B663C5A4C
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 15:27:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BA4B21001122
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 15:27:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EEDF622550;
 Thu, 22 Jul 2021 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626960458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vTJPIwNutNEI2dAWhJk75W6mopripL4MHgMQPInpd5A=;
 b=FP9nCPeJazm4DKlubqZsXmCQs00t+JwSKIbYCOAq5AAEaw2PjQ3PlFpFfwSHHVg068gzps
 /F+w8506ddrOqujoU4bhbPr1KNvYdxLwDastDQmrt5O8hreblIG1JiRhhKCuHblf/WWXBZ
 vjXXYIGwLDTpO9kCswjaSrXHgb+TQmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626960458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vTJPIwNutNEI2dAWhJk75W6mopripL4MHgMQPInpd5A=;
 b=1LFgG/LtmSuDkoYEec2z4afBBdPwpr/0laceLFpQ05FhbEcNIZeddXcpXkPYEZR3b6Cv7V
 JJ2GxQBGBuGh/TCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4C8613DD0;
 Thu, 22 Jul 2021 13:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xgOBM0py+WBMRwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 22 Jul 2021 13:27:38 +0000
Date: Thu, 22 Jul 2021 15:02:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YPlsVD2gbIiX8JJk@yuki>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <20210712075223.10682-2-aleksei.kodanev@bell-sw.com>
 <YPkkZ0Zq9DyHKBaT@pevik> <YPlhMeRRsNnemT05@yuki>
 <YPlsK8fsMI8T+H7c@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPlsK8fsMI8T+H7c@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
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
> > I think that we allready discussed this in another thread:
> 
> > https://lists.linux.it/pipermail/ltp/2021-July/023831.html
> 
> Thanks, I forgot this. In that case my approach (not using <=, but count
> segments in /proc/sysvipc/shm before testing) might be more precise.
> But no strong feeling about that, both solutions fix the test, let's chose one
> and merge.

As I said previously, there are many SysV IPC tests that do expect that
nobody will add/remove IPC shm/queue/semaphores during the testrun and
some of the testcases cannot even be implemented without this
expectation.

Hence I wouldn't complicate the test here and just count how many
segments are there at the start and be done with it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
