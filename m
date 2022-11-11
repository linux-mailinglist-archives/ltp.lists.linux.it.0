Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CCE626015
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Nov 2022 18:07:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04FD93CD5E3
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Nov 2022 18:07:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EACFA3CA956
 for <ltp@lists.linux.it>; Fri, 11 Nov 2022 18:07:41 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3EFEF1000F3B
 for <ltp@lists.linux.it>; Fri, 11 Nov 2022 18:07:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 530121FD4A;
 Fri, 11 Nov 2022 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668186460;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDBbG8ry6JJ7bTWw059rgqAbPchQG00az7uguyflwFo=;
 b=cH5HzBsCoLGODHn0l7J0n+/nBz5mnMLA5gkmqLtyz4P1yP5l0ODWwNM7GwybxzMwiG1ZO+
 PnqbCRItEo8kcTbZFzhB8fVaFJmqsYBAgyF/98UknTm31jfA9oK2r2pkZ1vc6g21r1LSt/
 yIwitK/NBe1NOLoByUCu23UdA9rc8Iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668186460;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDBbG8ry6JJ7bTWw059rgqAbPchQG00az7uguyflwFo=;
 b=XJvhtiiI7g0ZuyiICz2NPtV40vSJd4y/OegaUVjPfUA5bTuslWFzleK932TM3Nqwf5Bev4
 BTrHu3A5AV4wF0Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F48813357;
 Fri, 11 Nov 2022 17:07:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /YKXBVyBbmMTaQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 11 Nov 2022 17:07:40 +0000
Date: Fri, 11 Nov 2022 18:07:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>, kernel-team@android.com,
 ltp@lists.linux.it
Message-ID: <Y26BWsQM33+85Po2@pevik>
References: <20221027215808.4126148-1-edliaw@google.com>
 <20221027215808.4126148-2-edliaw@google.com>
 <8735atww9l.fsf@suse.de> <87y1slvgkm.fsf@suse.de>
 <Y25+IZDZ9/rvSH+E@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y25+IZDZ9/rvSH+E@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 1/1] mmapstress01: refactor to tst_test
 framework
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Thanks for your work! FYI 2 tiny problems sneaked in, see below.

> runtest/mm contained -t 0.20 option, which caused failure. Fixed in:
> https://github.com/linux-test-project/ltp/commit/36321277a294c0467219f650fd76aa1a8d310c1d

@Richie This would be even more important to check automatically. If you're able
to in sparse list test parameters and whether they expect value or are standalone,
adding process to grep in runtest files should not be hard. WDYT?

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
