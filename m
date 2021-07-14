Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB813C80F3
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 11:05:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8D5B3C865C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 11:05:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 246063C5580
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:05:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B4BC56008C4
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 11:05:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C63720279;
 Wed, 14 Jul 2021 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626253535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qia1XTdH7psDD3hse9tucWWkz4a1FmX37UOA1JLURTg=;
 b=Tfu0LljbKAWzPLmv9Yky0QgQvJRQpK6AFdYWyJKIzUepSNcOe1JXTuYzr64xOuKtB1xJ8g
 CQ54FgtQBmYcI6wu6Ospwnp50bad3GWomYHf+DPr6I529Ul+hZjMirU6fCVouCid8SzvK1
 OFRoJTj6xis23avLya7TodjiqItKH60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626253535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qia1XTdH7psDD3hse9tucWWkz4a1FmX37UOA1JLURTg=;
 b=OEuDzRTCSiDL01lEROv1cFOxO4Y2RzGk4yFXVe1McZv+PuMiL8+QuouxFP/DWL8oT6UuBI
 7oikHrC5DKgzKhBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03EDE13BF7;
 Wed, 14 Jul 2021 09:05:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZvvoOd6o7mAIGQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 14 Jul 2021 09:05:34 +0000
Date: Wed, 14 Jul 2021 10:40:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YO6i4QqnULLpsoZv@yuki>
References: <20210714055253.1668374-1-lkml@jv-coder.de>
 <871r81pes4.fsf@suse.de>
 <dc6520e5-5bc3-b277-c33a-a553632e27a5@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc6520e5-5bc3-b277-c33a-a553632e27a5@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] squashfs: Add regression test for sanity check
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> + * [DESCRIPTION]
> > I think it is [Description] now.
> Both seem to work and there is no documentation for this.
> But looks the lower case variant is used more often. Will update this 
> for v3.

I started with uppercase but then everybody else decided that only first
letter in uppercase is the right thing. Ideally there should be only
[Description] in the tree at this point.

> >> + *
> >> +
> >> +	/* Create squashfs without any comporession.
> >> +	 * This allows reasoning about block sizes
> >> +	 */
> >> +	TST_EXP_PASS(tst_system(
> >> +		"mksquashfs data image.raw -noI -noD -noX -noF >/dev/null 2>&1"
> > I guess the existing API functions to create an image will not work with
> > squashfs?
> Honestly I don't know what they are... If it is .format_device stuff, 
> then no, this cannot be used
> for squashfs, because the data has to be prepared, before the filesystem 
> can be created.

Indeed, there is not much to be done here.

>  ???????? SAFE_MKDIR("mnt", 0777);
> -?????? TST_EXP_PASS(tst_system("mount -tsquashfs -oloop image.raw mnt"));
> +?????? TST_EXP_PASS(mount(tst_device->dev, "mnt", "squashfs", 0, NULL));

I do not think that it matters that much who allocates the device, if
it's the test library or the kernel code. I guess that in both cases it
just picks up the first free device anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
