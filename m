Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 701AE404858
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 12:21:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFDD73C8D91
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Sep 2021 12:21:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 856CA3C21F5
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 12:21:34 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7A992601113
 for <ltp@lists.linux.it>; Thu,  9 Sep 2021 12:21:33 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E77AB22315;
 Thu,  9 Sep 2021 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631182891;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jbKYM6x+qsFVIavbQ+MBBXPA5G0dkvqpUIlnORQwfQQ=;
 b=VvHhccOmB7OhyjnHXqmnkpkOt05pEv/HkQRfnPpxiE4v00w6N9h0rAaJrK6hAUbL6PpOmf
 v6w72n12QM73HEQUlrsaevnjt9ffG/rJMEvhl/ENKVR3JnuPVLrzFI2Ltvok9Ou5ErQ5Q/
 M3uK4CbyrjArq/NNFobNh+lMcC8Hlbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631182891;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jbKYM6x+qsFVIavbQ+MBBXPA5G0dkvqpUIlnORQwfQQ=;
 b=aIGnyVdfdTxkWSr1xDYhZnMKXb9ON5EzZS1C9FMHwEap1vKHyxSOT43v2IP92VDYXUmqrN
 Sp+4EErZ9LOVd0CQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A74B013727;
 Thu,  9 Sep 2021 10:21:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id xID7JivgOWHWNwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 09 Sep 2021 10:21:31 +0000
Date: Thu, 9 Sep 2021 12:21:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YTngKohBcpQK7l5r@pevik>
References: <20210906083444.82394-1-naresh.kamboju@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210906083444.82394-1-naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] runtest/smoketest: Remove intermittent failed
 test case route4-change-dst
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

Hi Naresh,

> The test case route4-change-dst fails intermittently creating
> the problem for smoketest results verdict. route4-change-dst
> is a stress test should not be a part of smoketest. because of
> these issues removing route4-change-dst from the smoketest.
Could you please be more specific about the failure?

I'm not against adding ping tests into smoketest runtest file,
although just on might be enough. ping02.sh is the fastest from all 3 tests,
maybe add it. Also -6 for IPv6 would be good (to detect problems with IPv6 setup).


But route-change-dst.sh is quick (actually 2 times faster than ping01) that it's
not really a stress test in the default configuration, thus I'd prefer to keep it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
