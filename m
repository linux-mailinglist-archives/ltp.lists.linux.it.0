Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FC43023CF
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:47:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F9D73C5F33
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:47:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 796D23C3035
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:47:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0F66E1000A20
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:47:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5C23BAC9B;
 Mon, 25 Jan 2021 10:47:29 +0000 (UTC)
Date: Mon, 25 Jan 2021 11:48:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: gengcixi@gmail.com
Message-ID: <YA6iAkYyomg1WkTS@yuki.lan>
References: <20210111083711.1715851-1-gengcixi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111083711.1715851-1-gengcixi@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 0/3] add rtctime libs and rtc02 case
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
I've fixed a few problems in the patchset and pushed, thanks.

Mostly minor changes such as constifying the rtc_dev string pointer and
a few typo fixes, but also added missing function prototypes to the rtc_time.h

> 1. keep tst_rtc_gettime and tst_rtc_settime no change to "static 
>    inline"(V1) for some compile warning and referring to 
>    tst_clock_gettime in tst_clocks.h

This was due to missing include to sys/ioctl.h which declares the _IO()
macro used to define RTC_RD_TIME and RTC_SET_TIME

> 2. in .h, use identifiers format "/* XXX /*" rather than "// XXX" 
>    for kernel checkpatch "WARNING" as follow:

I guess that we may as well switch to the kernel format then.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
