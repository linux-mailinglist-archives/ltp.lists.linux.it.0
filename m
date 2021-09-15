Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1640C455
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 13:21:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 384943C89A4
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 13:21:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E4473C1D42
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 13:21:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 55D541401326
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 13:21:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FB5D20052;
 Wed, 15 Sep 2021 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631704909;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DobFknrJVTnudMrzkGyKnAM/yAFcE21OP+yjM+7EAHg=;
 b=y50QdqlnpLce0A1uXKH7VbGreUkzlC3J+uWY+vmI0TKsbQTbPnTm2zZbOBwVETWFr7Qgp/
 GMfOUBzyvMlW8Jozn6izr8oxXgtOONls91g2OWkMYE/dPbXzoYZs7rhtiJVQSeshGJD3Tf
 HPiWgzTILYHAKWWkNPMfPDQCaqhHk2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631704909;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DobFknrJVTnudMrzkGyKnAM/yAFcE21OP+yjM+7EAHg=;
 b=zI9/9BDJa5WRRIyCvOl0C6BVsT81E7Rf9Y6WigPBvN3zPpLVeh9P2KTe90C3kze9HvWI+1
 YZc6IhDdrmMNiVAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FF6513C37;
 Wed, 15 Sep 2021 11:21:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ICELBU3XQWGvFgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 15 Sep 2021 11:21:49 +0000
Date: Wed, 15 Sep 2021 13:21:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Dai Shili <daisl.fnst@fujitsu.com>, ltp@lists.linux.it
Message-ID: <YUHXS0Z8WIQSxN/q@pevik>
References: <1631699402-17607-1-git-send-email-daisl.fnst@fujitsu.com>
 <YUHQByoKzIm/cMfz@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YUHQByoKzIm/cMfz@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/cpuacct: Fix deleting directories
 errors
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

Hi Dai, Xu,

...
> Sorry for introducing a regression and for correction.
> I'll revert on your behalf commit d6cc08592 ("controllers/cpuacct: Simplify
> deleting directories"), with your explanation.

FYI Merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
