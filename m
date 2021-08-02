Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ECC3DD4DC
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 13:43:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 769563C8AD4
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 13:43:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C40CF3C5D34
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 13:43:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7C9111400BF3
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 13:43:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B8AF21F7F;
 Mon,  2 Aug 2021 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627904608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmcLl6aPTa8dAmV3botLRb0BLrt5XSGywOe78GPfP5o=;
 b=sPbClz/eNvc6VhDn4eJ65/jdmfWbkZ5K2XUXc9D0mnRSmP94bDfPFJ9w+8SGkYKh9ZHBLo
 uJE9IygJj9qh4oFGGduFE1wZbazyQLgGVyJI7iB1s890yjgRoK426bX3Cvk9D/8PhQuwRQ
 fLdAKBObOQv1+2FGKftlAK+yerMPY8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627904608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmcLl6aPTa8dAmV3botLRb0BLrt5XSGywOe78GPfP5o=;
 b=N7HKVr3SYOC+snuKXR+m3+LQio6cNyp6qK9Cv6eP8Ucr7rDuSGx8rBDocHBrHefgB2MWnY
 kiRD/i76+z10w1AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 878D513C66;
 Mon,  2 Aug 2021 11:43:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i27AH2DaB2GvWQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 02 Aug 2021 11:43:28 +0000
Date: Mon, 2 Aug 2021 13:43:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YQfaZsdzHbPrhCV0@yuki>
References: <20210730133155.31284-1-chrubis@suse.cz>
 <d99456d3-c3d3-a180-7d0c-55bc3042e63c@jv-coder.de>
 <YQfZLXZznHjvlGJW@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQfZLXZznHjvlGJW@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_device: Allow more control over the
 device size
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > This is not enough. tst_acquire_device__ calls tst_acquire_loop_device, 
> > that again has MAX(size, DEV_SIZE_MB).
> > But it should be sage to substitute it for size ? size : DEV_SIZE_MB as 
> > well.
> 
> Right, that was the old API function to get loop devices which was
> called from old API testcases. Looks like there are no old API tests
> that work with loop devices anymore, so this function should be removed
> from the public API as well. I will send v2 patchset.

Uff, that was tst_acquire_device_() not tst_acquire_loop_device() and
tst_acquire_device_() is still in use.

I'm really looking forward to a day where we can finally remove the old
API from the library...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
