Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47A5A9C92
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Sep 2022 18:07:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCB3E3CA8BF
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Sep 2022 18:07:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 858B13CA744
 for <ltp@lists.linux.it>; Thu,  1 Sep 2022 18:07:54 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DE87F60118C
 for <ltp@lists.linux.it>; Thu,  1 Sep 2022 18:07:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 404BA22B2B;
 Thu,  1 Sep 2022 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662048471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00/yhQrJi0xJEvgmDhp9TvLqPrbyyitNmom8rHGSz/Y=;
 b=GD8xNlDCTwYngDVc1hgVm4q5I6NHtLi5lpb2LO4J8aAhCyCSPj7TzBfG9EqjPhKLqGoKYd
 b6CtVg7jk8CFR0yBM1OhwArZ7pfSJHcVsfIaaIW4TUgpQXFVUNdyYttufRm/lwpKXfT1CE
 lX1YQOwq0+sU+hme2vToJ1VFedBms2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662048471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00/yhQrJi0xJEvgmDhp9TvLqPrbyyitNmom8rHGSz/Y=;
 b=LHZTBQHLqPpLy4aNAPMqSzIx0+njkrhGW2/oMCR3E9plOG3X1OPZ51oCt/JlZCZVqMRKo9
 nWVeooBM9LgsLzBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30EFE13A89;
 Thu,  1 Sep 2022 16:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d0mDN9XYEGP8CwAAMHmgww
 (envelope-from <akumar@suse.de>); Thu, 01 Sep 2022 16:07:49 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 01 Sep 2022 21:37:47 +0530
Message-ID: <8989849.CDJkKcVGEf@localhost>
Organization: SUSE
In-Reply-To: <YxBSF1ZgU5wSlpi+@pevik>
References: <20220714060722.18894-1-akumar@suse.de> <YxBSF1ZgU5wSlpi+@pevik>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open04.c: convert to new LTP API
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

Hi Petr,

On Thursday, September 1, 2022 12:02:55 PM IST Petr Vorel wrote:
> Hi Avinesh,
> 
> I suggest to merge with these fixes:
> 
> * added free (if needed - that was in the original source)
> * fixed cleanup (don't run SAFE_CLOSE() if previous SAFE_OPEN() or SAFE_MALLOC()
>   failed)
> * use TST_EXP_FAIL() - the same result as TST_EXP_FAIL2() with shorter code
TST_EXP_FAIL2() is correct here as you mentioned in previous reply.
> * allocate memory needed (it's actually -2)
fds_limit(1024) - first(3) is correct as we need to allocate memory for1021 int fds.
Test executes fine even with (fds_limit - first - 2) probably because malloc allocating
more than requested memory.

> * #define FNAME "open04"
> 
> If it's ok, I'll merge it.
please go ahead and merge with rest of the suggestions, or let me know if I should
sent v2.


Thanks,
Avinesh



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
