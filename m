Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F98E5F495D
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Oct 2022 20:45:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C21083CA9C7
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Oct 2022 20:45:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF3993C80B3
 for <ltp@lists.linux.it>; Tue,  4 Oct 2022 20:45:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C64A5140118E
 for <ltp@lists.linux.it>; Tue,  4 Oct 2022 20:45:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 893561F7AB;
 Tue,  4 Oct 2022 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664909123;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NIpA+DHR/jeqPflDQYfbIIZ+eKaNKMSMDXXjCu/B3/I=;
 b=uTGJfTdVR029xp0+mpHShNBuDrBlv4PmWcHY+0m9EDw8q2on+YfMncxCPR4XrWwIktEhjX
 AoDUbipY9+iv3fdlC1M6/OQH7DPFvd7LpWdVL1iWO5dbsEBEie201xLh4h/S/7CIxt4tDw
 QicoPkcXKStBKOOnqrsVt2Lc4Rn9kJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664909123;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NIpA+DHR/jeqPflDQYfbIIZ+eKaNKMSMDXXjCu/B3/I=;
 b=6PLwP9CAvSYuaEuFolgvyXhvdpIP4TkNm7CDvgR/0UF529zYvc/BG7Wro2IqfcMdj6fYW4
 04zVv0964b7F0VDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24217139D2;
 Tue,  4 Oct 2022 18:45:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a8WsBkN/PGPNXQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 04 Oct 2022 18:45:23 +0000
Date: Tue, 4 Oct 2022 20:45:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <Yzx/PH0ZHN45WtlF@pevik>
References: <43d65409eb3290b09e1c3a21cb0dc079c5f4849c.1664801307.git.jstancek@redhat.com>
 <938c864ee6bb82ffdee9371bd802642ffedc606c.1664872194.git.jstancek@redhat.com>
 <YzwlBEyDZHEvkMBy@pevik>
 <CAASaF6yxDAqx3+nC5-LN3GNPg9C9vot1RjC+PqUJ6nj=bQpWQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6yxDAqx3+nC5-LN3GNPg9C9vot1RjC+PqUJ6nj=bQpWQQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib: introduce safe_write() retry
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

Hi Jan,

...
> > LGTM. I just wonder if we need to add it to lib/safe_macros.c,

> It's currently shared code.
Ah, I'm sorry.

> > which implements it for the old API. Would it work to add it only to
> > tst_safe_macros.c and tst_safe_macros.h (instead of safe_macros_fn.h)?

> We could have 2 implementations for safe_write, but modifying existing one
> seemed better option. There's no harm supporting new option in old API too.

Sure, np.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
