Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A16E3F8A14
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 16:28:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 955B13C2F42
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 16:27:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BBB1B3C0234
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 16:27:57 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 59EE81400E44
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 16:27:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6CD5222D0;
 Thu, 26 Aug 2021 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629988076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WAyad1RvEpt1pr6oE9SxOAAZwTewC3602lYoSPHoccc=;
 b=huGeLww+P1Gp6j0+DtOVg7iegqQvVkeSnWMZiWAlymOKA7/dT6L2QUck1HA5T0NVlXY25B
 ktwulKGn89QeZd1ve5jz0jFrTMzz5dkuD4GK3JxOd7AD4wp8DYpTEIXftNnZq4i4KnrTXK
 LvqtOt/j073YrlmQiX/WG2JBKjW4Xbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629988076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WAyad1RvEpt1pr6oE9SxOAAZwTewC3602lYoSPHoccc=;
 b=6McV9QWw9T666W5dStp4iFhBFRqt1bG5qyeyLdyXDVgXdrrlGlfxx+2O63yzWcOCspzu51
 DzVOeeAx1N4CQyCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8100E13C74;
 Thu, 26 Aug 2021 14:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hW+yHuykJ2EodQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 26 Aug 2021 14:27:56 +0000
Date: Thu, 26 Aug 2021 16:28:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YSek9Snd8uZ8PIEY@yuki>
References: <20210826112212.26394-1-mdoucha@suse.cz>
 <20210826112212.26394-4-mdoucha@suse.cz> <YSeWymK0elcbiqzt@pevik>
 <89e96508-581a-e60c-58cb-37c0c3b3b176@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89e96508-581a-e60c-58cb-37c0c3b3b176@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] Add test for CVE 2018-13405
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
> >> + * Check for possible privilege escalation through creating files with setgid
> >> + * bit set inside a setgid directory owned by a group which the user does not
> >> + * belong to. Fixed in:
> > Maybe this info could be in docparse, but again, that can be fixed during merge.
> 
> Yes, please add the docparse tag during merge.

I will do that for the other two tests as well.

> As for if/else braces, I thought the coding style was to add braces
> around multi-line statements even if it's a single command.

Indeed that's the preferred way.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
