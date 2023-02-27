Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A77BD6A46C4
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Feb 2023 17:12:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1FA43CDE4E
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Feb 2023 17:12:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 87DDC3CAC68
 for <ltp@lists.linux.it>; Mon, 27 Feb 2023 17:12:01 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9DB1B603460
 for <ltp@lists.linux.it>; Mon, 27 Feb 2023 17:12:00 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EF2192183A;
 Mon, 27 Feb 2023 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677514319;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VDxhgMWAT/31Iof7xV97DGiWBj9ryM5BkomWznc2jik=;
 b=tfZzxvFtPI6cf7fP7mKIR0vdjAUGdAzoZzUKPuaMsQh6Ufrl/FX4kBcs1fmtm+IQ4rWTs2
 KU3HnWOl+rSroyD0vB+/HCgxx8uB4vcpONiE/l2eYjkG4Wkl5MfxWJ8KHw/Q94H3zcPrmG
 AUVk6nNlWumokcoC3AZ9rVTLqIa67jQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677514319;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VDxhgMWAT/31Iof7xV97DGiWBj9ryM5BkomWznc2jik=;
 b=c/6qzlh/vJd4sFxqS0Sdl+cPDUslkimFhxG/ePgLqN59m+Wf7aVkaJ7geglG2DYDve6AZg
 bl4mrNj6JgOSKkBA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 24F382C141;
 Mon, 27 Feb 2023 16:11:58 +0000 (UTC)
References: <20230227144402.GA23697@localhost> <Y/zFIdiWccmVzddV@yuki>
 <20230227151709.GA12774@localhost> <Y/zMBSx4p3gqRC3J@yuki>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Mon, 27 Feb 2023 15:52:59 +0000
Organization: Linux Private Site
In-reply-to: <Y/zMBSx4p3gqRC3J@yuki>
Message-ID: <87bklfay0l.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Question on .needs_cgroup_ctrls for cgroupv2
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> So .needs_cgroup_ctrls can not used anymore for ONLY V2 case?
>> Since i encounter "tst_cgroup.c:848: TCONF: V2 'memory' controller
>> required, but it's mounted on V1" when i add ".needs_cgroup_ctrls =
>> (const char *const []){ "memory", NULL }".

You should see this works fine on Tumbleweed where pure V2 is the
default.

>
> Each controller can be mounted as V1 or as V2 but not both at the same
> time. It depends on how the system is booted, the default on most
> distributions is mixed V1 and V2 at the moment. If you want V2 system
> you have to reboot with systemd.unified_cgroup_hierarchy=1.

Yes that is the kernel command line option which you can add through
GRUB (unless I am mistaken).

Or it can be specified in the systemd configuration somewhere.

LTP does not try to remount CGroups if a controller is not on the
required version. If you need to test the unified hierarchy or a V2
controller then the simplest thing to do is configure systemd to only
use V2 (unified).

The exception is if the needed controller is not mounted already, then
LTP will mount it. This is the case if you, for e.g., use Rapido or some
buildroot config with CGroups in the kernel, but not userland.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
