Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81AA3F5DE
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2025 14:26:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D15283C8E74
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2025 14:26:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 44D453C8E74
 for <ltp@lists.linux.it>; Fri, 21 Feb 2025 14:26:37 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A3B021031A28
 for <ltp@lists.linux.it>; Fri, 21 Feb 2025 14:26:36 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D5DD1FDFE;
 Fri, 21 Feb 2025 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1740144395;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEOy6s9Fr29W74iVoTAmhHdlaT5UAVEdwNEBASseQ9k=;
 b=WJXZ7U+Cl/ArGoE3jMJhlOt+btrYmpY6CLbdatIvPtR53oqfAXacqSZpPAAUOkwd5QksZY
 YeB3arZRJ1uJ487/k5LF7wAVzmp+8GLoL44TUxIIQOqcXQ95kIETtHy3tbt2SHvmnJbiD2
 SGBwz1YjGHa7D5JV7qlB3ZJigJfBgDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1740144395;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEOy6s9Fr29W74iVoTAmhHdlaT5UAVEdwNEBASseQ9k=;
 b=uLm9uqhgNUJtR0jdPim1PmLJKRM6oSmuB3SWgjw2C5NpM2a54Lj/WBBhTtU4Q5Fc65BiHu
 LujG1xtRqHtWfYBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1740144395;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEOy6s9Fr29W74iVoTAmhHdlaT5UAVEdwNEBASseQ9k=;
 b=WJXZ7U+Cl/ArGoE3jMJhlOt+btrYmpY6CLbdatIvPtR53oqfAXacqSZpPAAUOkwd5QksZY
 YeB3arZRJ1uJ487/k5LF7wAVzmp+8GLoL44TUxIIQOqcXQ95kIETtHy3tbt2SHvmnJbiD2
 SGBwz1YjGHa7D5JV7qlB3ZJigJfBgDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1740144395;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kEOy6s9Fr29W74iVoTAmhHdlaT5UAVEdwNEBASseQ9k=;
 b=uLm9uqhgNUJtR0jdPim1PmLJKRM6oSmuB3SWgjw2C5NpM2a54Lj/WBBhTtU4Q5Fc65BiHu
 LujG1xtRqHtWfYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A907136AD;
 Fri, 21 Feb 2025 13:26:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4QQaFQp/uGescgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 21 Feb 2025 13:26:34 +0000
Date: Fri, 21 Feb 2025 14:26:28 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>,
 Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it,
 Martin Doucha <martin.doucha@suse.com>
Message-ID: <20250221132628.GA2790724@pevik>
References: <20250210151316.246079-1-amir73il@gmail.com>
 <20250210151316.246079-4-amir73il@gmail.com>
 <yvpm5aiigldl2ftkatepoddjitxs64r6n2igcatetyukpbp3re@35yc3muudqdf>
 <CAOQ4uxhex0Dz+c-DM9emgqhsYMar08NC4JSuc9TkiDujmN7h6A@mail.gmail.com>
 <20250211190943.GC1911494@pevik>
 <CAOQ4uxg6T+oO-RUcs+AA2W2emC18hboQMec7NUnQ=zFqoNPjbA@mail.gmail.com>
 <20250220204253.GA2719924@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250220204253.GA2719924@pevik>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-0.999]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.987]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,suse.cz,lists.linux.it,suse.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto]; 
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/4] fanotify24: Add test for FAN_PRE_ACCESS and
 FAN_DENY_ERRNO
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

Hi all,

FYI remaining 3rd and 4th patch merged.
Thanks to all!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
