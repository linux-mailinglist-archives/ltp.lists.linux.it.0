Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB05C35C562
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 13:36:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C8803C747E
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 13:36:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF32D3C1CB7
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 13:36:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5E4B91000233
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 13:36:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 44BADAF2F;
 Mon, 12 Apr 2021 11:36:20 +0000 (UTC)
Date: Mon, 12 Apr 2021 13:28:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <YHQu6l0xp8VmG+ry@yuki>
References: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <60619D5B.6090507@fujitsu.com>
 <BMXPR01MB2870D0447A89D1BEE08EDCA7EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
 <BM1PR01MB2868C0458678E57C87BBC708EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
 <YG7Mbc/ZTnD85SAh@yuki>
 <BM1PR01MB28686329F64867227F9F9279EE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
 <YG7asu6B4EEa1HUD@yuki>
 <BM1PR01MB2868EDABC10031EC53337C1FEE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR01MB2868EDABC10031EC53337C1FEE749@BM1PR01MB2868.INDPRD01.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP msgstress03,
 msgstress04 failure on linux 5.10.19 and 5.10.22
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Thanks for your response and help for understanding the reason of testcase failure
> I too running the test on the machine with 8GB of RAM and the value for the msgmmni is 32000 by default and i have changed 16000 then also i am not able to see any diff in output.
> 
> Anything else that i can try ??

Try with less, I suppose 8000 should work fine.

If estimating how many processes we can run was easy the test would have
been fixed a long time ago.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
