Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8983D0EA5
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 14:13:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF82D3C6BD7
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 14:13:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D582C3C6160
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 14:13:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1C8A71000D41
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 14:13:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB8AA22467;
 Wed, 21 Jul 2021 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626869601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BPqT8Ib4PdvRPPvbM9n0K8bEh1BVwmWVAL63ayp4Wfk=;
 b=z92JVMWyUfG8mNXSCc/Ex9jrjdj4yzAWq5Sh6VNF9Kjx1wPB8yuBB4A0Cxj5SoEcQlOCRT
 9Rsh8A4cC6WfPuVBN8ggCbJelVRjXZ9bCMa9UqDYto0YjQGeMXbe2vquwNWHQZKCk7NRuN
 rDloQh2xzmt9Ru84Nh81qrW1YYLO5+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626869601;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BPqT8Ib4PdvRPPvbM9n0K8bEh1BVwmWVAL63ayp4Wfk=;
 b=dgTXnbSxN5Zfa/AE3KgiMIiRtg6KDWu97v9tiT075GggsquPHBdPKB7IZjKKsP3iAWE5cU
 NBIDw7wBya4ZNaAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5DF513B39;
 Wed, 21 Jul 2021 12:13:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PLEmL2EP+GCwTwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 21 Jul 2021 12:13:21 +0000
Date: Wed, 21 Jul 2021 13:47:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YPgJan6PMGu+Pb/J@yuki>
References: <20210715050812.1950884-1-lkml@jv-coder.de>
 <60EFF034.6070800@fujitsu.com>
 <4aaba9d9-e013-3c12-500a-647ff2c0b82d@jv-coder.de>
 <YO//gakCvqaDZl9f@yuki>
 <f2fd323e-a5da-2959-d130-2d3c0aa59e89@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2fd323e-a5da-2959-d130-2d3c0aa59e89@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] squashfs: Add regression test for sanity check
 bug
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Also the dev_min_size = 1 does not have any efect here, since it can be
> > used only to request bigger-than-default size and gets ignored here. I
> > guess that we can merge this as it is and I will add needs_loopdev to
> > the tst_test structure later which will just allocate loop device and
> > pass it down to the test.
> This is true, but the test should also specify what it needs. If for 
> whatever reason DEV_SIZE_MB is redefined to a smaller value, the test 
> would still work.
> To be honest, for "1" it doesn't matter. But it it was bigger, it makes 
> total sense to specify the size if the test knows it...

I was thinking about it and we can easily allow the test to request
smaller than the default size with a pretty minimal change:

diff --git a/lib/tst_device.c b/lib/tst_device.c
index c91c6cd55..4ef802c41 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -300,7 +300,7 @@ const char *tst_acquire_device__(unsigned int size)
        unsigned int acq_dev_size;
        uint64_t ltp_dev_size;

-       acq_dev_size = MAX(size, DEV_SIZE_MB);
+       acq_dev_size = size ? size : DEV_SIZE_MB;

        dev = getenv("LTP_DEV");


This shouldn't break anything while it allows better controll for the
test over the device size.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
