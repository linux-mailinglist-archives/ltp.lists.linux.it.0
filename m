Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A155BE68E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Sep 2022 15:00:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C940B3CAD32
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Sep 2022 15:00:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0476E3CACF5
 for <ltp@lists.linux.it>; Tue, 20 Sep 2022 15:00:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C335F600915
 for <ltp@lists.linux.it>; Tue, 20 Sep 2022 15:00:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE2751F388;
 Tue, 20 Sep 2022 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663678808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hmxzzceFySWF7FDkgMvPDa4jE2xrhDD/oharkY8RAI4=;
 b=1yltlC+inTth8AuNpmOx8XIzzgSUP5NVMy6ihLwE6Pp/pv0YB4aXUwjn/w4Bhzu2pYyJ1S
 K9O25zD060MMDkA8BG0BYl7P61GuFgM4gFa9/PwO9VBfBCozIqHJif3AVwTf72rQbob2T2
 TIVKc753JEoX2hcr5JWnyubOkvRKT24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663678808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hmxzzceFySWF7FDkgMvPDa4jE2xrhDD/oharkY8RAI4=;
 b=xBdczlPhM88CCjM2H91+GLAHyJh+guiw1jc7eGQOEiexGCsibGHm4Jr33060GRa//Yx7eH
 /9tOwZWUVcasZ0Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B441C13ABB;
 Tue, 20 Sep 2022 13:00:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xmD/K1i5KWNvaAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 20 Sep 2022 13:00:08 +0000
Date: Tue, 20 Sep 2022 15:02:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Dylan Jhong <dylan@andestech.com>
Message-ID: <Yym5zuSh98g1ByH+@yuki>
References: <20220919074324.722547-1-dylan@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919074324.722547-1-dylan@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] kernel/uevent: Adjust the number of uevents
 dynamically in uevent02
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
Cc: alankao@andestech.com, minachou@andestech.com, dminus@andestech.com,
 x5710999x@gmail.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> When CONFIG_SMP is not selected, CONFIG_RPS will not be enabled. Causes the
> kernel to not create rx queues in sysfs[1] when creating tun devices.
> Uevent02 will check if the rx queue exists, adjust the uevents dynamically
> in setup() to pass this test.
> 
> [1]: https://github.com/torvalds/linux/blob/3245cb65fd91cd514801bf91f5a3066d562f0ac4/net/core/net-sysfs.c#L1109

Pushed, thanks.

> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---

It's customary to add a note here (after the ---) about changes done
since the last patch revision, sometimes it's hard to spot the change
without a hint.  In this case I nearly missed the difference since it
was one static keyword missing in v3.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
