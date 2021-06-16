Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 119BE3A9962
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:38:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 644163C71C2
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:38:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D91E63C3086
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:38:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8384C600D61
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:38:49 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA3BF21A24;
 Wed, 16 Jun 2021 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623843528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y35bviPbkkOjmm93D3gK12lwacNPvt0LeKgyI0dNVUI=;
 b=u32aaMypTxfVGHDqzYCyOnUN0ryCthwaAj0L04eiDNvOqTLwMfjqxiAhA3vH20Q33O05Lr
 GsdOIFDYkTu3FhoJ6/ve7LCvEwL+6CbrlD9e/YDBCDylBVssAdJVyrExMye8z8ube1oAuh
 JV02ICODfOqKPy+Q65Pin4rLHvzoCWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623843528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y35bviPbkkOjmm93D3gK12lwacNPvt0LeKgyI0dNVUI=;
 b=drj7saS3wpC6YauCAZldkMZP4R2ifWn5hJmdWlro1UAzA/hlUkSyhYW46eOkr53W8+tImE
 dvDOF/frtw2S+4BA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id BADFB118DD;
 Wed, 16 Jun 2021 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623843528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y35bviPbkkOjmm93D3gK12lwacNPvt0LeKgyI0dNVUI=;
 b=u32aaMypTxfVGHDqzYCyOnUN0ryCthwaAj0L04eiDNvOqTLwMfjqxiAhA3vH20Q33O05Lr
 GsdOIFDYkTu3FhoJ6/ve7LCvEwL+6CbrlD9e/YDBCDylBVssAdJVyrExMye8z8ube1oAuh
 JV02ICODfOqKPy+Q65Pin4rLHvzoCWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623843528;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y35bviPbkkOjmm93D3gK12lwacNPvt0LeKgyI0dNVUI=;
 b=drj7saS3wpC6YauCAZldkMZP4R2ifWn5hJmdWlro1UAzA/hlUkSyhYW46eOkr53W8+tImE
 dvDOF/frtw2S+4BA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 1CdALMjiyWAedQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 11:38:48 +0000
Date: Wed, 16 Jun 2021 13:38:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>, Li Wang <liwang@redhat.com>,
 LTP List <ltp@lists.linux.it>
Message-ID: <YMnix3wc3nTTUfXs@pevik>
References: <20210518064506.203781-1-xieziyao@huawei.com>
 <CAEemH2en6C3dUzspuVwNVmRiUeBQWK38bLPT7+ZwErVFQG+i-w@mail.gmail.com>
 <YKXtvaeckoJ2HJzJ@pevik>
 <730f190e-4baa-f854-2c5e-8c6b9d4267df@huawei.com>
 <YMniMEyDjhCLcx8g@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMniMEyDjhCLcx8g@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] typo: Add necessary spaces in the outputs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi Ziyao,

> > Hi!

> > Ping. I checked it based on the latest code. Are there any changes that need
> > to be added?
> Well, as I note previously on some places it'd be better to join string, e.g.
> testcases/kernel/syscalls/setsid/setsid01.c
> testcases/open_posix_testsuite/conformance/interfaces/sched_setparam/2-1.c
> testcases/kernel/syscalls/sysinfo/sysinfo02.c

> The reason is that string on single line is easier to grep.
> That's why checkpatch.pl from kernel relaxed max line from 80 to 100
> (good at least for string).
And because this I'd personally go for joining string most of the time, even
long strings like
testcases/kernel/syscalls/sched_get_priority_max/sched_get_priority_max01.c

Kind regards,
Petr

> But I'm ok to merge it without.

> Kind regards,
> Petr

> > Kind Regards,
> > Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
