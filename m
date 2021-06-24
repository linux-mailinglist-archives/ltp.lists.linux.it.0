Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AEF3B35CF
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 20:33:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 012BA3C8A49
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 20:33:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4BBA33C1E14
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 20:32:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BDD76200DE5
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 20:32:56 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1ECC91FDB4;
 Thu, 24 Jun 2021 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624559576;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HHIXIExiVFXt0tFhnl37A4mEEUlomWg819m4yQOTsAQ=;
 b=EZ7ESA5FvENZdmwpofuXCI/7HVU8HxRbxjOwCurZsJwwQ78d7rv1Qw0COxQ4shXBQYaBJ8
 rCuVNWnpw/x/YATGU5dThFQOM/mv4JUVwCnu8KSBTlbWtB0WGB7o/ZWffyE3w2OO/mkVx3
 pJ1rG6U4qfIj85VusCl5J26hg/r6c+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624559576;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HHIXIExiVFXt0tFhnl37A4mEEUlomWg819m4yQOTsAQ=;
 b=Vbt6aDnM0og5G9vAx7wUYVf5rlhR3Hg65c60UbmNrBZLyvgFti6GAH1d7FrtMB4FrQtl7+
 Qvtfg1/KmxO9k+Ag==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E61DA11A97;
 Thu, 24 Jun 2021 18:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624559576;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HHIXIExiVFXt0tFhnl37A4mEEUlomWg819m4yQOTsAQ=;
 b=EZ7ESA5FvENZdmwpofuXCI/7HVU8HxRbxjOwCurZsJwwQ78d7rv1Qw0COxQ4shXBQYaBJ8
 rCuVNWnpw/x/YATGU5dThFQOM/mv4JUVwCnu8KSBTlbWtB0WGB7o/ZWffyE3w2OO/mkVx3
 pJ1rG6U4qfIj85VusCl5J26hg/r6c+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624559576;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HHIXIExiVFXt0tFhnl37A4mEEUlomWg819m4yQOTsAQ=;
 b=Vbt6aDnM0og5G9vAx7wUYVf5rlhR3Hg65c60UbmNrBZLyvgFti6GAH1d7FrtMB4FrQtl7+
 Qvtfg1/KmxO9k+Ag==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yt11NtfP1GBEBAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 24 Jun 2021 18:32:55 +0000
Date: Thu, 24 Jun 2021 20:32:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: dongshijiang <dongshijiang@inspur.com>
Message-ID: <YNTP1iJAwrCXXbVw@pevik>
References: <20210617070806.174220-1-dongshijiang@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617070806.174220-1-dongshijiang@inspur.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fix rpc_suite/rpc:add check returned value
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

Hi dongshijiang,

> "Segmentation fault (core dumped)" due to the failure of svcfd_create during the rpc test, so you need to check the return value of the "svcfd_create" function
Merged (with removed useless (SVCXPRT *) cast and svcr = NULL; also added more
cleanup in additional commit.

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
