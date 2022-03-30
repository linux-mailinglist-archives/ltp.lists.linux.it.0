Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E90034EBD73
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 11:17:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2330B3C9DED
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Mar 2022 11:17:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2888E3C089F
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 11:17:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 681561400550
 for <ltp@lists.linux.it>; Wed, 30 Mar 2022 11:17:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8DD821F38C;
 Wed, 30 Mar 2022 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648631843;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GN1p8UuXV+lsJY3Z2UaDVbeihQjx8hjGcksr9G2H/gs=;
 b=ovFCHwZrOEUDXjqg+AzwOhDPxGvVPhXYsIR5W4LxYJFLOoLZqXutWq40wdEle/EMfCpYyv
 deH98zjZ0dBPrU2sGzMoF7PbWqYHJ7QqUlkXXqQeehnENjlIKfdIhthcj9YSdKC9PSFRze
 Xq8/gDBxkBr+eE6klOHv3gZsJqNckfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648631843;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GN1p8UuXV+lsJY3Z2UaDVbeihQjx8hjGcksr9G2H/gs=;
 b=R661xYHEKc+lliJb1gE142oayiuN5G5FA/dnLsYTVDKmyuMgLHjLysfxmZvFjrxRs1jNzH
 uTT7l6ssJ8xgaqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5871F13A60;
 Wed, 30 Mar 2022 09:17:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MF2PEyMgRGIKVwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 30 Mar 2022 09:17:23 +0000
Date: Wed, 30 Mar 2022 11:17:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YkQgIdUEMSzLCiR9@pevik>
References: <20220204194648.32165-1-pvorel@suse.cz>
 <20220204194648.32165-3-pvorel@suse.cz> <Yh98mQNybj1R1Kga@yuki>
 <YjoUprPfTYN1nlt4@pevik> <YkQfyh3ppXPGMarB@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YkQfyh3ppXPGMarB@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] broken_ip-nexthdr.sh: Check IPv6 support
 before forcing it
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
> > I tried to implement this [1] (or [2] if I force push), and using getopts the
> > end of the script only would require also to move loading '. tst_test.sh' at the
> > end of *all* the test scripts because setup functions needs to be loaded before
> > sourcing tst_test.sh. Do we want this?

> Sounds reasonable. I would go even further and put the line that sources
> the tst_test.sh to be last line in the test.
+1, I'll also update docs examples and mention it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
