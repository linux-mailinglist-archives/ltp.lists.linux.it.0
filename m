Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5419D61467C
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Nov 2022 10:17:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F6533CACB9
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Nov 2022 10:17:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6FF0F3CAC57
 for <ltp@lists.linux.it>; Tue,  1 Nov 2022 10:16:55 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2533A1A0088A
 for <ltp@lists.linux.it>; Tue,  1 Nov 2022 10:16:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5747433A0A;
 Tue,  1 Nov 2022 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1667294214;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F/Kb3B3rtnmRaKzp+1OTTrvJQ3JDPgKa3i6BDjFivb0=;
 b=zXejeVTN0BfcrvQtVvhqHEFDz0XHixLOT5jiCl36ay16dyIPoeOW+2o02JXsuvvfZ8DKcf
 OzVj5v6TF9tM4Qe5gh38bWgf87LusYFJSvflJ0kefjLcxGuKOmPhPHvy5JRrFbSKl/4Dg9
 4xuyUMBrCjiyL1RNQEqECP3hBxQ8q3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1667294214;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F/Kb3B3rtnmRaKzp+1OTTrvJQ3JDPgKa3i6BDjFivb0=;
 b=UL4JvvOs7QrsxyYX+PqlMA0GMZygQg6yoSojRtUs9AVZnZi1rpaw4LIj4GG7+fSyXWk92/
 x3DTUdas+afOtpCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DAD11346F;
 Tue,  1 Nov 2022 09:16:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hZL7CQbkYGM1NgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 01 Nov 2022 09:16:54 +0000
Date: Tue, 1 Nov 2022 10:16:52 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "Zhou, You" <you.zhou@intel.com>
Message-ID: <Y2DkBBAL72jXlNPI@pevik>
References: <20221028032103.2050696-1-you.zhou@intel.com>
 <Y1+qkXXu9uqsJaVG@pevik>
 <DM4PR11MB62130CD766817757EBF7683D8A369@DM4PR11MB6213.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR11MB62130CD766817757EBF7683D8A369@DM4PR11MB6213.namprd11.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setfsuid02: Fix a fake failure for setfsuid02
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi You,

> Hi, Petr,

> I try the patch from Avinesh, the test result is normal, so the purpose of this test case is to try to set an invalid uid?

yes, the purpose is to test that setfsuid() syscall fails if an passed invalid fsuid.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
