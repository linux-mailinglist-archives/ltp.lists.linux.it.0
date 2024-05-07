Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F0F8BE856
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2024 18:08:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46D783CDDD4
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2024 18:08:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 141B43C04BB
 for <ltp@lists.linux.it>; Tue,  7 May 2024 18:08:39 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6EA291000237
 for <ltp@lists.linux.it>; Tue,  7 May 2024 18:08:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C1CF20CC3;
 Tue,  7 May 2024 16:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1715098116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zwwfq6QkjvFkm+qFtHzPXeWVmQCosOKMFrJPDdHUhgk=;
 b=zN/GYkt0yo8vXSoo96b1GTVI9y+C6a7XEfmkDhux5igbaqUy6n3yTTTXkLRTgsbR/QTO63
 uqIx91nSJ/RkxmzMsBfamO6qe4EeCsuc9P7s4c9DXkaUN+Im7kgk3DFmzao456lNAG9d5V
 y7ENCqgtv/vFkVx/klY/ptYfS0RRsWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1715098116;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zwwfq6QkjvFkm+qFtHzPXeWVmQCosOKMFrJPDdHUhgk=;
 b=lYgpqyxsUm4HOibEvBz3ly8bV/TpqTVCP2UQV2+5Ypcvl8qrWtFQ31xPlRsrpO26wCiTuO
 FbMeRFnyKiwG1EAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1715098116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zwwfq6QkjvFkm+qFtHzPXeWVmQCosOKMFrJPDdHUhgk=;
 b=zN/GYkt0yo8vXSoo96b1GTVI9y+C6a7XEfmkDhux5igbaqUy6n3yTTTXkLRTgsbR/QTO63
 uqIx91nSJ/RkxmzMsBfamO6qe4EeCsuc9P7s4c9DXkaUN+Im7kgk3DFmzao456lNAG9d5V
 y7ENCqgtv/vFkVx/klY/ptYfS0RRsWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1715098116;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zwwfq6QkjvFkm+qFtHzPXeWVmQCosOKMFrJPDdHUhgk=;
 b=lYgpqyxsUm4HOibEvBz3ly8bV/TpqTVCP2UQV2+5Ypcvl8qrWtFQ31xPlRsrpO26wCiTuO
 FbMeRFnyKiwG1EAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6190313A2D;
 Tue,  7 May 2024 16:08:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UxUHFgRSOmb3YQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 07 May 2024 16:08:36 +0000
Date: Tue, 7 May 2024 18:07:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Detlef Riekenberg <wine.dev@web.de>
Message-ID: <ZjpR0YEVchTDcU_y@yuki>
References: <trinity-3d4cbcc6-9f74-4c0e-a556-de3b554a217a-1714907088044@3c-app-webde-bs13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-3d4cbcc6-9f74-4c0e-a556-de3b554a217a-1714907088044@3c-app-webde-bs13>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[web.de]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[web.de]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -3.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Avoid non portable GCC
 extensions without a guard
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
Pushed with a minor whitespace changes, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
