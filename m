Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA739B9AF
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 15:18:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCDE43C7FC7
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 15:18:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 866E83C4EE0
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 15:18:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A372E2010A1
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 15:18:29 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E60DF1FD80;
 Fri,  4 Jun 2021 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622812708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mh6icUAmBaUnCTtE4npzfSiX8tv1FmXkiPuADMgMq9s=;
 b=t/XQbOTw/BHXVpxJDErFchW4DFYL8gElKjNRaExR2S1I8zqg+E641R4bJ3hJrcIU8RLFa/
 8WyZEinbqHlKFA4IZnTfClsO1l8sK1ZntHGEnaE5RONgQKsysXij4HB8oxRD3xcKx3Zlv4
 hIOFXxaYQX/mpwtMbEWnQMKbKMv2OAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622812708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mh6icUAmBaUnCTtE4npzfSiX8tv1FmXkiPuADMgMq9s=;
 b=H7o3CXDKW3WPWKqocJGW/MiXSJuPp3JQvUtmmWLFjcPfgWSjWX139K7fXsRFwtKb2b+El9
 rxU03rSKPY/U8OBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C9784118DD;
 Fri,  4 Jun 2021 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622812708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mh6icUAmBaUnCTtE4npzfSiX8tv1FmXkiPuADMgMq9s=;
 b=t/XQbOTw/BHXVpxJDErFchW4DFYL8gElKjNRaExR2S1I8zqg+E641R4bJ3hJrcIU8RLFa/
 8WyZEinbqHlKFA4IZnTfClsO1l8sK1ZntHGEnaE5RONgQKsysXij4HB8oxRD3xcKx3Zlv4
 hIOFXxaYQX/mpwtMbEWnQMKbKMv2OAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622812708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mh6icUAmBaUnCTtE4npzfSiX8tv1FmXkiPuADMgMq9s=;
 b=H7o3CXDKW3WPWKqocJGW/MiXSJuPp3JQvUtmmWLFjcPfgWSjWX139K7fXsRFwtKb2b+El9
 rxU03rSKPY/U8OBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ftz9LyQoumAcVAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 04 Jun 2021 13:18:28 +0000
Date: Fri, 4 Jun 2021 14:52:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YLoiF6Wy6cALM0Yy@yuki>
References: <20210604111434.21422-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604111434.21422-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 0/2] Libclang based analyzer
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
> Compared to the Coccinelle version it's very ugly. However I think
> this will allow us to get all the low hanging fruit without creating
> major problems for test developers.

I had a look at the code and it does not seem to be that bad. It's
longer due to some boiler plate and more explicit but not necessarily
ugly.

> I guess it could be run during CI if we either fix all the existing
> TEST() usages in the library or add an ignore list. I already have a
> Coccinelle script to help with the former.

I will have a look at the patches generated by coccinelle, I supposed
that we want to merge them regardless.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
