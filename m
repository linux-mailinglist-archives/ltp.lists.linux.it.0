Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A459A3DDC7F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 17:32:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 495413C8AD7
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 17:32:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F17E3C5FE5
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 17:32:10 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CA41A600821
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 17:32:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D48C1FFB7;
 Mon,  2 Aug 2021 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627918329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6Fw0RiU8mTtfPvJ5dVMzPDwrGt+SAM1vV7yZtA/nY4=;
 b=iLpw8VUjUjmX0RIYApXRw/X5wnIIF9tLDB0ngwxt99sAAJfBxv3oy6qJXcxsXeyKevT82P
 HsS3m1bdE6rLoo3LQSGEBOyK7dntwKxHyTnnK/4BPWV+dhj0DJr70epOgHzFDQaJqJ/lKb
 naLPEpT0FdbqxbYc8WPfkS3lfS22rrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627918329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6Fw0RiU8mTtfPvJ5dVMzPDwrGt+SAM1vV7yZtA/nY4=;
 b=Ei8optFuRefJdM3OAAJXdnrBEauY0QrA7Bn2fpNT3eKLcvnOkTdQQfmtjoFiinHKZZ7q6x
 g2ENUeNxnduT4KCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC8B313C76;
 Mon,  2 Aug 2021 15:32:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AlQrOPgPCGHZJAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 02 Aug 2021 15:32:08 +0000
Date: Mon, 2 Aug 2021 17:32:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Message-ID: <YQgP/l/raDZlW5W7@yuki>
References: <20210802143236.28791-1-bogdan.lezhepekov@suse.com>
 <YQgET2rMo4BSNnrq@yuki>
 <VI1PR04MB49588E7EF259841E40FD6CAE93EF9@VI1PR04MB4958.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR04MB49588E7EF259841E40FD6CAE93EF9@VI1PR04MB4958.eurprd04.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] shmget02: check if CONFIG_HUGETLBFS enabled in
 kernel
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
> Thanks a lot for reviewing.
> 
> I agree that reading kconfig every time is not fun. But would it be better to read it once into global variable? My concern is that your solution implicitly changes expected values that might confuse people who occasionally don't look at the bottom of program.
> 
> How about:
> 
> inline void _hugetlbfs_supported()
> {
> struct tst_kconfig_var kconfig = {
> .id = CONFIG_HUGETLBFS,
> .id_len = sizeof(CONFIG_HUGETLBFS)-1,
> };
> 
> tst_kconfig_read(&kconfig, 1);
> hugetlbfs_supported = kconfig.choice == 'y';
> }
> ....
> 
> static void do_test(unsigned int n)
> {
> struct tcase *tc = &tcases[n];
> pid_t pid;
> 
> if (((tc->flags & SHM_HUGETLB) == SHM_HUGETLB) && ! hugetlbfs_supported)
> {
> tst_brk(TCONF,
> "Unsuitable kernel config: CONFIG_HUGETLBFS missing");
> }
> ....

This does not check that we get a proper error when SHM_HUGETLB is not
supported by the kernel though, which is something that should be
checked as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
