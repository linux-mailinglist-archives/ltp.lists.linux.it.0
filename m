Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 835741BAB68
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 19:36:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F331E3C2972
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 19:36:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 178243C08C9
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 19:36:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7108F60075A
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 19:35:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1187EAE4E;
 Mon, 27 Apr 2020 17:36:04 +0000 (UTC)
Date: Mon, 27 Apr 2020 19:36:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Filip Bozuta <fbozuta1@gmail.com>
Message-ID: <20200427173602.GA14375@dell5510>
References: <20200423150626.12672-1-fbozuta1@gmail.com>
 <20200423150626.12672-3-fbozuta1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423150626.12672-3-fbozuta1@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] testcases/kernel/syscalls/ioctl: Add test
 for RTC ioctls used to read and set RTC alarm time
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
Cc: Aleksandar.Markovic@rt-rk.com, laurent@vivier.eu, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Filip,

> +		for (int i = 0; i < 3; i++)
Minor nit: we still support old gcc 4 in centOS 6 build, which doesn't use C99
by default, thus it fails when int is defined inside loop. Trivial fix (in case
there is no v2 needed it could be changed by person who merges):
int i;
for (i = 0; i < 3; i++)
...

https://api.travis-ci.org/v3/job/680146814/log.txt
/usr/src/ltp/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c: In function 'setup':
/usr/src/ltp/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c:32: warning: left-hand operand of comma expression has no effect
/usr/src/ltp/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c: In function 'run':
/usr/src/ltp/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c:95: error: 'for' loop initial declarations are only allowed in C99 mode
/usr/src/ltp/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c:95: note: use option -std=c99 or -std=gnu99 to compile your code

https://travis-ci.org/github/pevik/ltp/builds/680146805

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
