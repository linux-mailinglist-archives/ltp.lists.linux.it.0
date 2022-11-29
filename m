Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CFA63BF12
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Nov 2022 12:33:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 131073CC5AC
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Nov 2022 12:33:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A313B3C0162
 for <ltp@lists.linux.it>; Tue, 29 Nov 2022 12:32:58 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2119F1400751
 for <ltp@lists.linux.it>; Tue, 29 Nov 2022 12:32:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2DD91F8C0;
 Tue, 29 Nov 2022 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1669721577;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVjNCKQeMR7Yf4gEny8jspLFAQ3S3WqaVL2M4vgjWvI=;
 b=rU2FwUMqnGJNna+c0jcwihuxYzFg5PugF0PVX8NirRgUGqTataaP/M9BZKvA9Pdh1tHA42
 K6Twg35jLGCR8BGZwKM0BG8F19N+55Ri2VOLqYDkWct/dIg5cclHKM5BDzzYnnN5sqBNEw
 nD3shMSK/6xyGo7I4KIWxaL0rf+qfTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1669721577;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVjNCKQeMR7Yf4gEny8jspLFAQ3S3WqaVL2M4vgjWvI=;
 b=WdjK8e6/qej4TlO+3M78P03PCH09xaQ0QSQjEUYLS8bAs9eH5mZa5Ww3sjelLc+FvOrLAk
 VHP9BtPR/Yof0hBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6FAD13428;
 Tue, 29 Nov 2022 11:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VF5hK+jthWNAagAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 29 Nov 2022 11:32:56 +0000
Date: Tue, 29 Nov 2022 12:32:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <Y4Xt5vXi3c0tdRkK@pevik>
References: <20221123144746.590890-1-tudor.cretu@arm.com>
 <Y4XmlHZyi2DG9DRT@pevik> <Y4Xnt+OsEt94aZRr@pevik>
 <87mt8at3md.fsf@suse.de> <87iliyt2x7.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87iliyt2x7.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] safe_macros: Fix undefined behaviour in
 vararg handling
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

> Hello,

> This looks pretty trivial to fix actually. We shouldn't pass NULL as
> mode. If it works I'll add the fix and push.
Yes, it fixes it, good point. I was also surprised by NULL.

to whole patchset:
Reviewed-by: Petr Vorel <pvorel@suse.cz>


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
