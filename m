Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A5F68F195
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Feb 2023 16:04:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7830E3CC14F
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Feb 2023 16:04:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9D613CB0F6
 for <ltp@lists.linux.it>; Wed,  8 Feb 2023 16:04:48 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A7B9610007C0
 for <ltp@lists.linux.it>; Wed,  8 Feb 2023 16:04:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C455E34261;
 Wed,  8 Feb 2023 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1675868686;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l5kuFlT+sj7lsWsyiQPEFDLHnv5mv1s1fcExPVfFiko=;
 b=gi9xO8PmA2BzPJTbEAyOQG4XIq20bcs6OZpBKCYmU7OW3L8kWiOm1KC1Y3L7lIWAfyKieR
 vZ/fJzLev8Mn3Y8pigXUhTX0IluWyt+vDCcmYP+Y+p9iC0Nqk4aQtLLx/FW2Fy7byyJt2V
 XtqdXW6LYIrhUCqIWF+pOdH72c+kr9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1675868686;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l5kuFlT+sj7lsWsyiQPEFDLHnv5mv1s1fcExPVfFiko=;
 b=/5TfBqoodpLbe9za5gr9BNudUk1UZB9eRKGyIjPQfiYK7rgU0lHzaiLZM5p26SpyXFhWwk
 JKLgtsTGRpu4Y9Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF72213425;
 Wed,  8 Feb 2023 15:04:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id G0v3KQ6642NeNgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 08 Feb 2023 15:04:46 +0000
Date: Wed, 8 Feb 2023 16:04:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230208150445.GC1918@pevik>
References: <20230208092327.28914-1-pvorel@suse.cz> <Y+NzkUcAyeupRwmP@pevik>
 <Y+Ox+H1awhu+h2j+@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+Ox+H1awhu+h2j+@yuki>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] testscripts/network.sh: Don't load tst_net.sh
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

...
> > It was added in 6538f7ab70 ("network: merge networktests.sh/networkstress.sh
> > into network.sh") when testcases/lib/test_net.sh (predecessor of
> > testcases/lib/tst_net.sh) was much simpler (e.g. without netns).

> Actually it sems that it was just moved from the top of the file further
> down in that commit. It was in the git since the beginning when the file
Ah, you're right, it was added in 50c8ec324 ("network: uniform network parameters")

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
