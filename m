Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8CB3FEFDE
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 17:10:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F7373C939D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 17:10:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 94C6A3C2949
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 17:09:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 894C7140121F
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 17:09:57 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEA5A1FFBD;
 Thu,  2 Sep 2021 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630595396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6va+iPlRzwIer/VsZZ/4jra5iN0rS3uVNXpkLF4NaPw=;
 b=DFdeFFbBSOzmYtkR0FVQWSAk99fppc45aaDf5CJodsVrQl1J/S3XE05KJLQqpd9XBIrA1/
 3MPlCXluQjIcVx0pZLL/ZC3wRFDAZlDwi47u54WLVCYdjSRT3zFvtvTIMX6WyrU7ZPADGt
 juC6w5QPKRqSPU5rd42P5cLuXEv9Thg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630595396;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6va+iPlRzwIer/VsZZ/4jra5iN0rS3uVNXpkLF4NaPw=;
 b=RgC2V9FW68R5XMJiTq5seoEBbnVALpgHEIe+qzfCFJxm+etK3NCBoXdGV5rMRWU3a5pgo0
 m7ER/3ovZajgEPBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8BF1B13AA5;
 Thu,  2 Sep 2021 15:09:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ft4BIETpMGHlNAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 15:09:56 +0000
Date: Thu, 2 Sep 2021 17:09:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YTDpQxDDPY3HCli6@pevik>
References: <20210902103740.19446-1-pvorel@suse.cz>
 <015140e9-0eba-4057-4a91-35d958af2bb8@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <015140e9-0eba-4057-4a91-35d958af2bb8@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/4] checkbashisms.pl in make check + fixed docs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi

> one general question about this: How to we want to handle false-positives?
Good point, thanks! Generally we can disable things which does not work for=
 us.
I'd be pragmatic, if something works on most of shells and let's disable it,
just not disable needed test just due one false positive.

> e.g.:

> $ checkbashisms testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> possible bashism in
> testcases/kernel/controllers/memcg/functional/memcg_lib.sh line 387 ('(('
> should be '$(('):
> =A0=A0=A0=A0=A0=A0=A0 local limit_down=3D$(( PAGESIZE * ((limit + PAGESIZ=
E - 1) / PAGESIZE)
> ))

> This is obviously a false positive, but could probably be adding a space
> between the brackets.

The only thing how to get away this was to introduce another variable:
	local limit_psize=3D$((limit + PAGESIZE - 1))
	local limit_down=3D$((PAGESIZE * (limit_psize / PAGESIZE)))

I'm not sure if it's not POSIX, but works because supported by all shells
(similar case to 'typo' not being POSIX but POSIX extensions). Maybe we sho=
uld
report it.

> or

> $ checkbashisms testcases/kernel/connectors/pec/cn_pec.sh
> possible bashism in testcases/kernel/connectors/pec/cn_pec.sh line 127
> (should be >word 2>&1):
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 done <&${fd_act}

> This one is just a false positive and I have no clue how to prevent this.
> I think the script does not like the <&, but this is posix...
The same here, I'm not sure if it's POSIX. &> definitely is not POSIX.
I remember we were talking about it. Can we avoid it somehow?

Kind regards,
Petr


> Joerg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
