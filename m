Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CAB6F438D
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 14:17:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9832E3CBDAA
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 14:17:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB2F93CB8BF
 for <ltp@lists.linux.it>; Tue,  2 May 2023 14:17:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 009C71A007F2
 for <ltp@lists.linux.it>; Tue,  2 May 2023 14:17:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4555A21F1D;
 Tue,  2 May 2023 12:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683029834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4yDyCwdaGYMDKyKGEf05YSxkhbStw9wkJ8wjsVis2po=;
 b=PlIpnmjtzXpBhej89yZ3uVk5B73Ja0KmHf4AE3trSoa3zST083dN0mu5PAwUe7NSNxxgIq
 Hozwj7HIb/AhXhWPpppHlz8rOi5RafW5jMPolYLbXqvFPCf2hY3zCzbxo0hnHn4WL5lWq6
 SzjWWcUPc9iAQmPLJDyj1aLXOL+yLC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683029834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4yDyCwdaGYMDKyKGEf05YSxkhbStw9wkJ8wjsVis2po=;
 b=meRnsysVLwIPk2bfDAtQRTim3ZjQbLR1fkczdouqfnE9S1c6IsiElu7ziiYlULvsx2CeJ9
 U3JVsOiddhsxnnAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 27CB7139C3;
 Tue,  2 May 2023 12:17:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UROFNEn/UGS9MwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 02 May 2023 12:17:13 +0000
Date: Tue, 2 May 2023 14:18:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Yang Xu (Fujitsu)" <xuyang2018.jy@fujitsu.com>
Message-ID: <ZFD_h77sIv1BDfzE@yuki>
References: <ZEjsKC6ESB1+mM0H@rei>
 <903b9fe6-6fa3-ca22-a0f8-ff97ffac9338@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <903b9fe6-6fa3-ca22-a0f8-ff97ffac9338@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP release preparations
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I prefer to include my STATX_DIO_ALIGN and mlock cleanup patchset before 
> release.

I merged mlock04. I'm unsure about the mlock03 removal, it seems to be a
regression test after all.

As for STAT_DIO_ALIGN I suppose that we need v5, right?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
