Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24D3A8154
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 15:49:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E8843C8948
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 15:49:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1B9BD3C2E0B
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 15:49:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B75E6600B2D
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 15:49:33 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1CE211FD4A;
 Tue, 15 Jun 2021 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623764973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xM5OKhwLrocjA8oE4d/yeEeeO4IW1yNSqKFrCNFTI/E=;
 b=TJDgKndCu1cOOfgtFt3NDo7AXCPUdn4pPZqKqO0CnjzHEzrzCzic3ykM0MLvDhaVRiV0bx
 IsiCyq4k10/B9H/D34RHA2A2gn6obtV7p3BJaplThHhhHPMYh6CPKddTpUBJG6/b5xqrpi
 Tl7ISBk4lWo2iZce/mw4lrC0jJi9ERw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623764973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xM5OKhwLrocjA8oE4d/yeEeeO4IW1yNSqKFrCNFTI/E=;
 b=9cr4XE56U1ZGpiYEVG2gikP66NHhuUll5rH8viup54wMG5sQahqAmX3QohMYAEpX9nzR2E
 zJQl5FIgS24qLNBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 00459118DD;
 Tue, 15 Jun 2021 13:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623764973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xM5OKhwLrocjA8oE4d/yeEeeO4IW1yNSqKFrCNFTI/E=;
 b=TJDgKndCu1cOOfgtFt3NDo7AXCPUdn4pPZqKqO0CnjzHEzrzCzic3ykM0MLvDhaVRiV0bx
 IsiCyq4k10/B9H/D34RHA2A2gn6obtV7p3BJaplThHhhHPMYh6CPKddTpUBJG6/b5xqrpi
 Tl7ISBk4lWo2iZce/mw4lrC0jJi9ERw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623764973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xM5OKhwLrocjA8oE4d/yeEeeO4IW1yNSqKFrCNFTI/E=;
 b=9cr4XE56U1ZGpiYEVG2gikP66NHhuUll5rH8viup54wMG5sQahqAmX3QohMYAEpX9nzR2E
 zJQl5FIgS24qLNBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id CcAzOuyvyGAuIAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 15 Jun 2021 13:49:32 +0000
Date: Tue, 15 Jun 2021 15:23:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YMip56WLtbAl8Gf2@yuki>
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615074045.23974-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/3] API: Remove TEST macro usage from library
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
Applied thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
