Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 816137564BE
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jul 2023 15:23:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1CEB3C999C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jul 2023 15:23:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF4D93C999C
 for <ltp@lists.linux.it>; Mon, 17 Jul 2023 15:23:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 63B70140096F
 for <ltp@lists.linux.it>; Mon, 17 Jul 2023 15:23:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 571E12198E;
 Mon, 17 Jul 2023 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689600232;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPjap6M3HBhyRf4RCOvlY/k3KKQKkPYFsbYWPCY+BYc=;
 b=Tj3nVf9zH6/+IJYSsYEgPawpp+kAKdwVfXbutD3rSAtl0PP9qaKpMg2jUf8SqtIfqSHNxx
 t5D0xW3GNykvGLqs9NpMjzgLr75tZXC6Ftl1SRDsTB1vSvHSBQ+dBN7XGVjEPEVeGlGsy/
 0Rhrqeawqu9Wdnb6C91BNN7BNSjiGi8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689600232;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPjap6M3HBhyRf4RCOvlY/k3KKQKkPYFsbYWPCY+BYc=;
 b=+pJN5xAeKL01V0r1/s8dgGZ5A1dctSOslBCVIJ3tP3SD7b/30zcz2joUXKCu9KfVEbKkqx
 E8j6orOM3VXIhzBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DEC413276;
 Mon, 17 Jul 2023 13:23:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id omh5MudAtWTxSgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 17 Jul 2023 13:23:51 +0000
Date: Mon, 17 Jul 2023 15:23:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Message-ID: <20230717132350.GA1127512@pevik>
References: <20230518075931.1344979-1-khorenko@virtuozzo.com>
 <20230518075931.1344979-3-khorenko@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230518075931.1344979-3-khorenko@virtuozzo.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] scsi_debug/tlibio/lio_read_buffer: Always
 return total amount of read bytes
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

Hi Konstantin,

patchset merged, thank you!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
