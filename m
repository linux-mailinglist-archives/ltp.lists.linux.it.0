Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E367BEB1
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jan 2023 22:39:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18B333CC766
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jan 2023 22:39:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF6C33C4D1C
 for <ltp@lists.linux.it>; Wed, 25 Jan 2023 22:39:02 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3E9E1100042B
 for <ltp@lists.linux.it>; Wed, 25 Jan 2023 22:39:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B4C621D07;
 Wed, 25 Jan 2023 21:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1674682741;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jA5hj5UIK60tCsPYONBwWlR9qn/BddHKxXRhX3GAEyM=;
 b=HNNigFj0JnRZoAzEKI9ToIPSJGDiOOlEnLrEyNwr31IUPHh6836bJZfZJoIF9dGwnCJ0Ka
 P2WeLVGhN83X+k6+aBE+kYGK4E1snGw4T9Q2WOBTqWu667lN1rhPLZ3TW/9uv4gbKyljxG
 Uxl75JqvpjkjleiufBkpaKy3qyXLobU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1674682741;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jA5hj5UIK60tCsPYONBwWlR9qn/BddHKxXRhX3GAEyM=;
 b=ynn+rRcvEMW5cFvElDvAKskNGR03OBdm+/qmeciCbTWAHOdvZLDItDCzmDVQmshKXYKgbi
 jZs0xyWuK+aA4JAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E85131358F;
 Wed, 25 Jan 2023 21:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3eceMHSh0WPnIQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 25 Jan 2023 21:39:00 +0000
Date: Wed, 25 Jan 2023 22:38:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <Y9GhctPVA+tqzX0H@pevik>
References: <20230120135651.24816-1-rpalethorpe@suse.com>
 <Y8qtvIrfMQP9BlX4@yuki> <87y1pxqltm.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y1pxqltm.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_assert: Fix buffer overflow in scanf
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hello,

> Cyril Hrubis <chrubis@suse.cz> writes:

> > Hi!
> >> The maximum field width of a string conversion does not include the
> >> null byte. So we can overflow the buffer by one byte.

> >> This can be triggered in ioctl_loop01 with -fsanitize=address even if
> >> the file contents are far less than the buffer size:

> >> tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
> >> tst_device.c:93: TINFO: Found free device 1 '/dev/loop1'
> >> ioctl_loop01.c:85: TPASS: /sys/block/loop1/loop/partscan = 0
> >> ioctl_loop01.c:86: TPASS: /sys/block/loop1/loop/autoclear = 0
> >> =================================================================
> >> ==293==ERROR: AddressSanitizer: stack-buffer-overflow on address 0xf5c03420 at pc 0xf7952bf8 bp 0xff9cf9f8 sp 0xff9cf5d0
> >> WRITE of size 1025 at 0xf5c03420 thread T0
> >>     #0 0xf7952bf7  (/lib/libasan.so.8+0x89bf7) (BuildId: f8d5331e88e5c1b8a8a55eda0a8e20503ea0d2b9)
> >>     #1 0xf7953879 in __isoc99_vfscanf (/lib/libasan.so.8+0x8a879) (BuildId: f8d5331e88e5c1b8a8a55eda0a8e20503ea0d2b9)
> >>     #2 0x8071f85 in safe_file_scanf /home/rich/qa/ltp/lib/safe_file_ops.c:139
> >>     #3 0x80552ea in tst_assert_str /home/rich/qa/ltp/lib/tst_assert.c:60
> >>     #4 0x804f17a in verify_ioctl_loop /home/rich/qa/ltp/testcases/kernel/syscalls/ioctl/ioctl_loop01.c:87
> >>     #5 0x8061599 in run_tests /home/rich/qa/ltp/lib/tst_test.c:1380
> >>     #6 0x8061599 in testrun /home/rich/qa/ltp/lib/tst_test.c:1463
> >>     #7 0x8061599 in fork_testrun /home/rich/qa/ltp/lib/tst_test.c:1592
> >>     #8 0x806877a in tst_run_tcases /home/rich/qa/ltp/lib/tst_test.c:1686
> >>     #9 0x804e01b in main ../../../../include/tst_test.h:394
> >>     #10 0xf7188294 in __libc_start_call_main (/lib/libc.so.6+0x23294) (BuildId: 87c7a50c8792985dd164f5af2d45b8e91d9f4391)
> >>     #11 0xf7188357 in __libc_start_main@@GLIBC_2.34 (/lib/libc.so.6+0x23357) (BuildId: 87c7a50c8792985dd164f5af2d45b8e91d9f4391)
> >>     #12 0x804e617 in _start ../sysdeps/i386/start.S:111

> >> Address 0xf5c03420 is located in stack of thread T0 at offset 1056 in frame
> >>     #0 0x805525f in tst_assert_str /home/rich/qa/ltp/lib/tst_assert.c:57

> >>   This frame has 1 object(s):
> >>     [32, 1056) 'sys_val' (line 58) <== Memory access at offset 1056 overflows this variable

> > Uff, looking closely at the scanf manual:

> > String input conversions store a terminating null byte ('\0') to mark
> > the end of the input; the maximum field width does not include this
> > terminator.

> > So do I get it right that scanf() actually writes one byte after the
> > size passed after the % character? That sounds a bit evil to me.

> Yes, I suppose the root cause is null terminated strings. ;-)

Interesting.

I dared to merge it (added your Signed-off-by:).
Thanks!

Kind regards,
Petr

> > Anyways:

> > Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> Thanks

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
