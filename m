Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08589416FE3
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 12:04:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1C0D3C8F47
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 12:04:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25D5A3C31E7
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 12:04:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 53F601401439
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 12:04:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7551B1FFE2;
 Fri, 24 Sep 2021 10:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632477864;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mn0ZsjJmxfSRFSyzhX8QIOM7kkjml8jy0M1iU39Q9ew=;
 b=MIiO3cUGhJWvoy097BpYbOs2Cr9C3jSpb7yetpx0dZdjEBxymdPIoNCAPpNYpwbmC+Tp/g
 /YkaGYsCBVt/aQNwKxOiBfQUdO9ZMJAbEDHH2BHbH6vYWQHgYfhbfuYCINNzxOAYyQZAK8
 XCcxk6+8tRP5uMWlLwBBZ14YygXg3Qk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632477864;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mn0ZsjJmxfSRFSyzhX8QIOM7kkjml8jy0M1iU39Q9ew=;
 b=uwR7eU2SHx9OBCBwtvZr+bUym6c5i+MCbnfGH6r5ecRLpmuuYapZVs65YpZtOidfarO/sr
 E4weSrFQE0AqTTDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D04CA139F0;
 Fri, 24 Sep 2021 10:04:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lUaMMKWiTWGkRAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 24 Sep 2021 10:04:21 +0000
Date: Fri, 24 Sep 2021 12:04:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: songkai <songkai01@inspur.com>
Message-ID: <YU2iniEPyrNEIOzh@pevik>
References: <20210907235746.112665-1-songkai01@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210907235746.112665-1-songkai01@inspur.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the statistical number of results in the html
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
Cc: wangkaiyuan@inspur.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> From: wangkaiyuan <wangkaiyuan@inspur.com>

> According to the statistical method of ltp-pan on TFAIL TBROK TCONF
> TPASS..., the statistical method of the ltp test result type in 
> genhtml.pl is modified to ensure that the .log format of the ltp 
> result is consistent with the test result in the .html format.

> The original statistical method policy expression "/\ TFAIL\ /" in 
> the original genhtml.pl for the test result type cannot match the 
> "TFAIL:" in the normal test result, causing problems in the 
This could be fixed with :?, right?

> calculation result. At the same time, the statistical method in 
> genhtml.pl cannot guarantee that each test item has only one test 
> result, because the output of a test item may include TFAIL, TCONF,
> and TPASS at the same time.
That's a valid input.

> Signed-off-by: wangkaiyuan <wangkaiyuan@inspur.com> 
>                Chunsing.dey <daichx@inspur.com>
nit: both should have Signed-off-by:, you can also use Co-developed-by:
for the second developer.

nit: there are whitespace errors in the patch.

I do not dare to review it as I've never used the tool.
FYI ltp-pan is deprecated, you can try to use runltp-ng [1] which we'd like to
bring to LTP upstream (to replace ltp-pan and runltp).

Kind regards,
Petr

[1] https://github.com/metan-ucw/runltp-ng

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
