Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED09444485
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 16:17:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 914AB3C72CD
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 16:17:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A65E3C2FCF
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 16:17:24 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4A331600FA5
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 16:17:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98E031FD38;
 Wed,  3 Nov 2021 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635952642;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uph62r7ZJr4TRaGOvh18DYDMRsq/HVKUbZg0RxmJNc=;
 b=v9MwJU3q91f4OKBX0U5af5i2XDQkz1QD6yESJ413bzfYe8Kbj4Ztki+twxRBTOr3JW+qF+
 lgRM6NPzzX2ChGPRW5GThtD5dNx+OBxwZAwqABPeSXzOIu1s7tDu7dIgVf8PvzxCeDUdwB
 3++4+3vAAvnagMYkP4TNbLXSplkbhQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635952642;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4uph62r7ZJr4TRaGOvh18DYDMRsq/HVKUbZg0RxmJNc=;
 b=wZASFsoFdAo1MOCW7gFIKwSVFtijewtoQ8lqVW9WKGt4wr64Q5TTmAgQKmuqoGrIYTkqEn
 VzIEtH/DeqiNVOCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CBD013C74;
 Wed,  3 Nov 2021 15:17:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ScbtGAKogmFnMgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 03 Nov 2021 15:17:22 +0000
Date: Wed, 3 Nov 2021 16:17:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YYKoACdUDPtTeoLb@pevik>
References: <20211027075615.19832-1-pvorel@suse.cz> <YYKeZRuVLat/xFuS@yuki>
 <YYKhLrXVhCgTfNS4@pevik> <YYKky6iFvFH/WdKd@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYKky6iFvFH/WdKd@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
> > If you want simpler form, I suggest
> > df -hT 2>/dev/null || df

> Looks good.
Ah, sorry, I see why I checked it more complicated way:
with simply checking exit code you have output twice:

df -hT 2>/dev/null || df
Filesystem                     Type      Size  Used Avail Use% Mounted on
devtmpfs                       devtmpfs   16G  8,0K   16G   1% /dev
tmpfs                          tmpfs      16G   91M   16G   1% /dev/shm
tmpfs                          tmpfs     6,2G  4,1M  6,2G   1% /run
...
df: /run/user/1000/doc: Operation not permitted
Filesystem                     Type      Size  Used Avail Use% Mounted on
devtmpfs                       devtmpfs   16G  8,0K   16G   1% /dev
tmpfs                          tmpfs      16G   91M   16G   1% /dev/shm
tmpfs                          tmpfs     6,2G  4,1M  6,2G   1% /run
...

=> which is IMHO nogo. I could redirect to a file and cut it after, but in that
case v2 is IMHO much better.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
