Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 418633AB3D7
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 14:41:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90C9D3C88E7
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 14:41:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 339E13C2E32
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 14:41:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5EB26600F5C
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 14:41:25 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C02461FDCE;
 Thu, 17 Jun 2021 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623933684;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXVUZZTr/m07SB+7HXOxaVCGzRjmPk+x7Z4WoTOOSwU=;
 b=uASKoZ0wJ8vf9Xxgmj1NmFuFFtR1mnrt+CrKshRDnypSihaZ4+rQgZqyynnFQhN0HphrGw
 rF8tYYOFmsg2qbr+3shL2XNhtlpqMo9XtUqBO9mwgiZrztrnOpeCZ1KLWYxvCUCt11VTnE
 G5ycMk3f3akQfhtYT4fB9MBuxzjbsXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623933684;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXVUZZTr/m07SB+7HXOxaVCGzRjmPk+x7Z4WoTOOSwU=;
 b=ToUdIemA4zwvP24cM2E7RaGz07v9t20DUnzfBktreWHL3FFF4IX0GbbrzfnqZSemsXwnbR
 /xdviQGSef633MDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 92BA9118DD;
 Thu, 17 Jun 2021 12:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623933684;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXVUZZTr/m07SB+7HXOxaVCGzRjmPk+x7Z4WoTOOSwU=;
 b=uASKoZ0wJ8vf9Xxgmj1NmFuFFtR1mnrt+CrKshRDnypSihaZ4+rQgZqyynnFQhN0HphrGw
 rF8tYYOFmsg2qbr+3shL2XNhtlpqMo9XtUqBO9mwgiZrztrnOpeCZ1KLWYxvCUCt11VTnE
 G5ycMk3f3akQfhtYT4fB9MBuxzjbsXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623933684;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXVUZZTr/m07SB+7HXOxaVCGzRjmPk+x7Z4WoTOOSwU=;
 b=ToUdIemA4zwvP24cM2E7RaGz07v9t20DUnzfBktreWHL3FFF4IX0GbbrzfnqZSemsXwnbR
 /xdviQGSef633MDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id opOkIvRCy2DiKwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 17 Jun 2021 12:41:24 +0000
Date: Thu, 17 Jun 2021 14:41:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMtC8usB3gZsN8cd@pevik>
References: <20210616081856.3026223-1-lkml@jv-coder.de>
 <YMrbQPcfS9xFOBpO@pevik>
 <38b6582d-fdfa-b661-27f9-bdcd2962b96b@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38b6582d-fdfa-b661-27f9-bdcd2962b96b@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] ssh-stress: Convert to new api
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi Petr,

> On 6/17/2021 7:18 AM, Petr Vorel wrote:
> > Hi Joerg, Alexey,

> > merged! Thanks both for your time.
> thanks, but you should have removed my "changes in v3" from the commit
> message :)
Oh yes, although I usually check commit message, I haven't noticed.

> Was I supposed to place stuff like that somewhere else in the mail, to
> prevent it from being merged?

Anything after first '---' in git format-patch output won't be included in
commit message imported by git am. example: [1]

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210512100746.5907-1-pvorel@suse.cz/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
