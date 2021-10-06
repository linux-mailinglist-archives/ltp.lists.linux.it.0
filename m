Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A542463C
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Oct 2021 20:44:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F80E3C7F38
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Oct 2021 20:44:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD2123C663F
 for <ltp@lists.linux.it>; Wed,  6 Oct 2021 20:44:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3F398140052D
 for <ltp@lists.linux.it>; Wed,  6 Oct 2021 20:44:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3BCC01FEF6;
 Wed,  6 Oct 2021 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1633545886;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDmbrCKhWwX6iqiVBjbdelCjcM/jh9fKGuFPUIDf9b4=;
 b=ebNepZCH4VAzSKdOq0i0cVISdF2uJopLpI34hE81H9pU6GyZZcC9lWCxKEEDmADhZQjNc4
 vaGtDH51gGEgjXLIZ53XVLpZZAxdsfS17lnst44KiN8wUPF/5dciItNORlfjKn7d/cFmIs
 pZwkyv1bUl8XQMjW3vb+YL/X7dpYMRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1633545886;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDmbrCKhWwX6iqiVBjbdelCjcM/jh9fKGuFPUIDf9b4=;
 b=htNducp8gFoCVn1/pVYIvz0aYSp1MaqCkLCUwEQfK7lkhXV7xR3id1JWSmYb1i2xkhudEx
 W0vRsyXPfocq7KAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F7DE13E68;
 Wed,  6 Oct 2021 18:44:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VSf9AZ7uXWGdfAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 06 Oct 2021 18:44:46 +0000
Date: Wed, 6 Oct 2021 20:44:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YV3unO2KOG5sfxSK@pevik>
References: <20211004084015.16100-1-pvorel@suse.cz>
 <YV2iuKQyO/ZhpqoW@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YV2iuKQyO/ZhpqoW@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] setgroups03: Fix running more iterations
 (-i 2)
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
> > +	ltpuser = SAFE_GETPWNAM(cleanup, uid);
> > +	SAFE_SETEUID(cleanup, ltpuser->pw_uid);

> Can we please push the GETPWNAM() to the test setup and pass only uid to
> the test setup functions?
Ah, sure, sorry for overlooking obvious improvement.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
