Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5DD452E24
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Nov 2021 10:39:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 175C73C87AF
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Nov 2021 10:39:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD7093C0CB4
 for <ltp@lists.linux.it>; Tue, 16 Nov 2021 10:39:08 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2F9BE600669
 for <ltp@lists.linux.it>; Tue, 16 Nov 2021 10:39:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D32E7218B5;
 Tue, 16 Nov 2021 09:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637055546;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CezZgvPKd6a0fiWdap0e7b8v4ujAL7uGRptnSu+aiY4=;
 b=U+zXF8lsfcUWMyYm/OE/wusdtcwuCwXZk6svluSx7H2/0++N6gJMz2MJ+c0sqs6yntGyfI
 HcI8GDAuc73WmZxzOjuYi1dnqPLPQ6EZcE+TAajX/+mDrH5+xXYDUMLl+9Y29OXZE2jIti
 hdN1zw8XMEgaJdiwNOs/fIPv4xY0+0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637055546;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CezZgvPKd6a0fiWdap0e7b8v4ujAL7uGRptnSu+aiY4=;
 b=/aqNPel9n01A3K6GW+PR6qEoBhLrupH14AKEkWxX4MxuL13M0sus99rwcyCC+yfoftWAPv
 7hMF+E+pVLbk63Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A35B613BFD;
 Tue, 16 Nov 2021 09:39:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bw/sJTp8k2HGEQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 16 Nov 2021 09:39:06 +0000
Date: Tue, 16 Nov 2021 10:39:04 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Matthew Bobrowski <repnop@google.com>
Message-ID: <YZN8OLkeUUBP8yDK@pevik>
References: <cover.1636451496.git.repnop@google.com>
 <0671d89befb5b24fc3bac510c69811668c39cdf5.1636451496.git.repnop@google.com>
 <CAOQ4uxiFsnvA-8y1mJ7uHccd4bqZUYJkK5Y2R1+KtgDK_OH4Sw@mail.gmail.com>
 <YZLPEjJkII1evtEc@pevik> <YZMEMwvdpA/IXz+P@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZMEMwvdpA/IXz+P@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] syscalls/fanotify: Add a helper macro
 which checks for the presence of specific fanotify initialization flag(s)
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Matthew, Amir,

> On Mon, Nov 15, 2021 at 10:20:18PM +0100, Petr Vorel wrote:
> > Hi Matthew, Amir,

> > Tested on two distro kernels with support (Tumbleweed and Debian unstable)
> > + on various old kernels without support.

> > Merged with very minor fixes, see diff below.

> Noted the changes, they're fine by me. Thanks for the merge!
+1

> > NOTE: we now support basic static analysis + checkpatch formatting check - run
> > make check in fanotify directory or make check-fanotify20.

> Oh, that's great, I had no idea. Quickly running it, looks like
> there's a bunch of clean up required for some of the older tests. Will
> have to get around to doing that at some point.

Thanks a lot, that's really appreciated.
Also, thanks a lot you and Amir for really maintaining fanotify tests.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
