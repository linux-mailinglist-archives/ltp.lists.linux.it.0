Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FB3AB2A0
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 13:32:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 494C03C7184
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 13:32:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3FFD53C30EA
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 13:32:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 494DD601AEA
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 13:32:10 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9399B1FDBF;
 Thu, 17 Jun 2021 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623929529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4NeHC3yeBSSChEKeD16Cp7CAoxdRgPxUnYgMrzG32KA=;
 b=fj8DEfRtiYPzKTq3h9/NUBVzjQDWJqL9jf0xQa/xNBOeAvEgDqCyXkF+Uo3lvCnSexve+/
 zO/GrsqBf56EW2LC+wyCqiZN1fNoQzdnuyxbCkbkP3P2ZO15hIC+7/fTEje39dxHiOTi//
 hErnr1Utv5HuRePGdMdyNrpMXq3UpJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623929529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4NeHC3yeBSSChEKeD16Cp7CAoxdRgPxUnYgMrzG32KA=;
 b=26fM+3nqJqVin7nUFrmJfVnPMWNqPN1jrJ2l445JV5K9IIzL2wMlBBx0QsJqntNeRvz6bc
 lr9qytsW0RX+mPBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7375A118DD;
 Thu, 17 Jun 2021 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623929529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4NeHC3yeBSSChEKeD16Cp7CAoxdRgPxUnYgMrzG32KA=;
 b=fj8DEfRtiYPzKTq3h9/NUBVzjQDWJqL9jf0xQa/xNBOeAvEgDqCyXkF+Uo3lvCnSexve+/
 zO/GrsqBf56EW2LC+wyCqiZN1fNoQzdnuyxbCkbkP3P2ZO15hIC+7/fTEje39dxHiOTi//
 hErnr1Utv5HuRePGdMdyNrpMXq3UpJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623929529;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4NeHC3yeBSSChEKeD16Cp7CAoxdRgPxUnYgMrzG32KA=;
 b=26fM+3nqJqVin7nUFrmJfVnPMWNqPN1jrJ2l445JV5K9IIzL2wMlBBx0QsJqntNeRvz6bc
 lr9qytsW0RX+mPBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id K4b/Grkyy2DgBQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 17 Jun 2021 11:32:09 +0000
Date: Thu, 17 Jun 2021 13:06:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YMsstiT0RunhPAoA@yuki>
References: <20210603114208.8152-1-chrubis@suse.cz>
 <YLpcOFM7Us0s+y87@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLpcOFM7Us0s+y87@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] doc: Modernize test-writing-guidelines
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
> nit: sometimes you use 2 blank lines at the end of the chapter, sometimes just one.

Unified it on single blank line and pushed, thanks for the review.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
