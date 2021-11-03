Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B639444588
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 17:11:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD84D3C71CC
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 17:11:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ED65E3C6BD9
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 17:11:01 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EE29A14010E1
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 17:11:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 286701F782;
 Wed,  3 Nov 2021 16:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635955860;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZ5Bw9bbcQnwvB+ahmncU96rFplFRgyWlD5lUptw0FU=;
 b=Esv/Q7GZQ0/2gYtgHKdwCKOZwIcPZ2w9jYTAozWOedGS/bIFrWdSQa7MpMgze8nQhwU/VL
 mI/eNgQZ3ZTLBHwFVO3LSdyFMdXqIWDBxvfzERpJfITsqkq+Ad5wwUUeivVB6fOi8kE0e5
 lwPjYKNdbMnW6ed2pNIAx5RPJNalhzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635955860;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZ5Bw9bbcQnwvB+ahmncU96rFplFRgyWlD5lUptw0FU=;
 b=EaOSwNEdp0/yT83InZw1R1AwTg6iJqtJln2p/oHDMTnywOkGdwd69F4JB/6QeH7fo9c51P
 p6fuMKJgF+96X5BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E70A313C91;
 Wed,  3 Nov 2021 16:10:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZSebNpO0gmFdTwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 03 Nov 2021 16:10:59 +0000
Date: Wed, 3 Nov 2021 17:10:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YYK0kgCo/UeUYfkA@pevik>
References: <20211027075615.19832-1-pvorel@suse.cz> <YYKeZRuVLat/xFuS@yuki>
 <YYKhLrXVhCgTfNS4@pevik> <YYKky6iFvFH/WdKd@yuki>
 <YYKoACdUDPtTeoLb@pevik> <YYKs64osfKyAlcC/@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYKs64osfKyAlcC/@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] ver_linux: Print filesystems
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
> > Ah, sorry, I see why I checked it more complicated way:
> > with simply checking exit code you have output twice:

> > df -hT 2>/dev/null || df
> > Filesystem                     Type      Size  Used Avail Use% Mounted on
> > devtmpfs                       devtmpfs   16G  8,0K   16G   1% /dev
> > tmpfs                          tmpfs      16G   91M   16G   1% /dev/shm
> > tmpfs                          tmpfs     6,2G  4,1M  6,2G   1% /run
> > ...
> > df: /run/user/1000/doc: Operation not permitted
> > Filesystem                     Type      Size  Used Avail Use% Mounted on
> > devtmpfs                       devtmpfs   16G  8,0K   16G   1% /dev
> > tmpfs                          tmpfs      16G   91M   16G   1% /dev/shm
> > tmpfs                          tmpfs     6,2G  4,1M  6,2G   1% /run
> > ...

> > => which is IMHO nogo. I could redirect to a file and cut it after, but in that
> > case v2 is IMHO much better.

> But still we don't need that grep part, right?

> So it should be something as:

> 	if `df -hT 2>/dev/null >/dev/null`; then
> 		df -hT
> 	else
> 		df
> 	fi

Yep, how simple, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
