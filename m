Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE278C1F5
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Aug 2023 12:07:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B46483CC0EE
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Aug 2023 12:07:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BCCAF3CA99A
 for <ltp@lists.linux.it>; Tue, 29 Aug 2023 12:07:22 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 39013600F2C
 for <ltp@lists.linux.it>; Tue, 29 Aug 2023 12:07:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A75BF1F45F;
 Tue, 29 Aug 2023 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693303641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OoU33+eVzYN7Eu01LFVt9xi9/He+lwoKiJHV+wgHj+0=;
 b=p8FapDvFis/7zEhCdHHGuFaXciaIwho71wCBU8tW6BlPJXhyNhFSXPaiFlqnPxhnYsqp/h
 F0xH+eo7Cs3vGcBzUBy826Dy6UYvEWwrxz2k8rT5ixU/w0ShctrtIcLbO+2SumVE3JD3mv
 W6rTFbcpVxi4Siz9XTznboBBOS0F8g0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693303641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OoU33+eVzYN7Eu01LFVt9xi9/He+lwoKiJHV+wgHj+0=;
 b=oC5BkGCcxX7u+pUdZGrG6KX20dmsU7uZA9+AoD9vZTMLlPAuPDqHannGaQyTpoN4Mk8nYw
 bB61NkHrg2l95lBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C2A8138E2;
 Tue, 29 Aug 2023 10:07:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d/PpLljD7WQmbwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 29 Aug 2023 10:07:20 +0000
Date: Tue, 29 Aug 2023 12:07:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <ZO3DRdzCOeU0J-kP@rei>
References: <20230823130904.26051-1-andrea.cervesato@suse.de>
 <ZO2dfwOM0pK8xz1j@rei>
 <1717e228-1556-4ba0-8f91-4cb7160c3908@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1717e228-1556-4ba0-8f91-4cb7160c3908@suse.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Add epoll_wait05 test
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
> If patch is fine, is it possible to push it removing the reference?

Sure, will do.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
