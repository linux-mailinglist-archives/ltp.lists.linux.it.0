Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79762415ADF
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 11:25:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E33E3C8F64
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 11:25:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00FC73C8F5C
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:25:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7EB05601062
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 11:25:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8F87221F7;
 Thu, 23 Sep 2021 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632389110;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BdhX8jaZC2H1xds7vDfrNnhQMAIkWzrTYtRpc3eV18k=;
 b=DYc7XUDIV4+R8qDnTOrcCFH/klc6raYqvtPDFsjunm9y5eZK8US9gSEDSyX5YzgFqhAUG4
 4ODxtixd2JYgoYXaeDUypMmgY1b3hgo9obEkiRoCRAsxyypcRvCciy7f462sBeY2VuYJhl
 1EAzRVXip/KGGuNVO+FqdE3aEUkZWBg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632389110;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BdhX8jaZC2H1xds7vDfrNnhQMAIkWzrTYtRpc3eV18k=;
 b=ZcR5LjsqtGooNTQiLAnbF1cxGkpvzvkcfvwqoWZlBPjG5XptmSpSo2BgJwN2RGn0sh7/iU
 LCBsj2Yc2jJzq2CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9504E13DCD;
 Thu, 23 Sep 2021 09:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZutVIvZHTGGvPAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 23 Sep 2021 09:25:10 +0000
Date: Thu, 23 Sep 2021 11:25:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YUxH9AYCf+1LG5Nr@pevik>
References: <20210902010814.32448-1-zhanglianjie@uniontech.com>
 <YTBo6ZS2GKWb8edF@pevik>
 <c0a5fa20-dd40-161c-352f-407b8a2d6b08@uniontech.com>
 <YUxDQBYdEXdf5RPf@pevik>
 <5f3c73e2-3361-9b9a-5359-79afe87a11be@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f3c73e2-3361-9b9a-5359-79afe87a11be@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/7] syscalls/clone01: Convert to new API
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

> Oh thank you. ^_^
FYI you'll be able to change state of your patches.
But in cases like this it helps us to handle the queue (we're always late).

Kind regards,
Petr

> On 2021-09-23 17:05, Petr Vorel wrote:
> > Hi zhanglianjie,

> > > Hi,
> > > Please ignore other patches about clone testcases and just focus on
> > > v3.thanks.

> > FYI you can register on our patchwork instance [1] with email you use for
> > sending patches and update status of your patches (e.g. set patches to be
> > ignored to "Superseded" or "Changes Requested").

> > Kind regards,
> > Petr

> > [1] https://patchwork.ozlabs.org/register/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
