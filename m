Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4753DF141
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 17:20:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F3A93C87EE
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 17:20:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3214A3C03FF
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 17:20:20 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8D0521000913
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 17:20:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD2AF22110;
 Tue,  3 Aug 2021 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628004018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLfH8LX+ksfthz/PEkYpTHz1BJyrXAhTX5+yEyYB9hk=;
 b=azF+P+nBFZttaJCjOkbupY4lArp1Dm1bWudnqpa62auPgil9cs2Q/ymJoYsRW7Hf5lDM07
 NGjcNWxiNvLAYRUnkfHp7Zl6eY7HsgQWOxnEasIDcvteMgNhUJ0tRdSSqPaAd0ht+yN2fQ
 6ITXS744SjNdrFPShiIrtsBcy+/QQNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628004018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLfH8LX+ksfthz/PEkYpTHz1BJyrXAhTX5+yEyYB9hk=;
 b=+xctfnk+xLB5aNq62evmR84T3V3X2jnzzwlsl6BPiCoyUpCGaZPVjFrpSeK1g3Lf8D/2FI
 aF3/OKRmwpwCDiDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4B2813B0A;
 Tue,  3 Aug 2021 15:20:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LVKgK7JeCWGxEQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 Aug 2021 15:20:18 +0000
Date: Tue, 3 Aug 2021 17:20:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Message-ID: <YQleuulCqCGvyiju@yuki>
References: <20210802160620.9544-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802160620.9544-1-bogdan.lezhepekov@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] shmget02: check if CONFIG_HUGETLBFS enabled in
 kernel
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
> Two tests call shmget with a flag SHM_HUGETLB, trying to
> allocate the segment using "huge" pages. The hugetlbpage
> support needs to be enabled in kernel (CONFIG_HUGETLBFS),
> otherwise shmget returns EINVAL.

There are a few minor style problems in the patch, have you checked it
with checkpatch.pl and make check as described in:

https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2-coding-style

https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#6-test-contribution-checklist

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
