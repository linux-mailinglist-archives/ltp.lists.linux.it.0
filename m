Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA4940156
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2024 00:44:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67DB53D1D79
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2024 00:44:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6B2013D1BF9
 for <ltp@lists.linux.it>; Tue, 30 Jul 2024 00:44:32 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EAE4C1A00437
 for <ltp@lists.linux.it>; Tue, 30 Jul 2024 00:44:31 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 612F321B1A;
 Mon, 29 Jul 2024 22:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722293070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVaUpYUaPXnNdUsiI5li10udfZlwxsTEobFcQ9iV/hI=;
 b=G7MBGwcl3mPSUvPQMU6wUhKICsOyH1VETIoKfMy2guNPpd0Jkpfv7x7FLl7HLkMSiALzBB
 XlOsCw6znQJHLqY1fwtHTKSvTFogKOlpBj9NgcGo7NBS4Gw7XnR5uta7xdBmOIkRCDUJC5
 5iFudfYqfChknrC1HNp0/z75vzJuLaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722293070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVaUpYUaPXnNdUsiI5li10udfZlwxsTEobFcQ9iV/hI=;
 b=dFPY9CWEIT4ZIilxttlhf31292vWkS6XwdtFHZN3Pl7lWhFtaGSN4RSW5U4u9qQZQLhY3f
 v9xGam3goVmh5RCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722293070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVaUpYUaPXnNdUsiI5li10udfZlwxsTEobFcQ9iV/hI=;
 b=G7MBGwcl3mPSUvPQMU6wUhKICsOyH1VETIoKfMy2guNPpd0Jkpfv7x7FLl7HLkMSiALzBB
 XlOsCw6znQJHLqY1fwtHTKSvTFogKOlpBj9NgcGo7NBS4Gw7XnR5uta7xdBmOIkRCDUJC5
 5iFudfYqfChknrC1HNp0/z75vzJuLaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722293070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVaUpYUaPXnNdUsiI5li10udfZlwxsTEobFcQ9iV/hI=;
 b=dFPY9CWEIT4ZIilxttlhf31292vWkS6XwdtFHZN3Pl7lWhFtaGSN4RSW5U4u9qQZQLhY3f
 v9xGam3goVmh5RCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F3A6138A7;
 Mon, 29 Jul 2024 22:44:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CFEXDk4bqGY6awAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 29 Jul 2024 22:44:30 +0000
Date: Tue, 30 Jul 2024 00:44:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: =?utf-8?B?6Lev5paQ?= <lufei@uniontech.com>, LTP <ltp@lists.linux.it>
Message-ID: <20240729224429.GB1307422@pevik>
References: <20240606065506.1686-1-lufei@uniontech.com>
 <20240624015245.54968-1-lufei@uniontech.com>
 <20240624015245.54968-2-lufei@uniontech.com>
 <20240708042318.GA119348@pevik>
 <tencent_3E63AE5B3A162AF97E6505AD@qq.com>
 <20240708085430.GA122879@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708085430.GA122879@pevik>
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 MIME_GOOD(-0.10)[text/plain]; SINGLE_SHORT_PART(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] acct01: add EFAULT errno check.
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

Hi Lu,

merged, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
