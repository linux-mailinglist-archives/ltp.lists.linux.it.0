Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B4E39DED6
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 16:32:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 270ED3C7C9C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 16:32:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 649433C0B9A
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 16:32:54 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7844B1A000A3
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 16:32:53 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B537621A97;
 Mon,  7 Jun 2021 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623076372;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E24M6wgmh4Qkwqu2L9w/oftRhRyaz90DUOLuvt2I36c=;
 b=JjLA7g643g9Kidmt6K6bV7avW5jmVb7z8qWRPFkNKz4Ajs1Ha/LnGof/syVrmAdA8wziq+
 FXhoafXyprafZwLpTvkUmoqK+vmo6W5KFWSruTFc57OsCDssd8HaduvU2cFTVJUy/pDbdb
 PW3rvMdzgOsKeNzwQUYRmo9YdgnH1e4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623076372;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E24M6wgmh4Qkwqu2L9w/oftRhRyaz90DUOLuvt2I36c=;
 b=19sg2oT3oELkpRcR8T+eZpVVZsHT6rJZpH54Qoccd85pAzKk+iH+lKO+kWCFD3l0AI0JqY
 OIwW3tT3qz+aq/Ag==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 74580118DD;
 Mon,  7 Jun 2021 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623076372;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E24M6wgmh4Qkwqu2L9w/oftRhRyaz90DUOLuvt2I36c=;
 b=JjLA7g643g9Kidmt6K6bV7avW5jmVb7z8qWRPFkNKz4Ajs1Ha/LnGof/syVrmAdA8wziq+
 FXhoafXyprafZwLpTvkUmoqK+vmo6W5KFWSruTFc57OsCDssd8HaduvU2cFTVJUy/pDbdb
 PW3rvMdzgOsKeNzwQUYRmo9YdgnH1e4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623076372;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E24M6wgmh4Qkwqu2L9w/oftRhRyaz90DUOLuvt2I36c=;
 b=19sg2oT3oELkpRcR8T+eZpVVZsHT6rJZpH54Qoccd85pAzKk+iH+lKO+kWCFD3l0AI0JqY
 OIwW3tT3qz+aq/Ag==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id RXnYGRQuvmB+SQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 07 Jun 2021 14:32:52 +0000
Date: Mon, 7 Jun 2021 16:32:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YL4uEokhUu0gv/2h@pevik>
References: <20210506050047.935-1-zhaogongyi@huawei.com>
 <YJV4MtK/5NvpIXbU@pevik> <YL4fUslxI4IIG5Am@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL4fUslxI4IIG5Am@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4 v2] syscalls/fcntl: Replace TINFO with TPASS
 or TFAIL
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

Hi Zhao, Cyril,

> Hi!
> > not sure if change to use goto satisfied Cyril's requirement:

> > we should rather skip the test in the main instead
> > as it was done in the original code as:

> > 	if (NO_NFS)
> > 		run_test(...);
> > 	else
> > 		tst_resm(TCONF, "Skipping mandatory locking on NFS");

> Yes I still think that the code looks better if we skip the test in the
> main here.

+1. Replacing int return with goto err for no reason is ugly.
Zhao, would you please send v3 with this fixed?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
