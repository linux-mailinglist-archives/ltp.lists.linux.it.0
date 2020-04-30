Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DA61BFFF9
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 17:19:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 196FB3C5E77
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 17:19:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F35CD3C27EC
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 17:19:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8F79B600801
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 17:19:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21D7DAF17;
 Thu, 30 Apr 2020 15:19:13 +0000 (UTC)
Date: Thu, 30 Apr 2020 17:18:53 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Filip Bozuta <fbozuta1@gmail.com>
Message-ID: <20200430151853.GB3299@rei>
References: <20200423150626.12672-1-fbozuta1@gmail.com>
 <20200423150626.12672-4-fbozuta1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423150626.12672-4-fbozuta1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] testcases/kernel/syscalls/ioctl: Add test
 for RTC ioctls used to turn on/off RTC interrupts
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
Cc: Aleksandar.Markovic@rt-rk.com, laurent@vivier.eu, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
The same comments apply for the next two tests as well.

Also looking closer what these tests do miss compared to the old rtc01.c
tests are checks that alarm actuall fires and that the update interrupts
are propagated as well. Can we please implement these two cases in these
tests as well and get rid of the old test after that?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
