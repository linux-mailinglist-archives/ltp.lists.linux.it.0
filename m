Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4951568F0CF
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Feb 2023 15:28:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B4113CC149
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Feb 2023 15:28:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2010A3C2A67
 for <ltp@lists.linux.it>; Wed,  8 Feb 2023 15:28:47 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 315111400543
 for <ltp@lists.linux.it>; Wed,  8 Feb 2023 15:28:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F381F34254;
 Wed,  8 Feb 2023 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1675866526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R70PXsMbXi8NbABjQdfmHCideBPYnj5eezlq+0ltyT4=;
 b=gqB0ZqSZ0pA2zfdCB1iszyaNwCsmFuFalGAHUQryRAR+gER503as8xkBH09m989Kkqw5R6
 V90jmUm9jrN3kT1jX/hkr8UiAQCl9eTYnGu8hT9oEbzzcaSDPmeu6EyfMv3ffLYqDsxEPf
 ULmiRJzjDfU1tdUEogSEWap0cfZdnb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1675866526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R70PXsMbXi8NbABjQdfmHCideBPYnj5eezlq+0ltyT4=;
 b=GgaH+KOxewkKmo7EJ3kqVBKUbT3EJ8na02Rax8zJZ8MJJI83zPWymvZUfB8E6mKZwJm9z6
 0uMiPbeypnj3ksDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E00711358A;
 Wed,  8 Feb 2023 14:28:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id piRANZ2x42OHJQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 08 Feb 2023 14:28:45 +0000
Date: Wed, 8 Feb 2023 15:30:16 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Y+Ox+H1awhu+h2j+@yuki>
References: <20230208092327.28914-1-pvorel@suse.cz>
 <Y+NzkUcAyeupRwmP@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+NzkUcAyeupRwmP@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > This should not be needed any more for neither new API and legacy tests
> > since 04021637f4 ("tst_test.sh: Cleanup getopts usage")
> I suppose loading tst_net.sh was not needed even before. I wonder why this was
> ever needed.
> 
> It was added in 6538f7ab70 ("network: merge networktests.sh/networkstress.sh
> into network.sh") when testcases/lib/test_net.sh (predecessor of
> testcases/lib/tst_net.sh) was much simpler (e.g. without netns).

Actually it sems that it was just moved from the top of the file further
down in that commit. It was in the git since the beginning when the file
was added by Alexey. Maybe there were scripts that didn't include any
shell library at that time, who knows.

Anyways as long as all the network tests we have does include the
library themselves let's go ahead and get rid of it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
