Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 493B739B89B
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 14:00:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC3273C7FDA
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 14:00:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2050F3C27EC
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 14:00:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0A2381401232
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 14:00:08 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 538B41FD47;
 Fri,  4 Jun 2021 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622808008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lo3Wx4FShsveM15dgKfKuvbZ812m8bImv0CWn6QeqK8=;
 b=HlCc3QNCEhBALdURKLxWmBnYMsL8rOd2c+1AUt8N54V+TSIuq1YWkp7QbZZWsYzhyB0TaV
 DMqOHU1LeKxUlA82fF04erkBWLOcSXPQWYOOukvcSEumXGxrYJpGodGwupcV1kFthhqa7Y
 eebMZKHgjTc2qoqt54o8jwB/RMiVGWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622808008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lo3Wx4FShsveM15dgKfKuvbZ812m8bImv0CWn6QeqK8=;
 b=tv1dw0MmbvjoTZImV3DnU6st6uKh+R3nE6atWdzSEr/t5hR6IEcl7al6VyRzuKdv6aMPC2
 IV367t1keeLnhxAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 34517118DD;
 Fri,  4 Jun 2021 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622808008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lo3Wx4FShsveM15dgKfKuvbZ812m8bImv0CWn6QeqK8=;
 b=HlCc3QNCEhBALdURKLxWmBnYMsL8rOd2c+1AUt8N54V+TSIuq1YWkp7QbZZWsYzhyB0TaV
 DMqOHU1LeKxUlA82fF04erkBWLOcSXPQWYOOukvcSEumXGxrYJpGodGwupcV1kFthhqa7Y
 eebMZKHgjTc2qoqt54o8jwB/RMiVGWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622808008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lo3Wx4FShsveM15dgKfKuvbZ812m8bImv0CWn6QeqK8=;
 b=tv1dw0MmbvjoTZImV3DnU6st6uKh+R3nE6atWdzSEr/t5hR6IEcl7al6VyRzuKdv6aMPC2
 IV367t1keeLnhxAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id EtBWDMgVumCSMAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 04 Jun 2021 12:00:08 +0000
Date: Fri, 4 Jun 2021 13:34:19 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLoPu+To+U+x2md7@yuki>
References: <20210603154825.30165-1-rpalethorpe@suse.com>
 <YLnGIJWPf2XsAdTt@pevik> <875yyuj91v.fsf@suse.de>
 <YLnvOpNr3HlTLWWP@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLnvOpNr3HlTLWWP@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/2] Libclang based analyzer
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
> run-{c,shell}-api-tests is IMHO too long, but I was thinking about
> check-{,c,shell}-api. But maybe you're right, let's wait for others opinions.

I would vote for tests to be executed by 'make test' and the checks that
Ritchie implements should be started by 'make check'.

Even the kernel script is called checkpatch.pl so this would be
consistent with the terms used in Linux kernel.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
