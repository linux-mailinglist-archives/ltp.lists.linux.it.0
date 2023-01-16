Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08C66BC56
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Jan 2023 11:59:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C1503CB4DF
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Jan 2023 11:59:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D5B33CB4BF
 for <ltp@lists.linux.it>; Mon, 16 Jan 2023 11:59:28 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8A5E6600769
 for <ltp@lists.linux.it>; Mon, 16 Jan 2023 11:59:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72594676D0;
 Mon, 16 Jan 2023 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1673866767; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6K9XZQGtqGYVV4RUhM/UMro0E5BQVE2JbCNE+roDPd4=;
 b=HUeV4NK6aOzFwscDDn+5JitPW41QMhcBA2FgYs+DZLHtHLgdWqtYT9T+vx7SY5ZLUg8cnA
 JptV8VUvXN+LkOlxkENZFd+JLj22S8tTMe5SYjomnFV2I0HlAqBY20L98aaXuLnAg21msB
 tOn+6ejEr2N/pfhBi4tDG7YkXBN69Hg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1673866767;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6K9XZQGtqGYVV4RUhM/UMro0E5BQVE2JbCNE+roDPd4=;
 b=7rtk5MWbeTz8M/frYKyhp53Dz+tXu4vMgguDx2PnfYcGvzbWGJ6PrAW5yv8iirGZGRSlJ7
 sIybL/fP3CeL9nDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 575CD138FA;
 Mon, 16 Jan 2023 10:59:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a/npFA8uxWNFYwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 16 Jan 2023 10:59:27 +0000
Date: Mon, 16 Jan 2023 12:01:00 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Y8UubJZcN89y77AA@yuki>
References: <20230106113126.5304-1-wegao@suse.com>
 <20230111195231.23596-1-wegao@suse.com> <Y8EnKACJtJJ80uw+@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8EnKACJtJJ80uw+@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Add PATH to tst_rhost_run.sh
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> @Li, @Richie, @Xu, @Cyril: anything against moving
> testcases/kernel/containers/share/ content to testcases/lib? They are used
> mainly for container tests, but since tst_net.sh depends on it, IMHO they should
> be in library. This helps to fix make dependency for tst_rhost_run.sh.

Not at all, these tools looks quite generic. Also prefixing them with
tst_ sounds good to me as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
