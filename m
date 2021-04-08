Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 599CC358101
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 12:41:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA0B33C1DCF
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Apr 2021 12:41:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BABC23C19E4
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 12:41:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 615EB2009BC
 for <ltp@lists.linux.it>; Thu,  8 Apr 2021 12:41:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCB3EAFC9;
 Thu,  8 Apr 2021 10:41:49 +0000 (UTC)
Date: Thu, 8 Apr 2021 12:37:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YG7c5EIgBPyXHy20@yuki>
References: <BMXPR01MB2870D7110A3D2AD3DF1B495AEE649@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <cbc294d7-830c-9491-13b1-836be7da043f@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbc294d7-830c-9491-13b1-836be7da043f@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] kdump failure on x86
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
Cc: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > i am trying to run kdump on x86 with 5.5.6 kernel but i am getting 
> > following errors, can someone please tell whats going wrong here. I 
> > have lkdtm config in the kernel and installed kexec-tools as well what 
> > could be the cause of issue ???
> It looks like the testcase is hopelessly outdated... The jprobe 
> interface was removed in linux 4.15 back in 2017 [1]
> The tests needs a major rewrite, to work on kernels newer than 4.15.

I unless anybody wants to invest time into the rewrite we can remove
these as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
