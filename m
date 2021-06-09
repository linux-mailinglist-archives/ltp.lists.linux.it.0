Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADD3A175A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:34:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 416A53C9050
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:34:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2061B3C4CB0
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:34:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 83B006009D4
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:34:52 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D25F21FD5E;
 Wed,  9 Jun 2021 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623249291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sOknoExWNH+LGSdZBdawkt3w6b0i/TOVMyGEYbtvp74=;
 b=zOQyMRe4NtYF7BnvvcITRRxr3AJ88yzSY8Hdkx89x+8WFnBdENsaBkIGnv9Nm8YvdmZKCI
 IFxAMhb+dSyloNmNQCazx9MQ2EpuuQ3YLPoNxTJTSkqo4Sqp/uMtumtRRK5zMB5dwJe67Y
 /yVUvXVeU2PTxFeesfOZ2o6OOjysivE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623249291;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sOknoExWNH+LGSdZBdawkt3w6b0i/TOVMyGEYbtvp74=;
 b=sWIDNCeFiDPpoO40edxOnfjPiEXadSLQE8FBTnQsDABwV3WUfT8gY7j3c/NyThhDN4ZENE
 AjLr4w+Y/t2rl8BA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B5B15118DD;
 Wed,  9 Jun 2021 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623249291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sOknoExWNH+LGSdZBdawkt3w6b0i/TOVMyGEYbtvp74=;
 b=zOQyMRe4NtYF7BnvvcITRRxr3AJ88yzSY8Hdkx89x+8WFnBdENsaBkIGnv9Nm8YvdmZKCI
 IFxAMhb+dSyloNmNQCazx9MQ2EpuuQ3YLPoNxTJTSkqo4Sqp/uMtumtRRK5zMB5dwJe67Y
 /yVUvXVeU2PTxFeesfOZ2o6OOjysivE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623249291;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sOknoExWNH+LGSdZBdawkt3w6b0i/TOVMyGEYbtvp74=;
 b=sWIDNCeFiDPpoO40edxOnfjPiEXadSLQE8FBTnQsDABwV3WUfT8gY7j3c/NyThhDN4ZENE
 AjLr4w+Y/t2rl8BA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id L58JK4vRwGBtUwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 14:34:51 +0000
Date: Wed, 9 Jun 2021 16:09:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Message-ID: <YMDLf5B+YvqQhuor@yuki>
References: <20210608132723.255996-1-cascardo@canonical.com>
 <YMB6aoVvTKJQ6wif@yuki> <YMCkB/iS54OJaby4@mussarela>
 <YMDEPYSWZG5FzUTi@yuki> <YMDOkVaCIWEA6Etl@mussarela>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMDOkVaCIWEA6Etl@mussarela>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_wake04: avoid tst_ts_from_ns overflow on
 32-bit platforms
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Yes, there are even uses where NSEC_PER_SEC is redefined.
> 
> I am fine with this other change. I had already tested that it fixes the
> problem just the same.
> 
> How about the commit below?

Looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
