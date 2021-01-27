Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABAF3056CA
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 10:23:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23F5E3C79E3
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 10:23:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9F0143C01C3
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 10:23:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 361191A00EA6
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 10:23:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79AB2AD57;
 Wed, 27 Jan 2021 09:23:39 +0000 (UTC)
Date: Wed, 27 Jan 2021 10:24:45 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YBExXT8HzFAGsTNI@yuki.lan>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <CAEemH2csSFf7Ujz8H+KV7hTdmDVsxn5_oW2JZbwY=NsJUSat_w@mail.gmail.com>
 <2021012714540739834212@chinatelecom.cn>
 <CAEemH2dhpbm19HEaHkhv1WE+70VkDjM9C5L1-KJZqPX2G2BgrQ@mail.gmail.com>
 <CAEemH2cwEzLr0dXvskn-hprn0-iOCr=rrLPgDUE1YdbnHu=5AQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cwEzLr0dXvskn-hprn0-iOCr=rrLPgDUE1YdbnHu=5AQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: ltp <ltp@lists.linux.it>,
 "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I sent to you the case swapping01 solving this(via FILE_LINES_SCANF)
> > already, feel free to take an reference:
> >
> > https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swapping/swapping01.c#L85
> >
> 
> Or, maybe we can extract this process into a function and put it in
> tst_memutils.h, to convinently reuse by other testcases too?
> 
> void tst_get_MemAvailable(void);

Please do not use CamelCase.

It should be tst_get_mem_available(void) and it should also return
unsigned long.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
