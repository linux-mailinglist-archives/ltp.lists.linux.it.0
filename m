Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 070CA3D2417
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 15:01:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7D823C6981
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 15:01:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC2FD3C1F4E
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 15:01:34 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 79D0E601641
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 15:01:34 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A8E202260F;
 Thu, 22 Jul 2021 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626958893;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=daikuhlMNP2sVLhbTOSUB84QVxmG2Jbk3MmoOTvFFqE=;
 b=Wc+zXz2moYaBCnuIdh4bAoLA7I2UwgCfZHhkQ5gSuoMV9rlcR910gv8V0l2dhf3u6snSdG
 +ZwM0GDBUap4BEjYzDNfo0bTRInxMIy1sMBfQDcG3Wrm+GxCfQfpb6iyZMBhPEquhyGbGF
 /v+HrvzCXSzHRrJcQc0GX9ydnP2o6fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626958893;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=daikuhlMNP2sVLhbTOSUB84QVxmG2Jbk3MmoOTvFFqE=;
 b=TP7e9m8QGvz3wQCMcsxdIrUry+R3AlwB31fSG2JFAaKm16UHsRKPffLvZ737Mxt8oBnyIe
 5FlE0KubqnBNZoCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 56531139A1;
 Thu, 22 Jul 2021 13:01:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id BLWsES1s+WAHcQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 22 Jul 2021 13:01:33 +0000
Date: Thu, 22 Jul 2021 15:01:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YPlsK8fsMI8T+H7c@pevik>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <20210712075223.10682-2-aleksei.kodanev@bell-sw.com>
 <YPkkZ0Zq9DyHKBaT@pevik> <YPlhMeRRsNnemT05@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPlhMeRRsNnemT05@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > In different patch [1] (I forget you already send patches to fix this) I counted
> > items in /proc/sysvipc/shm. Not sure what is safer: <= looks a bit drastic
> > (how about bug which reports ENOSPC much earlier than it should be?), but
> > obviously new mapping from other program created in the middle of testing.

> I think that we allready discussed this in another thread:

> https://lists.linux.it/pipermail/ltp/2021-July/023831.html

Thanks, I forgot this. In that case my approach (not using <=, but count
segments in /proc/sysvipc/shm before testing) might be more precise.
But no strong feeling about that, both solutions fix the test, let's chose one
and merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
