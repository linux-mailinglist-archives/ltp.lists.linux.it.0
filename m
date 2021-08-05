Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1F3E0E76
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 08:36:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78E2B3C7D7D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 08:36:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A8053C7D1F
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 08:36:12 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C9E731000EDD
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 08:36:11 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A92EC1FE2A;
 Thu,  5 Aug 2021 06:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628145370;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YeWRYtC1pAp406sshrIxjWW2z9eimEyBmtlkvKSduhc=;
 b=NKA5Y5KOMNOmCU+QU2E/OkPnMf8zARJh27s5vFSvfEMdsQlrNOGIBH/q6QLhAPrAT1eL39
 PXpdh67bgYUaxxcE2+QbXfHG+fwS2B3Y8cArlJu/xyAPc4ZhGSr09/CRi2sMIY8rbTa1Hk
 yv6k/A1jzhALfW8zwXNN2M25rAIhzfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628145370;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YeWRYtC1pAp406sshrIxjWW2z9eimEyBmtlkvKSduhc=;
 b=By6qObBFT5t7Czcu6QlRD+UcBNkg3HNpg5naqfaj34DcozrEFNtcvYvPGAGt5/MRcQ8zj+
 +mU+UTJzKxU73SDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8077813785;
 Thu,  5 Aug 2021 06:36:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +kAbHdqGC2FMKAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 05 Aug 2021 06:36:10 +0000
Date: Thu, 5 Aug 2021 08:36:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YQuG2CllvzVqdw8L@pevik>
References: <20210712075223.10682-2-aleksei.kodanev@bell-sw.com>
 <YPkkZ0Zq9DyHKBaT@pevik> <YPlhMeRRsNnemT05@yuki>
 <YPlsK8fsMI8T+H7c@pevik> <YPlsVD2gbIiX8JJk@yuki>
 <60FA81E4.3060709@fujitsu.com> <YPq0749ZnnGsAV2q@pevik>
 <60FF9EFA.308@fujitsu.com> <YQqor4LiNK4/Xrbe@yuki>
 <610B5E7D.1070104@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <610B5E7D.1070104@fujitsu.com>
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> >> -	if (used_queues<  0) {
> >> -		tst_brk(TBROK, "can't read /proc/sysvipc/msg to get "
> >> -			"used message queues at %s:%d", file, lineno);
> >> +	if (used_cnt<  0) {
> >> +		tst_brk(TBROK, "can't read %s to get used message queues "
> >> +			"at %s:%d", sysvipc_file, file, lineno);
> >>   	}
> I also modify this info.
> message queues => sysvipc resource total
+1. nit: I'd also move "at" at the previous line (better for grep).

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
