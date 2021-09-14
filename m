Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0814640B3C5
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 17:52:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4603D3C927F
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 17:52:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 35D903C1D5D
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 17:52:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4FC22600F4E
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 17:52:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B4FD22149;
 Tue, 14 Sep 2021 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631634768;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5C7mP6vWfBz/4J3u0Y5ZHfk5EiQ/EUIv77QhhTTJDQ=;
 b=tVIIZTsIadzN7hpXtYx06we22ogCVxU81S0gHJYL4hH1AhClUonhf5q/YUFnlaSfQkxMvT
 6PyhVvUMaqu8cDu05vH4gE/3RwcjginlfU/G6hc7mnYjsMSVdIfoLxzaf6I2/6Te+Pp+o6
 mM3cDIA5iBGw735moER1A4bfyHKdN6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631634768;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5C7mP6vWfBz/4J3u0Y5ZHfk5EiQ/EUIv77QhhTTJDQ=;
 b=mXab0B5e/J9Eb+8h3TJDhauIKFcM6SpqO+oUYR5QENNKfdL+48ijdLrl/otH0SCTbmTFX7
 82hp6iS9y0eahTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26F6B13451;
 Tue, 14 Sep 2021 15:52:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 900oA1DFQGFaJQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 14 Sep 2021 15:52:48 +0000
Date: Tue, 14 Sep 2021 17:52:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YUDFTmk/0OaSLXq1@pevik>
References: <20210914122425.85129-1-naresh.kamboju@linaro.org>
 <YUCah4R0SBDKZvPQ@pevik>
 <e1873210-6d75-703d-f468-c4b826e20d54@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1873210-6d75-703d-f468-c4b826e20d54@bell-sw.com>
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

...
> > Did 75184c30a ("lib/tst_net.sh: disable ipv6_dad work on test interfaces")
> > fixed your problem? I'd actually like to route4-change-dst in smoketest to
> > have it as a detection DAD issue is working.

> 75184c30a is fixing ipv6. From the log, it seems the error happens
> in ping, when it once again tried to bind to 10.0.0.2 as a source
> address (with -I option)...

Ah, right, I'm sorry for overlooking this.
I squashed commits (reason to add ping tests is because we removed route test),
updated commit message and merged.

Thank you both!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
