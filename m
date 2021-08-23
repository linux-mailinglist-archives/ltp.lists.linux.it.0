Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81E3F4BFC
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 15:58:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B4A53C3290
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 15:58:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 544EA3C3290
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:58:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6E54B60006D
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:58:28 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D8BA21F82;
 Mon, 23 Aug 2021 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629727108;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPtY0S0nPFss0CLbLuYhqrUlp1iBBY7/LJoN9/b3BNA=;
 b=IaBNngLNpgaDRTSjyg2+nA5tdakeU0iTxWhJslZkLrNc5yr/j0igBVSD2ck3EQc6x5Sj/i
 1ASeVwAypDfCNDS7TO7PYtOdsn4bOV2Br6tl5A43k/kev+O7WQarT4Vjkd7sv+MgwdPPp3
 VddMOD41O0R8flwOZ5DVyqW5kqPROx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629727108;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPtY0S0nPFss0CLbLuYhqrUlp1iBBY7/LJoN9/b3BNA=;
 b=Cn8/hMW9jGjN8f3lP8DKPysXqRm9gSiU0x++gYZuOvdILaUIDORDeUT4oMUg7GHB6VzdVa
 orLvbFGSQZ0k44BQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D970C13B2A;
 Mon, 23 Aug 2021 13:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id gFixMoOpI2HwLgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 23 Aug 2021 13:58:27 +0000
Date: Mon, 23 Aug 2021 15:58:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YSOpgaQUx4cmuxpb@pevik>
References: <20210804015539.GA22997@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804015539.GA22997@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6,
 4/4] Make argument to tst_umount an absolute path
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Leo,

unfortunately not all tests has been fixed.
df01.sh uses tst_umount as a cleanup function with the default TST_MNTPOINT,
thus we should change it => I'll comment that in the first patch.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
